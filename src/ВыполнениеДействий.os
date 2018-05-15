
Перем Счетчик;
Перем НачальныйНомер Экспорт;
Перем КонечныйНомер Экспорт;

Процедура ВыгрузитьИБ(ОписаниеБазы, ИмяФайла, Отказ = Ложь) Экспорт
	
	Если Отказ Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Информация("%1. Выгрузка ИБ %2 в файл", Счетчик, ОписаниеБазы.Идентификатор);
	
	Если Не ПередНачаломДействия() Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Сообщение("Имя файла выгрузки: %1", ИмяФайла);
	
	Попытка
		Конфигуратор = ОписаниеБазы.ПолучитьКонфигуратор();
		Конфигуратор.ВыгрузитьИнформационнуюБазу(ИмяФайла);
		ВыводЛога.Сообщение(Конфигуратор.ВыводКоманды());
		ВыводЛога.Успех("Успешно" + Символы.ПС);
	Исключение
		Отказ = Истина;
		ВыводЛога.Ошибка(ОписаниеОшибки());
	КонецПопытки;
	
	ПослеОкончанияДействия();
	
КонецПроцедуры

Процедура ЗагрузитьИБ(ОписаниеБазы, ИмяФайла, Отказ = Ложь) Экспорт
	
	Если Отказ Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Информация("%1. Загрузка ИБ %2 из файла", Счетчик, ОписаниеБазы.Идентификатор);
	
	Если Не ПередНачаломДействия() Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Сообщение("Имя файла выгрузки: %1", ИмяФайла);
	
	Попытка
		Конфигуратор = ОписаниеБазы.ПолучитьКонфигуратор();
		Конфигуратор.ЗагрузитьИнформационнуюБазу(ИмяФайла);
		ВыводЛога.Сообщение(Конфигуратор.ВыводКоманды());
		ВыводЛога.Успех("Успешно" + Символы.ПС);
	Исключение
		Отказ = Истина;
		ВыводЛога.Ошибка(ОписаниеОшибки());
	КонецПопытки;
	
	ПослеОкончанияДействия();
	
КонецПроцедуры

Процедура ВыгрузитьКонфигурацию(ОписаниеБазы, ИмяФайла, Отказ = Ложь) Экспорт
	
	Если Отказ Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Информация("%1. Сохранение конфигурации базы %2 в файл", Счетчик, ОписаниеБазы.Идентификатор);
	
	Если Не ПередНачаломДействия() Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Сообщение("Имя файла конфигурации: %1", ИмяФайла);
	
	Попытка
		Конфигуратор = ОписаниеБазы.ПолучитьКонфигуратор();
		Конфигуратор.ВыгрузитьКонфигурациюВФайл(ИмяФайла);
		ВыводЛога.Сообщение(Конфигуратор.ВыводКоманды());
		ВыводЛога.Успех("Успешно" + Символы.ПС);
	Исключение
		Отказ = Истина;
		ВыводЛога.Ошибка(ОписаниеОшибки());
	КонецПопытки;
	
	ПослеОкончанияДействия();
	
КонецПроцедуры

Процедура ЗагрузитьКонфигурацию(ОписаниеБазы, ИмяФайла, Отказ = Ложь) Экспорт
	
	Если Отказ Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Информация("%1. Загрузка конфигурации базы %2 из файла", Счетчик, ОписаниеБазы.Идентификатор);
	
	Если Не ПередНачаломДействия() Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Сообщение("Имя файла конфигурации: %1", ИмяФайла);
	
	Попытка
		Конфигуратор = ОписаниеБазы.ПолучитьКонфигуратор();
		Конфигуратор.ЗагрузитьКонфигурациюИзФайла(ИмяФайла, Истина);
		ВыводЛога.Сообщение(Конфигуратор.ВыводКоманды());
		ВыводЛога.Успех("Успешно" + Символы.ПС);
	Исключение
		Отказ = Истина;
		ВыводЛога.Ошибка(ОписаниеОшибки());
	КонецПопытки;
	
	ПослеОкончанияДействия();
	
КонецПроцедуры

Процедура ОбновитьКонфигурациюБД(ОписаниеБазы, Отказ = Ложь) Экспорт
	
	Если Отказ Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Информация("%1. Обновление конфигурации БД базы %2", Счетчик, ОписаниеБазы.Идентификатор);
	
	Если Не ПередНачаломДействия() Тогда
		Возврат;
	КонецЕсли;
	
	Попытка
		Конфигуратор = ОписаниеБазы.ПолучитьКонфигуратор();
		Конфигуратор.ОбновитьКонфигурациюБазыДанных();
		ВыводЛога.Сообщение(Конфигуратор.ВыводКоманды());
		ВыводЛога.Успех("Успешно" + Символы.ПС);
	Исключение
		Отказ = Истина;
		ВыводЛога.Ошибка(ОписаниеОшибки());
	КонецПопытки;
	
	ПослеОкончанияДействия();
	
