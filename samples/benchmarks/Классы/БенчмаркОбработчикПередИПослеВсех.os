Перем ДвоичныеДанные;

&ПередВсеми
Процедура Инициализация(Контекст) Экспорт
	Сообщить("Вызван обработчик перед запуском всех бенчмарков");
	ДвоичныеДанные = ПолучитьДвоичныеДанныеИзСтроки("Много данных");
КонецПроцедуры

&ПослеВсех
Процедура Завершение(Контекст) Экспорт
	Сообщить("Вызван обработчик после завершения всех бенчмарков");
	ДвоичныеДанные = Неопределено;
КонецПроцедуры

&Бенчмарк
Процедура SHA256() Экспорт
	ХешированиеДанных = Новый ХешированиеДанных(ХешФункция.SHA256);
	ХешированиеДанных.Добавить(ДвоичныеДанные);
	ХешСумма = ХешированиеДанных.ХешСумма;
КонецПроцедуры

&Бенчмарк
Процедура MD5() Экспорт
	ХешированиеДанных = Новый ХешированиеДанных(ХешФункция.MD5);
	ХешированиеДанных.Добавить(ДвоичныеДанные);
	ХешСумма = ХешированиеДанных.ХешСумма;
КонецПроцедуры