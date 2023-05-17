abstract class ShopsEvents {}

class ShopsFetechedEvent extends ShopsEvents {}

class SearchInAllShopsListEvent extends ShopsEvents {
  final String key;

  SearchInAllShopsListEvent({required this.key});
}

class BeetweenDatesFilterEvent extends ShopsEvents {
  final String fromDate;
  final String toDate;

  BeetweenDatesFilterEvent({required this.toDate, required this.fromDate});
}

class FromDateFilterEvent extends ShopsEvents {
  final String fromDate;

  FromDateFilterEvent({required this.fromDate});
}

class ToDateFilterEvent extends ShopsEvents {
  final String toDate;

  ToDateFilterEvent({required this.toDate});
}