КонецПроцедуры

Процедура ОбновитьКонфигурацию(ОписаниеБазы, ИмяМассивФайлов, Отказ = Ложь) Экспорт
	
	Если Отказ Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Информация("%1. Обновление конфигурации базы %2 из файла/ов", Счетчик, ОписаниеБазы.Идентификатор);
	
	Если Не ПередНачаломДействия() Тогда
		Возврат;
	КонецЕсли;
	
	Если ТипЗнч(ИмяМассивФайлов) = Тип("Массив") Тогда
		МассивФайлов = ИмяМассивФайлов;
	Иначе
		МассивФайлов = Новый Массив;
		МассивФайлов.Добавить(ИмяМассивФайлов);
	КонецЕсли;
	
	Если МассивФайлов.Количество() = 0 Тогда
		ВыводЛога.Информация("Нет файлов обновления - пропуск" + Символы.ПС);
		Возврат;
	КонецЕсли;
	
	Для Каждого ИмяФайла Из МассивФайлов Цикл
		Файл = Новый Файл(ИмяФайла);
		
		Если Файл.ЭтоКаталог() Тогда
			ВыводЛога.Сообщение("Каталог обновления: %1", ИмяФайла);
		Иначе
			ВыводЛога.Сообщение("Имя файла обновления: %1", ИмяФайла);
		КонецЕсли;
		
		Попытка
			Конфигуратор = ОписаниеБазы.ПолучитьКонфигуратор();
			
			Если Файл.ЭтоКаталог() Тогда
				Конфигуратор.ОбновитьКонфигурацию(ИмяФайла);
			Иначе
				Конфигуратор.ОбновитьКонфигурациюИзФайла(ИмяФайла);
			КонецЕсли;
			
			ВыводЛога.Сообщение(Конфигуратор.ВыводКоманды());
		Исключение
			Отказ = Истина;
			ВыводЛога.Ошибка(ОписаниеОшибки());
			Прервать;
		КонецПопытки;
	КонецЦикла;
	
	Если Не Отказ Тогда
		ВыводЛога.Успех("Успешно" + Символы.ПС);
	КонецЕсли;
	
	ПослеОкончанияДействия();
	
КонецПроцедуры

Процедура ЗапуститьВРежимеПредприятия(ОписаниеБазы, ПараметрЗапуска = Неопределено, ЗапуститьОбработку = Неопределено, Отказ) Экспорт
	
	Если Отказ Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Информация("%1. Запуск базы %2 в режиме предприятия", Счетчик, ОписаниеБазы.Идентификатор);
	
	Если ЗначениеЗаполнено(ПараметрЗапуска) Тогда
		ВыводЛога.Информация("Параметр запуска %1", ПараметрЗапуска);
	КонецЕсли;
	
	Если ЗначениеЗаполнено(ЗапуститьОбработку) Тогда
		ВыводЛога.Информация("Запуск обработки %1", ЗапуститьОбработку);
	КонецЕсли;
	
	Если Не ПередНачаломДействия() Тогда
		Возврат;
	КонецЕсли;
	
	Попытка
		ДопКлючи = Неопределено;
		
		Если ЗначениеЗаполнено(ЗапуститьОбработку) Тогда
			ДопКлючи = СтрШаблон("/Execute ""%1""", ЗапуститьОбработку);
		КонецЕсли;
		
		Конфигуратор = ОписаниеБазы.ПолучитьКонфигуратор();
		Конфигуратор.ЗапуститьВРежимеПредприятия(ПараметрЗапуска, , ДопКлючи);
		ВыводЛога.Сообщение(Конфигуратор.ВыводКоманды());
		ВыводЛога.Успех("Успешно" + Символы.ПС);
	Исключение
		Отказ = Истина;
		ВыводЛога.Ошибка(ОписаниеОшибки());
	КонецПопытки;
	
	ПослеОкончанияДействия();
	
КонецПроцедуры

Процедура ВыполнитьОбработкуПодготовки(ОписаниеБазы, ПутьКОбработке, ИмяСценария, Отказ = Ложь) Экспорт
	
	Если Отказ Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Информация("%1. Выполнение сценария %2 в базе %3", Счетчик, ИмяСценария, ОписаниеБазы.Идентификатор);
	
	Если Не ПередНачаломДействия() Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Сообщение("Имя файла обработки: %1", ПутьКОбработке);
	
	Попытка
		Обработка = ОписаниеБазы.ПолучитьОбъектОбработкиДействий(ПутьКОбработке);
		Вывод = Обработка.ВыполнитьДействия(ИмяСценария);
		ВыводЛога.Сообщение(Вывод);
		ВыводЛога.Успех("Успешно" + Символы.ПС);
	Исключение
		Отказ = Истина;
		ВыводЛога.Ошибка(ОписаниеОшибки());
	КонецПопытки;
	
	ПослеОкончанияДействия();
	
