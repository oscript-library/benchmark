// BSLLS:DuplicateStringLiteral-off
// BSLLS:MagicNumber-off

#Использовать asserts
#Использовать "helpers"

&Тест
Процедура Тест_ВыделяемаяПамять() Экспорт

	РазмерВБайтах = 1024 * 1024;

	Тип = Тип("БенчмаркБуферДвоичныхДанных");

	ДескрипторыБенчмарков = Новый КоллекцияДескрипторовБенчмарков(Тип);
	ДескрипторБенчмарка = ДескрипторыБенчмарков.НайтиПоИмени("Бенчмарк");
	ДескрипторБенчмарка.ДобавитьПараметры(РазмерВБайтах);
	
	Результат = Бенчмаркинг.Запустить(ДескрипторыБенчмарков);
	ВыделеноБайт = Результат.Отчет.Таблица[0][КолонкиОтчетаБенчмарков.ВыделяемаяПамять];
	
	Коэффициент = РазмерВБайтах / ВыделеноБайт;

	Ожидаем.Что(Коэффициент).Между(0.99, 1);

КонецПроцедуры

&Тест
Процедура Тест_Производительность() Экспорт

	НаносекундВМиллисекунде = 1000000;

	Результат = Бенчмаркинг.Запустить(Тип("БенчмаркиСЗадержкой"));
	РезультатыЗапусков = Результат.РезультатыЗапусков;
	Отчет = Результат.Отчет;

	// Среднее
	Среднее10 = РезультатыЗапусков[0].Статистика.Среднее / НаносекундВМиллисекунде;
	Среднее20 = РезультатыЗапусков[1].Статистика.Среднее / НаносекундВМиллисекунде;

	Ожидаем.Что(Среднее10).Больше(10);
	Ожидаем.Что(Среднее20).Больше(20);

	// СтандартноеОтклонение
	СтандартноеОтклонение10 = РезультатыЗапусков[0].Статистика.СтандартноеОтклонение / НаносекундВМиллисекунде;
	СтандартноеОтклонение20 = РезультатыЗапусков[1].Статистика.СтандартноеОтклонение / НаносекундВМиллисекунде;

	Ожидаем.Что(СтандартноеОтклонение10).Больше(0);
	Ожидаем.Что(СтандартноеОтклонение20).Больше(0);

	// СтандартнаяОшибкаСреднего
	СтандартнаяОшибкаСреднего10 = РезультатыЗапусков[0].Статистика.СтандартнаяОшибкаСреднего / НаносекундВМиллисекунде;
	СтандартнаяОшибкаСреднего20 = РезультатыЗапусков[1].Статистика.СтандартнаяОшибкаСреднего / НаносекундВМиллисекунде;

	Ожидаем.Что(СтандартнаяОшибкаСреднего10).Больше(0);
	Ожидаем.Что(СтандартнаяОшибкаСреднего20).Больше(0);

	// Медиана
	Медиана10 = РезультатыЗапусков[0].Статистика.Медиана / НаносекундВМиллисекунде;
	Медиана20 = РезультатыЗапусков[1].Статистика.Медиана / НаносекундВМиллисекунде;

	Ожидаем.Что(Медиана10).Больше(10);
	Ожидаем.Что(Медиана20).Больше(20);

	// Эталон
	Ожидаем.Что(Отчет.Таблица[0][КолонкиОтчетаБенчмарков.КоэффициентПроизводительности]).Равно(1);
	Ожидаем.Что(Отчет.Таблица[1][КолонкиОтчетаБенчмарков.КоэффициентПроизводительности]).Больше(1);

КонецПроцедуры