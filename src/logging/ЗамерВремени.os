
//** @name ЗамерВремени
//** @desc Класс замера времени выполнения действий

Перем ЗамерНачат;
Перем НачалоОтсчета;
Перем КонецОтсчета;

//* @desc Запускает замер времени, устанавливает дату начала отсчета.
//* @param Дата {Дата} Дата и время начала отсчета, если не указано, используется текущая дата (необязательный).
Процедура НачатьЗамер(Дата = Неопределено) Экспорт
	
	Если Дата = Неопределено Тогда
		НачалоОтсчета = ТекущаяДата();
	Иначе
		НачалоОтсчета = Дата;
	КонецЕсли;
	
	ЗамерНачат = Истина;
	
КонецПроцедуры

//* @desc Останавливает замер времени, устанавливает дату окончания отсчета.
//* @param Дата {Дата} Дата и время окончания отсчета, если не указано, используется текущая дата (необязательный).
Процедура ЗакончитьЗамер(Дата = Неопределено) Экспорт
	
	Если Не ЗамерНачат Тогда
		ВыводЛога.Отладка("Невозможно закончить замер времени - Замер времени не начат");
		Возврат;
	КонецЕсли;
	
	Если Дата = Неопределено Тогда
		КонецОтсчета = ТекущаяДата();
	Иначе
		КонецОтсчета = Дата;
	КонецЕсли;
	
КонецПроцедуры

//* @desc Возвращает разницу в секундах между окончанием и началом отсчета.
//* @return {Число}
Функция ПолучитьРезультат() Экспорт
	
	Если ЗначениеЗаполнено(НачалоОтсчета) И ЗначениеЗаполнено(КонецОтсчета) Тогда
		Возврат КонецОтсчета - НачалоОтсчета;
	КонецЕсли;
	
	Возврат Неопределено;
	
КонецФункции

//* @desc Возвращает разницу между окончанием отсчета и началом отсчета в виде форматированной строки.
//* @return {Строка}
Функция ПолучитьРезультатСтрокой() Экспорт
	
	Возврат ФорматироватьРезультат(ПолучитьРезультат());
	
КонецФункции

//* @desc Форматирует количество секунд в читаемый вид.
//* @param Результат {Чтсло}
//* @return {Строка}
Функция ФорматироватьРезультат(Знач Результат) Экспорт
	
	РазмерМинута = 60;
	РазмерЧас = РазмерМинута * 60;
	РазмерДень = РазмерЧас * 24;
	
	Дней = 0;
	Часов = 0;
	Минут = 0;
	Секунд = 0;
	
	Если Результат >= РазмерДень Тогда
		Дней = Цел(Результат / РазмерДень);
		Результат = Результат - РазмерДень * Дней;
	КонецЕсли;
	
	Если Результат >= РазмерЧас Тогда
		Часов = Цел(Результат / РазмерЧас);
		Результат = Результат - РазмерЧас * Часов;
	КонецЕсли;
	
	Если Результат >= РазмерМинута Тогда
		Минут = Цел(Результат / РазмерМинута);
		Результат = Результат - РазмерМинута * Минут;
	КонецЕсли;
	
	Секунд = Окр(Результат, 2);
	
	Если Дней > 0 Тогда
		Строка = СтрШаблон("%4д., %3ч., %2м., %1с.", Секунд, Минут, Часов, Дней);
	ИначеЕсли Часов > 0 Тогда
		Строка = СтрШаблон("%3ч., %2м., %1с.", Секунд, Минут, Часов);
	ИначеЕсли Минут > 0 Тогда
		Строка = СтрШаблон("%2м., %1с.", Секунд, Минут);
	Иначе
		Строка = СтрШаблон("%1с.", Секунд);
	КонецЕсли;
	
	Возврат Строка;
	
КонецФункции

ЗамерНачат = Ложь;
НачалоОтсчета = 0;
КонецОтсчета = 0;
