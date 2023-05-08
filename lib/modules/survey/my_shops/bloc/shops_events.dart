abstract class ShopsEvents {}

class ShopsFetechedEvent extends ShopsEvents {}

class SearchInAllShopsListEvent extends ShopsEvents {
  final String key;

  SearchInAllShopsListEvent({required this.key});
}
