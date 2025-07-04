#Использовать delegate

// Создает экземпляр колонки
//
// Параметры:
//   ИмяПараметра - Строка
//
// Возвращаемое значение:
//   КолонкаОтчетаБенчмарков
Функция Создать(ИмяПараметра) Экспорт
	
	Колонка = Новый КолонкаОтчетаБенчмарков(ИмяКолонки(ИмяПараметра));
	Колонка.Заголовок = ИмяПараметра;
	Колонка.Описание = СтрШаблон("Значение параметра '%1'", ИмяПараметра);
	Колонка.ЗначениеДелегат = Делегаты.Создать(ЭтотОбъект, "Значение");

	Возврат Колонка;

КонецФункции

// Возвращает значение колонки
//
// Параметры:
//   СтрокаРезультата - СтрокаТаблицыЗначений - см. МенеджерРасшифровкиРезультатовБенчмарков.НоваяТаблицаРасшифровки
//   Колонка - КолонкаОтчетаБенчмарков
//
// Возвращаемое значение:
//   Произвольный
Функция Значение(СтрокаРезультата, Колонка) Экспорт

	ИмяПараметра = ИмяПараметраПоКолонке(Колонка.Имя);

	Для Каждого Параметр Из СтрокаРезультата.Параметры Цикл		
		Если Параметр.Имя = ИмяПараметра Тогда
			Возврат Параметр.Значение;
		КонецЕсли;
	КонецЦикла;

КонецФункции

Функция ИмяКолонки(ИмяПараметра) Экспорт
	Возврат Префикс() + ИмяПараметра;
КонецФункции

Функция ИмяПараметраПоКолонке(ИмяКолонки)
	Возврат СтрЗаменить(ИмяКолонки, Префикс(), "");
КонецФункции

Функция Префикс()
	Возврат "Параметр_";
КонецФункции