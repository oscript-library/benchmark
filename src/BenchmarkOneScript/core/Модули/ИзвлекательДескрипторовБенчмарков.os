#Использовать annotations
#Использовать asserts

#Область ПрограммныйИнтерфейс

// Извлекает дескрипторы бенчмарков
//
// Параметры:
//   ИсточникБенчмарков - Тип, Произвольный - Тип или экземпляр класса бенчмарков
//   НаборДескрипторов - КоллекцияДескрипторовБенчмарков - Коллекция, в которую будут добавлены извлеченные 
//                                                         дескрипторы бенчмарков
//
// Возвращаемое значение:
//   КоллекцияДескрипторовБенчмарков
Функция Извлечь(ИсточникБенчмарков, НаборДескрипторов = Неопределено) Экспорт

	Если НаборДескрипторов = Неопределено Тогда
		Набор = Новый КоллекцияДескрипторовБенчмарков();
	Иначе
		Набор = НаборДескрипторов;
	КонецЕсли;

	РефлекторОбъекта = Новый РефлекторОбъекта(ИсточникБенчмарков);
	ТаблицаМетодов = РефлекторОбъекта.ПолучитьТаблицуМетодов("Бенчмарк");

	Для Каждого СвойстваМетода Из ТаблицаМетодов Цикл

		ДескрипторБенчмарка = Новый ДескрипторБенчмарка(ИсточникБенчмарков, СвойстваМетода.Имя);

		ПрочитатьАннотациюЭталон(СвойстваМетода, ДескрипторБенчмарка);
		ПрочитатьАннотациюКатегория(СвойстваМетода, ДескрипторБенчмарка);
		ПрочитатьАннотациюПараметры(СвойстваМетода, ДескрипторБенчмарка);

		Набор.Добавить(ДескрипторБенчмарка);

	КонецЦикла;

	Возврат Набор;

КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ПрочитатьАннотациюЭталон(СвойстваМетода, ДескрипторБенчмарка)

	Если РаботаСАннотациямиБенчмарков.ЕстьАннотация(СвойстваМетода, "Эталон") Тогда
		ДескрипторБенчмарка.ИспользоватьКакЭталон();
	КонецЕсли;

КонецПроцедуры

Процедура ПрочитатьАннотациюКатегория(СвойстваМетода, ДескрипторБенчмарка)

	Категория = РаботаСАннотациямиБенчмарков.ЗначениеАннотации(СвойстваМетода, "Категория");
	Если ЗначениеЗаполнено(Категория) Тогда
		ДескрипторБенчмарка.УстановитьКатегорию(Категория);
	КонецЕсли;

КонецПроцедуры

Процедура ПрочитатьАннотациюПараметры(СвойстваМетода, ДескрипторБенчмарка)

	КоличествоПараметров = СвойстваМетода.Параметры.Количество();

	ТекстОшибкиКоличествоПараметровНеСовпадает = СтрШаблон(
		"Количество переданных параметров должно совпадать количеству параметров метода бенчмарка '%1'",
		ДескрипторБенчмарка.Метод()
	);

	Аннотации = РаботаСАннотациями.ПолучитьАннотации(СвойстваМетода, "Параметры");
	ИменаПараметров = ДескрипторБенчмарка.ИменаПараметров();
	КоличествоПараметров = ИменаПараметров.Количество();

	Для Каждого Аннотация Из Аннотации Цикл

		Параметры = РаботаСАннотациями.ПолучитьЗначенияПараметровАннотации(Аннотация, "Значение");

		Ожидаем.Что(КоличествоПараметров, ТекстОшибкиКоличествоПараметровНеСовпадает).Равно(Параметры.Количество());
		
		ДескрипторБенчмарка.ДобавитьПараметры(Параметры);

	КонецЦикла;

КонецПроцедуры

#КонецОбласти