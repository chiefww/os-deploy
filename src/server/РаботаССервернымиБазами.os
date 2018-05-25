
//** @name РаботаССервернымиБазами
//** @desc Модуль для работы с серверными базами и кластерами серверов

//* @desc Отключает сеансы и соединения базы данных.
//* @param ОписаниеБазы {ОписаниеБазы} Объект описания базы.
//* @param ИмяАдминистратора {Строка} Имя администратора кластера (необязательный).
//* @param Пароль {Строка} Пароль администратора кластера (необязательный).
Процедура ОтключитьСеансы(ОписаниеБазы, ИмяАдминистратора = Неопределено, Пароль = Неопределено) Экспорт
	
	Коннектор = ПолучитьКоннектор(ОписаниеБазы.ИмяКоннектора);
	Агент = ПолучитьАгент(Коннектор, ОписаниеБазы.ПолучитьИмяСервера());
	
	Для Каждого Кластер Из ПолучитьСписокКластеров(Агент) Цикл
		Агент.Authenticate(Кластер, ИмяАдминистратора, Пароль); // TODO: администратор кластера
		
		Для Каждого Процесс Из ПолучитьСписокПроцессов(Агент, Кластер) Цикл
			СоединениеСПроцессом = ПолучитьСоединениеСПроцессом(Коннектор, Процесс, ОписаниеБазы.Пользователь, ОписаниеБазы.Пароль);
			
			БазаКластера = НайтиБазуПоИмени(ПолучитьСписокБазКластера(Агент, Кластер), ОписаниеБазы.ПолучитьИмяБазы());
			
			Если БазаКластера = Неопределено Тогда
				Продолжить; // TODO: сообщение, если база не найдена ни в одном кластере
			КонецЕсли;
			
			Для Каждого Сеанс Из ПолучитьСписокСеансов(Агент, Кластер, БазаКластера) Цикл
				Если ВРег(Сеанс.AppID) = ВРег("SrvrConsole") Тогда
					Продолжить;
				КонецЕсли;
				
				Агент.TerminateSession(Кластер, Сеанс);
			КонецЦикла;
			
			Для Каждого Соединение Из ПолучитьСписокСоединений(Агент, Кластер, БазаКластера) Цикл
				Если ВРег(Соединение.Application) = ВРег("SrvrConsole") Тогда
					Продолжить;
				КонецЕсли;
				
				СоединениеСПроцессом.Disconnect(Соединение);
			КонецЦикла;
		КонецЦикла;
	КонецЦикла;
	
КонецПроцедуры

//* @desc Устанавливает признак блокировки регламентных заданий в базе данных.
//* @param ОписаниеБазы {ОписаниеБазы} Объект описания базы.
//* @param Блокировка {Булево} Значение признака блокировки.
//* @param ИмяАдминистратора {Строка} Имя администратора кластера (необязательный).
//* @param Пароль {Строка} Пароль администратора кластера (необязательный).
Процедура УстановитьБлокировкуРегламентныхЗаданий(ОписаниеБазы, Блокировка, ИмяАдминистратора = Неопределено, Пароль = Неопределено) Экспорт
	
	Коннектор = ПолучитьКоннектор(ОписаниеБазы.ИмяКоннектора);
	Агент = ПолучитьАгент(Коннектор, ОписаниеБазы.ПолучитьИмяСервера());
	
	Для Каждого Кластер Из ПолучитьСписокКластеров(Агент) Цикл
		Агент.Authenticate(Кластер, ИмяАдминистратора, Пароль); // TODO: администратор кластера
		
		Для Каждого Процесс Из ПолучитьСписокПроцессов(Агент, Кластер) Цикл
			СоединениеСПроцессом = ПолучитьСоединениеСПроцессом(Коннектор, Процесс, ОписаниеБазы.Пользователь, ОписаниеБазы.Пароль);
			
			База = НайтиБазуПоИмени(ПолучитьСписокБазПроцесса(СоединениеСПроцессом), ОписаниеБазы.ПолучитьИмяБазы());
			
			Если База = Неопределено Тогда
				Продолжить; // TODO: сообщение, если база не найдена ни в одном кластере
			КонецЕсли;
			
			База.ScheduledJobsDenied = Блокировка;
			СоединениеСПроцессом.UpdateInfoBase(База);
		КонецЦикла;
	КонецЦикла;
	
КонецПроцедуры

Функция ПолучитьКоннектор(ИмяКоннектора)
	
	Возврат Новый COMОбъект(ИмяКоннектора);
	
КонецФункции

Функция ПолучитьАгент(Коннектор, ИмяСервера)
	
	Возврат Коннектор.ConnectAgent(ИмяСервера);
	
КонецФункции

Функция ПолучитьСписокКластеров(Агент)
	
	Возврат Агент.GetClusters();
	
КонецФункции

Функция ПолучитьСписокПроцессов(Агент, Кластер)
	
	Возврат Агент.GetWorkingProcesses(Кластер);
	
КонецФункции

Функция ПолучитьСоединениеСПроцессом(Коннектор, Процесс, ИмяАдминистратора, ПарольАдминистратора)
	
	Сервер = Процесс.HostName;
	Порт = Формат(Процесс.MainPort, "ЧГ=0");
	
	РабочийПроцесс = Коннектор.ConnectWorkingProcess(СтрШаблон("%1:%2", Сервер, Порт));
	РабочийПроцесс.AddAuthentication(ИмяАдминистратора, ПарольАдминистратора);
	
	Возврат РабочийПроцесс;
	
КонецФункции

Функция ПолучитьСписокБазКластера(Агент, Кластер)
	
	Возврат Агент.GetInfoBases(Кластер);
	
КонецФункции

Функция ПолучитьСписокБазПроцесса(СоединениеСПроцессом)
	
	Возврат СоединениеСПроцессом.GetInfoBases();
	
КонецФункции

Функция НайтиБазуПоИмени(СписокБаз, ИмяБазы)
	
	Для Каждого База Из СписокБаз Цикл
		Если База.Name = ИмяБазы Тогда
			Возврат База;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Неопределено;
	
КонецФункции

Функция ПолучитьСписокСеансов(Агент, Кластер, БазаКластера)
	
	Возврат Агент.GetInfoBaseSessions(Кластер, БазаКластера);
	
КонецФункции

Функция ПолучитьСписокСоединений(Агент, Кластер, БазаКластера)
	
	Возврат Агент.GetInfoBaseConnections(Кластер, БазаКластера);
	
КонецФункции
