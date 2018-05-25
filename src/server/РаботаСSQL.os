
//** @name РаботаСSQL
//** @desc Модуль для работы с базами средствами MSSQL

#Использовать tmssql

//* @desc Создает бэкап базы.
//* @param ОписаниеБазы {ОписаниеБазы} Объект описания базы.
//* @param ИмяПользователя {Строка} Имя учетной записи MSSQL.
//* @param Пароль {Строка} Пароль учетной записи MSSQL.
//* @param ИмяФайла {Строка} Путь к файлу бэкапа.
Процедура СоздатьБэкап(ОписаниеБазы, ИмяПользователя, Пароль, ИмяФайла) Экспорт
	
	Управление = ПолучитьОбъектУправленияSQL(ОписаниеБазы, ИмяПользователя, Пароль);
	
	Файл = Новый Файл(ИмяФайла);
	
	Результат = Управление.СделатьРезервнуюКопиюБД(Файл.Путь, Файл.Имя, "FULL");
	
	Если Результат = Неопределено Тогда
		ВызватьИсключение Управление.ТекстОшибки;
	КонецЕсли;
	
КонецПроцедуры

//* @desc Загружает бэкап базы.
//* @param ОписаниеБазы {ОписаниеБазы} Объект описания базы.
//* @param ОписаниеБазыИсточника {ОписаниеБазы} В случае, когда бэкап загружается в другую базу, нужно указать базу-источник (необязательный).
//* @param ИмяПользователя {Строка} Имя учетной записи MSSQL.
//* @param Пароль {Строка} Пароль учетной записи MSSQL.
//* @param ИмяФайла {Строка} Путь к файлу бэкапа.
Процедура ЗагрузитьБэкап(ОписаниеБазы, ОписаниеБазыИсточника = Неопределено, ИмяПользователя, Пароль, ИмяФайла) Экспорт
	
	Управление = ПолучитьОбъектУправленияSQL(ОписаниеБазы, ИмяПользователя, Пароль);
	
	Если ОписаниеБазыИсточника <> Неопределено Тогда
		УправлениеИсточник = ПолучитьОбъектУправленияSQL(ОписаниеБазыИсточника, ИмяПользователя, Пароль);
		СтруктураФайлов = УправлениеИсточник.ПолучитьСтруктуруФайловБД();
		Результат = Управление.ВосстановитьИзРезервнойКопииБД(ИмяФайла, СтруктураФайлов);
	Иначе
		Результат = Управление.ВосстановитьИзРезервнойКопииБД(ИмяФайла);
	КонецЕсли;
	
	Если Результат = Ложь Тогда
		ВызватьИсключение Управление.ТекстОшибки;
	КонецЕсли;
	
КонецПроцедуры

//* @desc Получает объект для работы с MSSQL.
//* @param ОписаниеБазы {ОписаниеБазы} Объект описания базы.
//* @param ИмяПользователя {Строка} Имя учетной записи MSSQL.
//* @param Пароль {Строка} Пароль учетной записи MSSQL.
//* @return {УправлениеMSSQL}
Функция ПолучитьОбъектУправленияSQL(ОписаниеБазы, ИмяПользователя, Пароль) Экспорт
	
	Управление = Новый УправлениеMSSQL;
	
	Управление.ПараметрыПодключения.АдресСервераSQL = ОписаниеБазы.ИмяСервераSQL;
	Управление.ПараметрыПодключения.ИмяПользователяSQL = ИмяПользователя;
	Управление.ПараметрыПодключения.ПарольПользователяSQL = Пароль;
	Управление.ПараметрыПодключения.ИмяБазыДанныхSQL = ОписаниеБазы.ИмяБазыSQL;
	
	Возврат Управление;
	
КонецФункции
