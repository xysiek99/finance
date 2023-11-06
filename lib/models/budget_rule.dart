import 'package:flutter/material.dart';

class BudgetRule {
  String name;
  String description;
  List<double> percentage;
  List<String> labels;
  List<String> labelsDescription;
  List<String> pros;
  List<String> cons;
  List<IconInfo> iconInfos;

  BudgetRule({
    required this.name,
    required this.description,
    required this.percentage,
    required this.labels,
    required this.labelsDescription,
    required this.pros,
    required this.cons,
    required this.iconInfos,
  });
}

class IconInfo {
  IconData icon;
  Color color;

  IconInfo(this.icon, this.color);
}

List<BudgetRule> budgetRules = [
  BudgetRule(
    name: 'Reguła budżetowania 70/20/10',
    description:
        'Reguła 70/20/10 powstała jako prosty i łatwy do zastosowania model zarządzania osobistymi finansami. '
        'Jest szczególnie przydatna dla osób, które zaczynają swoją przygodę z budżetowaniem lub mają trudności '
        'z dyscypliną finansową, ponieważ proponuje jasny i łatwy do śledzenia podział wydatków. '
        'Założenie tej reguły jest takie, że dochody, które osiągasz, powinny być podzielone w następujący sposób:',
    percentage: [0.7, 0.2, 0.1],
    labels: [
      'Bieżące wydatki i spłata długów:',
      'Oszczędności i inwestycje:',
      'Zachcianki i przyjemności:'
    ],
    labelsDescription: [
      'To kwota, którą przeznaczasz na wszystkie codzienne wydatki, takie jak rachunki, zakupy, czynsz czy raty kredytu. Spłata długów, w tym płatności kart kredytowych, pożyczek czy hipotek, również powinna się zmieścić w tej kategorii. Jest to fundament budżetu, który zapewnia pokrycie wszystkich podstawowych potrzeb.',
      'Z tego dochodu powinno być oszczędzane lub inwestowane. Może to obejmować wpłaty na konto oszczędnościowe, inwestycje na rynku kapitałowym, spłatę długów czy budowanie funduszu awaryjnego. Głównym celem tego procentu jest zabezpieczenie się na przyszłość i rozwijanie swojego majątku.',
      'Pozostałe 10% Twojego dochodu może być przeznaczone na rozrywkę, hobby, podróże czy inne przyjemności. Jest to część budżetu, która pozwala Ci cieszyć się życiem, nie czując się winnym za wydawanie pieniędzy na rzeczy, które sprawiają Ci przyjemność.'
    ],
    pros: [
      'Kompleksowe podejście do wydatków: Włączenie spłaty długów do wydatków bieżących pomaga w realistycznym spojrzeniu na domowy budżet',
      'Promowanie oszczędności: Skłania do systematycznego oszczędzania, co jest fundamentem dla zbudowania stabilności finansowej',
      'Klarowna segregacja finansów: Dzięki prostej strukturze, łatwiej jest segregować wydatki i planować przyszłe finanse',
      'Prostota: Reguła jest łatwa do zrozumienia i implementacji, nawet dla osób, które nie mają doświadczenia w planowaniu finansowym',
    ],
    cons: [
      'Rygorystyczność: Niektóre osoby mogą potrzebować większej elastyczności, na przykład przeznaczając większy procent na inwestycje lub zmniejszając wydatki na przyjemności',
      'Brak uwzględnienia specyficznych okoliczności: Nie bierze pod uwagę unikalnych sytuacji finansowych, takich jak wysokie koszty opieki zdrowotnej, edukacji dzieci czy specyficznych celów finansowych',
    ],
    iconInfos: [
      IconInfo(Icons.home, Colors.purple),
      IconInfo(Icons.savings_rounded, Colors.lightGreen),
      IconInfo(Icons.shopping_cart, Colors.amber),
    ],
  ),
  BudgetRule(
    name: 'Reguła budżetowania 50/30/20',
    description:
        'Reguła budżetowania 50/30/20 to popularny sposób zarządzania osobistymi finansami, który został spopularyzowany '
        'przez amerykańską senator Elizabeth Warren i jej córkę Amelia Warren Tyagi w jej książce '
        '"All Your Worth: The Ultimate Lifetime Money Plan". Reguła ta jest prostym i intuicyjnym '
        'podejściem do zarządzania budżetem domowym. Stworzona została z myślą o ludziach, którzy poszukują prostego '
        'i skutecznego modelu zarządzania swoimi pieniędzmi i chcą planować swoje finanse.',
    percentage: [0.5, 0.3, 0.2],
    labels: [
      'Bieżące wydatki:',
      'Zachcianki i przyjemności:',
      'Oszczędności i spłata długów:'
    ],
    labelsDescription: [
      'są to rzeczy niezbędne do życia, takie jak opłaty rachunków, transportu, ubezpieczenia zdrowotne oraz inne podstawowe potrzeby takie jak jedzenie',
      'wszelkie wydatki, które nie są ściśle konieczne do życia, ale przyczyniają się do zwiększenia jego komfortu, takie jak wyjścia do restauracji, rozrywka, wakacje, hobby, itd.',
      'oszczędności i spłata długów – tutaj wchodzi budowanie funduszu awaryjnego, oszczędzanie na emeryturę, inwestycje oraz spłata kredytów poza tymi, które zostały zaklasyfikowane jako niezbędne wydatki',
    ],
    pros: [
      'Elastyczność: Pozwala na indywidualne dopasowanie do różnych stylów życia i dochodów',
      'Prostota: Łatwa do zrozumienia i zaimplementowania, nie wymaga szczegółowego śledzenia każdej kategorii wydatków',
    ],
    cons: [
      'Zbyt uproszczona: Dla osób z wysokimi dochodami lub niskimi kosztami życia reguła może nie być optymalna',
      'Klarowność kategorii: Niektóre wydatki mogą być trudne do sklasyfikowania jako konieczności lub pragnienia',
      'Niewystarczająca dla osób z wysokim poziomem zadłużenia - mogą potrzebować przeznaczyć więcej niż 20% swoich dochodów na spłatę długów',
    ],
    iconInfos: [
      IconInfo(Icons.car_repair, Colors.pink),
      IconInfo(Icons.shopping_cart, Colors.amber),
      IconInfo(Icons.credit_card, Colors.blue),
    ],
  ),
  BudgetRule(
    name: 'Reguła budżetowania 30/30/40',
    description:
        'Reguła budżetowania 30/30/40 nie jest tak rozpowszechniona jak wcześniej omówiona reguła 50/30/20, '
        'ale również stanowi pewien sposób podziału dochodów. Podobnie jak inne metody budżetowania, '
        'ma za zadanie pomóc w zrównoważeniu wydatków bieżących, oszczędności i inwestycji oraz wydatków na życie codzienne. '
        'Poniżej przedstawiamy jak podział dochodów wyglądałby z regułą 30/30/40: ',
    percentage: [0.3, 0.3, 0.4],
    labels: [
      'Bieżące wydatki:',
      'Oszczędności i spłata długów:',
      'Zachcianki i przyjemności:'
    ],
    labelsDescription: [
      'potrzeby życiowe, czyli wszystkie niezbędne wydatki takie jak mieszkanie, rachunki, jedzenie, transport, opłaty, ubezpieczenia i inne podstawowe koszty',
      'oszczędności krótkoterminowe, takie jak fundusz awaryjny, oraz oszczędności długoterminowe, w tym na emeryturę czy inne cele finansowe',
      'wydatki na styl życia, rozrywkę i inne osobiste przyjemności, które nie są koniecznie niezbędne, ale zwiększają jakość życia',
    ],
    pros: [
      'Równowaga między oszczędnościami a wydatkami na życie: Zapewnia środki na codzienne przyjemności, co może poprawić jakość życia i zapobiegać wypaleniu związanemu z ciągłym oszczędzaniem',
      'Elastyczność dla osób z wyższymi dochodami: Model może być bardziej odpowiedni dla osób, które zarabiają wystarczająco, aby pokryć podstawowe wydatki mniejszą częścią swoich dochodów',
    ],
    cons: [
      'Nieodpowiednia dla niskich dochodów: Dla osób z ograniczonymi dochodami, 30% na podstawowe wydatki może być niewystarczające',
      'Pokusa nadmiernych wydatków: Alokacja 40% na wydatki dyskrecjonalne może sprzyjać nadmiernemu wydawaniu i braku dyscypliny finansowej',
      'Potrzeba dyscypliny finansowej: Ten model wymaga silnej autokontroli, aby nie przekraczać przydzielonych procentów, szczególnie w kategorii wydatków na styl życia',
      'Mniejszy nacisk na niezbędne wydatki: Może nie być odpowiednia dla osób, które żyją w drogich rejonach lub mają inne wysokie obowiązkowe miesięczne wydatki',
    ],
    iconInfos: [
      IconInfo(Icons.car_repair, Colors.pink),
      IconInfo(Icons.credit_card, Colors.blue),
      IconInfo(Icons.shopping_cart, Colors.amber),
    ],
  ),
  BudgetRule(
    name: 'Reguła budżetowania 80/20',
    description:
        'Reguła budżetowania 80/20, znana również jako zasada Pareto w zarządzaniu finansami osobistymi, '
        'jest prostym podejściem do oszczędzania, które zakłada, że powinieneś odkładać na oszczędności 20% swoich dochodów, '
        'a 80% wydawać na wszystko inne. Została ona stworzona z myślą o osobach, które chcą uproszczonego modelu budżetowania, '
        'bez konieczności szczegółowego śledzenia każdej kategorii wydatków. Reguła 80/20 jest szczególnie przydatna dla osób, '
        'które zaczynają swoją przygodę z systemami budżetowania lub nie chcą poświęcać czasu na śledzenie każdego wydatku.',
    percentage: [0.8, 0.2],
    labels: [
      'Bieżące wydatki, spłata długów, zachcianki i przyjemności:',
      'Oszczędności i inwestycje:',
    ],
    labelsDescription: [
      'wszystkie wydatki poza oszczędzaniem i inwestowaniem – zarówno na konieczne, jak mieszkanie, jedzenie, transport, spałata kredytu czy leasingu jak i na mniej istotne, takie jak rozrywka, wyjście do restauracji czy hobby',
      'oszczędności lub inwestycje. Zaraz po otrzymaniu wynagrodzenia, odłóż tę część do oszczędności, funduszu emerytalnego, na bieżące bądź przyszłe cele inwestycyjne. Jest to pierwszy krok, który wykonujesz z każdą wpłatą – „płacisz sobie na początek”'
    ],
    pros: [
      'Prostota: Jest łatwa do zrozumienia i zastosowania, nawet jeśli nie jesteś doświadczony w zarządzaniu pieniędzmi',
    ],
    cons: [
      'Ryzyko nadmiernych wydatków: Możliwość wydawania 80% dochodów może prowadzić do nadmiernego konsumpcjonizmu i niekontrolowanych wydatków',
      'Brak szczegółowości: Nie zachęca do analizy i optymalizacji wydatków, co może być ważne przy dążeniu do bardziej zrównoważonego budżetu',
    ],
    iconInfos: [
      IconInfo(Icons.living, Colors.red),
      IconInfo(Icons.savings, Colors.lightGreen),
    ],
  ),
  BudgetRule(
    name: 'Reguła budżetowania 60/40',
    description:
        'Reguła budżetowania 60/40 to kolejna strategia podziału dochodów, która polega na przeznaczeniu '
        '60% zarobków na wszystkie konieczne wydatki i życiowe potrzeby, a pozostałe 40% na oszczędności, '
        'inwestycje oraz wydatki dyskrecjonalne. Jest to model zaproponowany dla osób, które szukają '
        'równowagi między bieżącym utrzymaniem a solidnym budowaniem swojej przyszłości finansowej. '
        'Reguła 60/40 może być odpowiednia dla osób, które mają stabilne dochody i chcą zbudować solidne '
        'podstawy oszczędnościowe, jednocześnie zachowując pewien stopień elastyczności w swoich wydatkach. '
        'Może to być także dobra opcja dla osób, które mają kontrolę nad swoimi wydatkami koniecznymi '
        'i szukają prostego podziału między "muszę" a "chcę"',
    percentage: [0.6, 0.4],
    labels: [
      'Bieżące wydatki i spłata długów:',
      'Oszczędności, inwestycje, zachcianki i przyjemności:',
    ],
    labelsDescription: [
      'wszystkie niezbędna stałe koszty związane z utrzymaniem – mieszkanie, rachunki, ubezpieczenia, jedzenie, transport, zdrowie, spłaty zobowiązań czy inne konieczne do poniesienia wydatki',
      'w tym może być zawarte budowanie tzw. finansowej poduszki bezpieczeństwa, inwestycje oraz wydatki na rozrywkę, podróże i inne pragnienia, które nie są niezbędne do życia',
    ],
    pros: [
      'Optymalizacja - 60% wydatków na potrzeby bieżące powinno być wystarczające w przypadku większości osób i miejsc zamieszkania',
    ],
    cons: [
      'Brak szczegółowego planowania: Nie promuje szczegółowego budżetowania ani nie pomaga w identyfikacji obszarów, gdzie można by dokonać cięć kosztów',
      'Bez wyraźnych wytycznych - 40% przeznaczonych na "inne" wydatki, gdzie nie ma wyraźnego podziału między inwestycjami, a konsumpcjonizmem'
    ],
    iconInfos: [
      IconInfo(Icons.money, Colors.white60),
      IconInfo(Icons.holiday_village, Colors.orange),
    ],
  ),
];
