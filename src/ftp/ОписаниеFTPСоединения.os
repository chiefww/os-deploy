
//** @name ОписаниеFTPСоединения
//** @desc Класс описания FTP соединения

#Использовать ftp

//* @desc Идентификатор учетной записи ftp как он задан в конфигурационном файле.
Перем Идентификатор Экспорт;

//* @desc Адрес ftp-сервера.
//* Соответствует ключу <b>ftp</b>.
Перем АдресСервера Экспорт;

//* @desc Порт ftp-сервера.
//* Соответствует ключу <b>port</b>.
Перем Порт Экспорт;

//* @desc Пользователь ftp-сервера.
//* Соответствует ключу <b>user</b>.
Перем ИмяПользователя Экспорт;

//* @desc Пароль пользователя ftp-сервера.
//* Соответствует ключу <b>pwd</b>.
Перем Пароль Экспорт;

Перем Соединение;

//* @desc Конструктор.
//* @param ИД {Строка} Идентификатор учетной записи ftp как он задан в конфигурационном файле.
//* @param Значения {Соответствие} Значения, считанные из конфигурационного файла.
Процедура ПриСозданииОбъекта(ИД, Значения) Экспорт
	
	Идентификатор = ИД;
	
	АдресСервера = Значения.Получить("ftp");
	Порт = Значения.Получить("port");
	ИмяПользователя = Значения.Получить("user");
	Пароль = Значения.Получить("pwd");
	
КонецПроцедуры

//* @desc Возвращает объект FTP-Соединения.
//* @return {FTPСоединение}
Функция ПолучитьСоединение() Экспорт
	
	Если Соединение = Неопределено Тогда
		Соединение = Новый FTPСоединение(АдресСервера, Порт, ИмяПользователя, Пароль);
	КонецЕсли;
	
	Возврат Соединение;
	
КонецФункции
