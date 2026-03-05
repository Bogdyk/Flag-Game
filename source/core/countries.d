module core.countries;

struct Country {
    string code; // Имя иконки (en, ru, ua)
    dstring name; // Название для отображения на кнопке
}
// Tier 1: 7 самых популярных (Стартовый уровень)
Country[] tier1 = [
    Country("us", "США"d), Country("gb", "Великобритания"d),
    Country("de", "Германия"d), Country("fr", "Франция"d),
    Country("cn", "Китай"d), Country("jp", "Япония"d),
    Country("it", "Италия"d)
];

// Tier 2: 14 популярных (Средняя узнаваемость)
Country[] tier2 = [
    Country("ru", "Россия"d), Country("ua", "Украина"d),
    Country("ca", "Канада"d), Country("au", "Австралия"d),
    Country("br", "Бразилия"d), Country("es", "Испания"d),
    Country("tr", "Турция"d), Country("in", "Индия"d),
    Country("eg", "Египет"d), Country("kr", "Южная Корея"d),
    Country("mx", "Мексика"d), Country("ar", "Аргентина"d),
    Country("pl", "Польша"d), Country("nl", "Нидерланды"d)
];

// Tier 3 (Часть 1): 18 из 36 популярных
Country[] tier3 = [
    Country("se", "Швеция"d), Country("no", "Норвегия"d),
    Country("fi", "Финляндия"d), Country("dk", "Дания"d),
    Country("ch", "Швейцария"d), Country("at", "Австрия"d),
    Country("be", "Бельгия"d), Country("gr", "Греция"d),
    Country("pt", "Португалия"d), Country("cz", "Чехия"d),
    Country("hu", "Венгрия"d), Country("ro", "Румыния"d),
    Country("kz", "Казахстан"d), Country("ge", "Грузия"d),
    Country("th", "Таиланд"d), Country("vn", "Вьетнам"d),
    Country("id", "Индонезия"d),
    Country("sa", "Саудовская Аравия"d), // Продолжение Tier 3...
    Country("il", "Израиль"d), Country("ie", "Ирландия"d),
    Country("nz", "Новая Зеландия"d), Country("za", "ЮАР"d),
    Country("sg", "Сингапур"d), Country("my", "Малайзия"d),
    Country("ph", "Филиппины"d), Country("cl", "Чили"d),
    Country("co", "Колумбия"d), Country("pe", "Перу"d),
    Country("pk", "Пакистан"d), Country("ir", "Иран"d),
    Country("iq", "Ирак"d), Country("ae", "ОАЭ"d),
    Country("ng", "Нигерия"d), Country("ma", "Марокко"d),
    Country("dz", "Алжир"d), Country("is", "Исландия"d)
];
Country[] tier4 = [
    // Европа (малые и балканские)
    Country("ee", "Эстония"d), Country("lv", "Латвия"d),
    Country("lt", "Литва"d),
    Country("si", "Словения"d), Country("hr", "Хорватия"d),
    Country("rs", "Сербия"d),
    Country("bg", "Болгария"d), Country("sk", "Словакия"d),
    Country("al", "Албания"d),
    Country("ba", "Босния и Герцеговина"d),
    Country("me", "Черногория"d),
    Country("mk", "Северная Македония"d),
    Country("lu", "Люксембург"d), Country("mt", "Мальта"d),
    Country("cy", "Кипр"d),
    Country("is", "Исландия"d), Country("md", "Молдавия"d),
    Country("by", "Беларусь"d),
    Country("ad", "Андорра"d), Country("li", "Лихтенштейн"d),
    Country("mc", "Монако"d),
    Country("sm", "Сан-Марино"d), Country("va", "Ватикан"d),

    // Азия и Океания
    Country("az", "Азербайджан"d), Country("am", "Армения"d),
    Country("uz", "Узбекистан"d),
    Country("tm", "Туркменистан"d), Country("kg", "Киргизия"d),
    Country("tj", "Таджикистан"d),
    Country("mn", "Монголия"d), Country("np", "Непал"d),
    Country("lk", "Шри-Ланка"d),
    Country("bd", "Бангладеш"d), Country("mm", "Мьянма"d),
    Country("kh", "Камбоджа"d),
    Country("la", "Лаос"d), Country("kw", "Кувейт"d),
    Country("qa", "Катар"d),
    Country("om", "Оман"d), Country("ye", "Йемен"d),
    Country("jo", "Иордания"d),
    Country("lb", "Ливан"d), Country("sy", "Сирия"d),
    Country("fj", "Фиджи"d),
    Country("pg", "Папуа — Новая Гвинея"d),

    // Африка
    Country("tn", "Тунис"d), Country("ly", "Ливия"d),
    Country("et", "Эфиопия"d),
    Country("ke", "Кения"d), Country("tz", "Танзания"d),
    Country("ug", "Уганда"d),
    Country("gh", "Гана"d), Country("sn", "Сенегал"d),
    Country("cm", "Камерун"d),
    Country("ci", "Кот-д’Ивуар"d), Country("ao", "Ангола"d),
    Country("zm", "Замбия"d),
    Country("zw", "Зимбабве"d), Country("mg", "Мадагаскар"d),
    Country("mu", "Маврикий"d),

    // Латинская Америка и Карибы
    Country("uy", "Уругвай"d), Country("py", "Парагвай"d),
    Country("bo", "Боливия"d),
    Country("ec", "Эквадор"d), Country("ve", "Венесуэла"d),
    Country("cr", "Коста-Рика"d),
    Country("pa", "Панама"d), Country("cu", "Куба"d),
    Country("do", "Доминикана"d),
    Country("jm", "Ямайка"d), Country("gt", "Гватемала"d)
];
