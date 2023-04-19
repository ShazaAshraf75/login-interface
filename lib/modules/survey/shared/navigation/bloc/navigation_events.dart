abstract class NavigationEvents {}

class BottomNavBarChangedEvent extends NavigationEvents {
  final int index;

  BottomNavBarChangedEvent(this.index);
}
