
#Использовать v8runner

Перем Идентификатор Экспорт;
Перем СтрокаПодключения Экспорт;
Перем Пользователь Экспорт;
Перем Пароль Экспорт;
Перем ВерсияПлатформы Экспорт;
Перем КлючРазрешения Экспорт;
Перем ИмяКоннектора Экспорт;

Перем ИмяСервераSQL Экспорт;
Перем ИмяБазыSQL Экспорт;

Перем Конфигуратор;

Процедура ПриСозданииОбъекта(ИД, Значения) Экспорт
	
	СтрокаПодключения = Значения.Получить("conn");
	
	Если СтрокаПодключения = Неопределено Тогда
		ВызватьИсключение "Не указана строка подключения к базе";
	КонецЕсли;
	
	Идентификатор = ИД;
	Пользователь = Значения.Получить("user");
	Пароль = Значения.Получить("pwd");
	ВерсияПлатформы = Значения.Получить("version");
	КлючРазрешения = Значения.Получить("key");
	ИмяКоннектора = Значения.Получить("comconnector");
	
	Если Не ЭтоФайловаяБаза() Тогда
		ИмяСервераSQL = Значения.Получить("sql-server");
		ИмяБазыSQL = Значения.Получить("sql-base");
		
		Если Не ЗначениеЗаполнено(ИмяСервераSQL) Тогда
			ИмяСервераSQL = ПолучитьИмяСервера();
		КонецЕсли;
		
		Если Не ЗначениеЗаполнено(ИмяБазыSQL) Тогда
			ИмяБазыSQL = ПолучитьИмяБазы();
		КонецЕсли;
	КонецЕсли;
	
	Если Не ЗначениеЗаполнено(ВерсияПлатформы) Тогда
		ВерсияПлатформы = "8.3";
	КонецЕсли;
	
	Если Не ЗначениеЗаполнено(ИмяКоннектора) Тогда
		ВерсияКоннектора = Неопределено;
		
		Если СтрНачинаетсяС(ВерсияПлатформы, "8.3") Тогда
			ВерсияКоннектора = "83";
		ИначеЕсли СтрНачинаетсяС(ВерсияПлатформы, "8.2") Тогда
			ВерсияКоннектора = "82";
		ИначеЕсли СтрНачинаетсяС(ВерсияПлатформы, "8.1") Тогда
			ВерсияКоннектора = "81";
		КонецЕсли;
		
		Если ЗначениеЗаполнено(ВерсияКоннектора) Тогда
			ИмяКоннектора = СтрШаблон("V%1.COMConnector", ВерсияКоннектора);
		КонецЕсли;
	КонецЕсли;
	
КонецПроцедуры

Функция ПолучитьКонфигуратор() Экспорт
	
	Если Конфигуратор = Неопределено Тогда
		Конфигуратор = Новый УправлениеКонфигуратором;
		
		Конфигуратор.УстановитьКонтекст(
			СтрШаблон("/IBConnectionString ""%1""", СтрокаПодключения),
			Пользователь,
			Пароль);
			
		Конфигуратор.ИспользоватьВерсиюПлатформы(ВерсияПлатформы);
		
		Если ЗначениеЗаполнено(КлючРазрешения) Тогда
			Конфигуратор.УстановитьКлючРазрешенияЗапуска(КлючРазрешения);
		КонецЕсли;
	КонецЕсли;
	
	Возврат Конфигуратор;
	
КонецФункции

Функция ПолучитьСтрокуПодключенияCOM()
	
	МассивПараметров = Новый Массив;
	МассивПараметров.Добавить(СтрокаПодключения);
	
	Если ЗначениеЗаполнено(Пользователь) Тогда
		МассивПараметров.Добавить(СтрШаблон("Usr=""%1""", Пользователь));
		МассивПараметров.Добавить(СтрШаблон("Pwd=""%1""", Пароль));
	КонецЕсли;
	
	Если ЗначениеЗаполнено(КлючРазрешения) Тогда
		МассивПараметров.Добавить(СтрШаблон("uc=""%1""", КлючРазрешения));
	КонецЕсли;
	
	Возврат СтрСоединить(МассивПараметров, "; ");
	
КонецФункции

Функция ПолучитьCOMСоединение() Экспорт
	
	Если Не ЗначениеЗаполнено(ИмяКоннектора) Тогда
		ВызватьИсключение "Не удалось автоматически определить имя коннектора";
	КонецЕсли;
	
	Объект = Новый COMОбъект(ИмяКоннектора);
	Соединение = Объект.Connect(ПолучитьСтрокуПодключенияCOM());
	
	Возврат Соединение;
	
КонецФункции

Функция ПолучитьОбъектОбработкиДействий(Соединение, ПутьКОбработке) Экспорт
	
	Обработка = Соединение.ВнешниеОбработки.Создать(ПутьКОбработке, Ложь);
	Возврат Обработка;
	
КонецФункции

Функция ПолучитьОбъектОбработкиБлокировки(Соединение) Экспорт
	
	Путь = ОбъединитьПути(ТекущийСценарий().Каталог, "..", "БлокировкаСеансов.epf");
	Обработка = Соединение.ВнешниеОбработки.Создать(Путь, Ложь);
	Возврат Обработка;
	
КонецФункции

Функция ПолучитьВерсиюКонфигурации() Экспорт
	
	Соединение = ПолучитьCOMСоединение();
	Версия = Соединение.Метаданные.Версия;
	
	ОсвободитьОбъект(Соединение);
	ВыполнитьСборкуМусора();
	
	Возврат Версия;
	
КонецФункции

Функция ЭтоФайловаяБаза() Экспорт
	
	Возврат СтрНачинаетсяС(ВРег(СтрокаПодключения), ВРег("File="));
	
КонецФункции

Функция ПолучитьПутьКБазе() Экспорт
	
	Если Не ЭтоФайловаяБаза() Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	ПараЗначений = ПараЗначенийИзСтроки(СтрокаПодключения);
	
	Возврат ПараЗначений.Значение;
	
КонецФункции

Функция ПолучитьИмяСервера() Экспорт
	
	Если ЭтоФайловаяБаза() Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	ЧастиСтроки = СтрРазделить(СтрокаПодключения, ";");
	
	Для Каждого Часть Из ЧастиСтроки Цикл
		ПараЗначений = ПараЗначенийИзСтроки(Часть);
		
		Если ВРег(ПараЗначений.Ключ) = ВРег("Srvr") Тогда
			Возврат ПараЗначений.Значение;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Неопределено;
	
КонецФункции

Функция ПолучитьИмяБазы() Экспорт
	
	Если ЭтоФайловаяБаза() Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	ЧастиСтроки = СтрРазделить(СтрокаПодключения, ";");
	
	Для Каждого Часть Из ЧастиСтроки Цикл
		ПараЗначений = ПараЗначенийИзСтроки(Часть);
		
		Если ВРег(ПараЗначений.Ключ) = ВРег("Ref") Тогда
			Возврат ПараЗначений.Значение;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Неопределено;
	
КонецФункции

Функция ПараЗначенийИзСтроки(Строка)
	
	ЧастиСтроки = СтрРазделить(Строка, "=");
	
	Ключ = СокрЛП(ЧастиСтроки[0]);
	
	Значение = СокрЛП(ЧастиСтроки[1]);
	Значение = СтрЗаменить(Значение, ";", "");
	Значение = СтрЗаменить(Значение, "'", "");
	
	Возврат Новый Структура("Ключ, Значение", Ключ, Значение);
	
КонецФункции
