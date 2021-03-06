
//** @name ОписаниеУчетнойЗаписиПочты
//** @desc Класс описания учетной записи почты

//* @desc Идентификатор учетной записи почты как он задан в конфигурационном файле.
Перем Идентификатор Экспорт;

//* @desc Адрес smtp-сервера.
//* Соответствует ключу <b>smtp</b>.
Перем АдресSMTP Экспорт;

//* @desc Порт smtp-сервера.
//* Соответствует ключу <b>port</b>.
Перем ПортSMTP Экспорт;

//* @desc Пользователь smtp-сервера.
//* Соответствует ключу <b>user</b>.
Перем ПользовательSMTP Экспорт;

//* @desc Пароль пользователя smtp-сервера.
//* Соответствует ключу <b>pwd</b>.
Перем ПарольSMTP Экспорт;

//* @desc Признак испоьзования защищенного соединения. По умолчанию Истина.
//* Соответствует ключу <b>ssl</b>, необязательный.
Перем ИспользоватьSSL Экспорт;

//* @desc Конструктор.
//* @param ИД {Строка} Идентификатор учетной записи почты как он задан в конфигурационном файле.
//* @param Значения {Соответствие} Значения, считанные из конфигурационного файла.
Процедура ПриСозданииОбъекта(ИД, Значения) Экспорт
	
	Идентификатор = ИД;
	
	АдресSMTP = Значения.Получить("smtp");
	ПортSMTP = Значения.Получить("port");
	ПользовательSMTP = Значения.Получить("user");
	ПарольSMTP = Значения.Получить("pwd");
	ИспользоватьSSL = Значения.Получить("ssl");
	
	Если ИспользоватьSSL = Неопределено Тогда
		ИспользоватьSSL = Истина;
	КонецЕсли;
	
КонецПроцедуры
