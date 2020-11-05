﻿&После("ОбработкаОтображенияОшибки")
Процедура web2ОбработкаОтображенияОшибки(ИнформацияОбОшибке, ТребуетсяЗавершениеСеанса, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	СисИнфо = Новый  СистемнаяИнформация;
	СоответствиеJson = Новый Соответствие;
	СоответствиеJson.Вставить("Client","Client"); // Тут нужен из настроек брать имя клиента можно вычислять на своей стороне от IP Что за клиент
	СоответствиеJson.Вставить("ModuleName",СокрЛП(ИнформацияОбОшибке.ИмяМодуля));
	СоответствиеJson.Вставить("DateSend",(ТекущаяДата()));
	СоответствиеJson.Вставить("SourceString",СокрЛП(ИнформацияОбОшибке.ИсходнаяСтрока));
	СоответствиеJson.Вставить("NumberRow",СокрЛП(ИнформацияОбОшибке.НомерСтроки));
	СоответствиеJson.Вставить("Description",СокрЛП(ИнформацияОбОшибке.Описание));
	СоответствиеJson.Вставить("UserName", СокрЛП(ПользователиКлиент.ТекущийПользователь()));
	СоответствиеJson.Вставить("PlatformVersion",СокрЛП(СисИнфо.ВерсияПриложения));
	СтрокаJson=СтруктураВСтрокуJSON(СоответствиеJson);
	// Оправка данных
	HTTPСоединение = Новый HTTPСоединение("localhost",8532,"admin","");
	HTTPЗапрос = Новый HTTPЗапрос("/hs/webroot/fortest");
	HTTPЗапрос.Заголовки.Вставить("Content-type", "application/json;charset=utf-8");
	HTTPЗапрос.Заголовки.Вставить("Content-Lenght", 1);
	HTTPЗапрос.УстановитьТелоИзСтроки(СтрокаJson);
	Результат = HTTPСоединение.ОтправитьДляОбработки(HTTPЗапрос);
		
КонецПроцедуры


/// Структура в строку JSON
Функция СтруктураВСтрокуJSON(Значение)
	
	ЗаписьJSON = Новый ЗаписьJSON;
	ЗаписьJSON.УстановитьСтроку();
	ЗаписатьJSON(ЗаписьJSON, Значение);
	Возврат ЗаписьJSON.Закрыть();
	
КонецФункции


