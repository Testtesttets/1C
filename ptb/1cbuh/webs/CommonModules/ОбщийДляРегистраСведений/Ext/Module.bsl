﻿Процедура ДобавитьВРегистр(Пользователь,ПервыйПараметр,СтрокаЗапроса) Экспорт  
	/// Ускорения просто пишем. нужна история входящих пакетов
	МенеджерЗаписи = РегистрыСведений.Request.СоздатьМенеджерЗаписи();
	МенеджерЗаписи.Users = Пользователь;
	МенеджерЗаписи.UnixTimestamp=ОбщиеДляВремени.ВUnixTime();
	МенеджерЗаписи.FrisrtRowHttp = ПервыйПараметр;
	МенеджерЗаписи.FullRowStr = СтрокаЗапроса;
	МенеджерЗаписи.Записать();	
	
КонецПроцедуры


Процедура ДобавитьВОшибкиНаСтроне(СтруктураДляДобавления, ПолныйJSON) Экспорт 

	
		//СоответствиеJson.Вставить("ModuleName",ИнформацияОбОшибке.ИмяМодуля);
		//СоответствиеJson.Вставить("SourceString",ИнформацияОбОшибке.ИсходнаяСтрока);
		//СоответствиеJson.Вставить("NumberRow",ИнформацияОбОшибке.НомерСтроки);
		//СоответствиеJson.Вставить("Description",ИнформацияОбОшибке.Описание);
		//СоответствиеJson.Вставить("UserName", ПользователиКлиент.ТекущийПользователь());
		//СоответствиеJson.Вставить("PlatformVersion",СисИнфо.ВерсияПриложения);
	
	                                                                                                         
	// Справедливотсти ради считаем что запись идет по трем ключас и совпадения не возможны
	МенеджерЗаписи = РегистрыСведений.ОшибкиНаСтроне.СоздатьМенеджерЗаписи();
	МенеджерЗаписи.Клиент = СтруктураДляДобавления.Client;
	МенеджерЗаписи.ВремяUnix = ОбщиеДляВремени.ВUnixTime(ТекущаяДата());
	МенеджерЗаписи.ТекущийПользователь = СтруктураДляДобавления.UserName;
	МенеджерЗаписи.ИмяМодуля = СтруктураДляДобавления.ModuleName;
	МенеджерЗаписи.ИсходнаяСтрока = СтруктураДляДобавления.SourceString;
	МенеджерЗаписи.СтрокаНомер = СтруктураДляДобавления.NumberRow;
	МенеджерЗаписи.Описание = СтруктураДляДобавления.Description;
	МенеджерЗаписи.ВерсияПриложения = СтруктураДляДобавления.PlatformVersion;
	МенеджерЗаписи.ПолныйJSON = ПолныйJSON;
	МенеджерЗаписи.Записать()

КонецПроцедуры