КонецПроцедуры

Процедура УстановитьБлокировкуСоединений(ОписаниеБазы, Отказ = Ложь) Экспорт
	
	Если Отказ Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Информация("%1. Установка блокировки соединений с базой %2", Счетчик, ОписаниеБазы.Идентификатор);
	
	Если Не ПередНачаломДействия() Тогда
		Возврат;
	КонецЕсли;
	
	Попытка
		Обработка = ОписаниеБазы.ПолучитьОбъектОбработкиБлокировки();
		Обработка.УстановитьБлокировку(ОписаниеБазы.КлючРазрешения);
		ВыводЛога.Успех("Успешно" + Символы.ПС);
	Исключение
		Отказ = Истина;
		ВыводЛога.Ошибка(ОписаниеОшибки());
	КонецПопытки;
	
	ПослеОкончанияДействия();
	
КонецПроцедуры

Процедура СнятьБлокировкуСоединений(ОписаниеБазы, Отказ = Ложь) Экспорт
	
	Если Отказ Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Информация("%1. Снятие блокировки соединений с базой %2", Счетчик, ОписаниеБазы.Идентификатор);
	
	Если Не ПередНачаломДействия() Тогда
		Возврат;
	КонецЕсли;
	
	Попытка
		Обработка = ОписаниеБазы.ПолучитьОбъектОбработкиБлокировки();
		Обработка.СнятьБлокировку();
		ВыводЛога.Успех("Успешно" + Символы.ПС);
	Исключение
		Отказ = Истина;
		ВыводЛога.Ошибка(ОписаниеОшибки());
	КонецПопытки;
	
	ПослеОкончанияДействия();
	
КонецПроцедуры

Процедура ОтключитьСеансы(ОписаниеБазы, Отказ = Ложь) Экспорт
	
	Если Отказ Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Информация("%1. Отключение сеансов базы %2", Счетчик, ОписаниеБазы.Идентификатор);
	
	Если Не ПередНачаломДействия() Тогда
		Возврат;
	КонецЕсли;
	
	Если ОписаниеБазы.ЭтоФайловаяБаза() Тогда
		ВыводЛога.Информация("Это файловая база - пропуск");
	Иначе
		Попытка
			РаботаССервернымиБазами.ОтключитьСеансы(ОписаниеБазы);
			ВыводЛога.Успех("Успешно" + Символы.ПС);
		Исключение
			Отказ = Истина;
			ВыводЛога.Ошибка(ОписаниеОшибки());
		КонецПопытки;
	КонецЕсли;
	
	ПослеОкончанияДействия();
	
КонецПроцедуры

Процедура УстановитьБлокировкуРегламентныхЗаданий(ОписаниеБазы, Отказ = Ложь) Экспорт
	
	Если Отказ Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Информация("%1. Блокировка регламентных заданий в базе %2", Счетчик, ОписаниеБазы.Идентификатор);
	
	Если Не ПередНачаломДействия() Тогда
		Возврат;
	КонецЕсли;
	
	Если ОписаниеБазы.ЭтоФайловаяБаза() Тогда
		ВыводЛога.Информация("Это файловая база - пропуск");
	Иначе
		Попытка
			РаботаССервернымиБазами.УстановитьБлокировкуРегламентныхЗаданий(ОписаниеБазы, Истина);
			ВыводЛога.Успех("Успешно" + Символы.ПС);
		Исключение
			Отказ = Истина;
			ВыводЛога.Ошибка(ОписаниеОшибки());
		КонецПопытки;
	КонецЕсли;
	
	ПослеОкончанияДействия();
	
КонецПроцедуры

Процедура СнятьБлокировкуРегламентныхЗаданий(ОписаниеБазы, Отказ = Ложь) Экспорт
	
	Если Отказ Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Информация("%1. Снятие блокировки регламентных заданий в базе %2", Счетчик, ОписаниеБазы.Идентификатор);
	
	Если Не ПередНачаломДействия() Тогда
		Возврат;
	КонецЕсли;
	
	Если ОписаниеБазы.ЭтоФайловаяБаза() Тогда
		ВыводЛога.Информация("Это файловая база - пропуск");
	Иначе
		Попытка
			РаботаССервернымиБазами.УстановитьБлокировкуРегламентныхЗаданий(ОписаниеБазы, Ложь);
			ВыводЛога.Успех("Успешно" + Символы.ПС);
		Исключение
			Отказ = Истина;
			ВыводЛога.Ошибка(ОписаниеОшибки());
		КонецПопытки;
	КонецЕсли;
	
	ПослеОкончанияДействия();
	
