#Использовать benchmark
#Использовать "../benchmarks"

Тип = Тип("БенчмаркБазовый");

Конфигурация = Новый КонфигурацияБенчмарков(Тип)
	.УстановитьКоличествоИтераций(5)
	// ...
	.УстановитьКоличествоПрогревочныхИтераций(2);

Бенчмаркинг.Запустить(Тип, Конфигурация);