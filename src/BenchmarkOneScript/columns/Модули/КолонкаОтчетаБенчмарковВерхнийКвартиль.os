#Использовать delegate

// Создает экземпляр колонки
//
// Возвращаемое значение:
//   КолонкаОтчетаБенчмарков
Функция Создать() Экспорт
	
	Колонка = Новый КолонкаОтчетаБенчмарков(КолонкиОтчетаБенчмарков.ВерхнийКвартиль);
	Колонка.Заголовок = "Q3";
	Колонка.Описание = "Третий (верхний) квартиль (75-й процентиль)";
	Колонка.ЕдиницаИзмерения = ЕдиницыИзмеренийБенчмарков.Наносекунда;
	Колонка.ЭтоЧисло = Истина;
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
Функция Значение(СтрокаРезультата, Колонка) Экспорт // BSLLS:UnusedParameters-off

	Возврат СтрокаРезультата.Статистика.ВНаносекунды().ВерхнийКвартиль;

КонецФункции