КонецПроцедуры

Процедура СоздатьSQLБэкап(ОписаниеБазы, ИмяПользователя, Пароль, ИмяФайла, Отказ) Экспорт
	
	Если Отказ Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Информация("%1. Бэкап базы %2 средствами SQL", Счетчик, ОписаниеБазы.Идентификатор);
	
	Если ОписаниеБазы.ЭтоФайловаяБаза() Тогда
		ВыводЛога.Информация("Это файловая база - пропуск");
	Иначе
		Попытка
			РаботаСSQL.СоздатьБэкап(ОписаниеБазы, ИмяПользователя, Пароль, ИмяФайла);
			ВыводЛога.Успех("Успешно" + Символы.ПС);
		Исключение
			Отказ = Истина;
			ВыводЛога.Ошибка(ОписаниеОшибки());
		КонецПопытки;
	КонецЕсли;
	
	ПослеОкончанияДействия();
	
КонецПроцедуры

Процедура ЗагрузитьSQLБэкап(ОписаниеБазы, ОписаниеБазыИсточника = Неопределено, ИмяПользователя, Пароль, ИмяФайла, Отказ) Экспорт
	
	Если Отказ Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Информация("%1. Загрузка бэкапа в базу %2 средствами SQL", Счетчик, ОписаниеБазы.Идентификатор);
	
	Если Не ПередНачаломДействия() Тогда
		Возврат;
	КонецЕсли;
	
	Если ОписаниеБазы.ЭтоФайловаяБаза() Тогда
		ВыводЛога.Информация("Это файловая база - пропуск");
	Иначе
		ВыводЛога.Сообщение("Файл бэкапа: %1", ИмяФайла);
		
		Попытка
			РаботаСSQL.ЗагрузитьБэкап(ОписаниеБазы, ОписаниеБазыИсточника, ИмяПользователя, Пароль, ИмяФайла);
			ВыводЛога.Успех("Успешно" + Символы.ПС);
		Исключение
			Отказ = Истина;
			ВыводЛога.Ошибка(ОписаниеОшибки());
		КонецПопытки;
	КонецЕсли;
	
	ПослеОкончанияДействия();
	
КонецПроцедуры

Процедура КопироватьФайл(Источник, Получатель, Отказ = Ложь) Экспорт
	
	Если Отказ Тогда
		Возврат;
	КонецЕсли;
	
	ВыводЛога.Информация(
		"%1. копирование файла %2
		|    в %3", Счетчик, Источник, Получатель);
	
	Если Не ПередНачаломДействия() Тогда
		Возврат;
	КонецЕсли;
	
	Попытка
		КопироватьФайл(Источник, Получатель);
		ВыводЛога.Успех("Успешно" + Символы.ПС);
	Исключение
		Отказ = Истина;
		ВыводЛога.Ошибка(ОписаниеОшибки());
	КонецПопытки;
	
	ПослеОкончанияДействия();
	
КонецПроцедуры

Функция ПередНачаломДействия()
	
	Счетчик = Счетчик + 1;
	
	Если Не ПроверитьВхождениеТекущегоНомера() Тогда
		ВыводЛога.Информация("Пропуск" + Символы.ПС);
		Возврат Ложь;
	КонецЕсли;
	
	ЗамерВремени.НачатьЗамер();
	ВыводЛога.Сообщение("Начало: %1" + Символы.ПС, ТекущаяДата());
	
	Возврат Истина;
	
КонецФункции

Функция ПослеОкончанияДействия()
	
	ЗамерВремени.ЗакончитьЗамер();
	ВыводЛога.Сообщение("Конец: %1", ТекущаяДата());
	ВыводЛога.Сообщение("Всего: %1" + Символы.ПС, ЗамерВремени.ПолучитьРезультатСтрокой());
	
	Возврат Истина;
	
КонецФункции

Функция ПроверитьВхождениеТекущегоНомера()
	
	ВхождениеСНачала = Истина;
	ВхождениеСКонца = Истина;
	
	Если ЗначениеЗаполнено(НачальныйНомер) Тогда
		ВхождениеСНачала = (Счетчик >= НачальныйНомер);
	КонецЕсли;
	
	Если ЗначениеЗаполнено(КонечныйНомер) Тогда
		ВхождениеСКонца = (Счетчик <= КонечныйНомер);
	КонецЕсли;
	
	Возврат ВхождениеСНачала И ВхождениеСКонца;
	
КонецФункции

Счетчик = 0;
