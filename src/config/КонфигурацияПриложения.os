
#Использовать json

Перем ПутьКФайлу;

Перем СписокБаз;
Перем Параметры;

Процедура ПриСозданииОбъекта(пПутьКФайлу) Экспорт
	
	ПутьКФайлу = пПутьКФайлу;
	
	ТекстовыйДокумент = Новый ТекстовыйДокумент;
	ТекстовыйДокумент.Прочитать(ПутьКФайлу);
	Текст = ТекстовыйДокумент.ПолучитьТекст();
	
	Парсер = Новый ПарсерJSON;
	Значения = Парсер.ПрочитатьJSON(Текст, Истина);
	
	СписокБаз = Новый Соответствие;
	Параметры = Новый Соответствие;
	
	Для Каждого КлючЗначение Из Значения Цикл
		Если КлючЗначение.Ключ = "bases" Тогда
			ИнициализироватьСписокБаз(КлючЗначение.Значение);
		Иначе
			Параметры.Вставить(КлючЗначение.Ключ, КлючЗначение.Значение);
		КонецЕсли;
	КонецЦикла;
	
КонецПроцедуры

Процедура ИнициализироватьСписокБаз(Значения)
	
	Если Значения = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	Для Каждого База Из Значения Цикл
		ИмяБазы = База.Ключ;
		ЗначенияБазы = База.Значение;
		ОписаниеБазы = Новый ОписаниеБазы(ИмяБазы, ЗначенияБазы);
		
		// TODO: Костыль для применения в ранних версиях
		Если Не ЗначениеЗаполнено(ОписаниеБазы.Идентификатор) Тогда
			ОписаниеБазы.ПриСозданииОбъекта(ИмяБазы, ЗначенияБазы);
		КонецЕсли;
		
		СписокБаз.Вставить(ИмяБазы, ОписаниеБазы);
	КонецЦикла;
	
КонецПроцедуры

Функция ПолучитьБазу(Имя) Экспорт
	
	Возврат СписокБаз.Получить(Имя);
	
КонецФункции

Функция ПолучитьПараметр(Имя) Экспорт
	
	Возврат Параметры.Получить(Имя);
	
КонецФункции
