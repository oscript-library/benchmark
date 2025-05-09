// Указывает, что метод должен быть выполнен один раз перед запуском всех бенчмарков.
//
// Метод с этой аннотацией используется для подготовки данных, инициализации ресурсов 
// или настройки окружения перед выполнением бенчмарков.
//
// Пример:
//   // Параметры:
//   //   Контекст - Структура:
//   //     * Конфигурация - КонфигурацияБенчмарков
//   //     * ДескрипторыБенчмарков - КоллекцияДескрипторовБенчмарков
//   &ПередВсеми
//   Процедура ПередВсеми(Контекст) Экспорт
//      // Подготовка данных
//   КонецПроцедуры
&Аннотация("ПередВсеми")
Процедура ПриСозданииОбъекта()
КонецПроцедуры