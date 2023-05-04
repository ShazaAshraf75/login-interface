// ignore_for_file: unnecessary_cast

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_events.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_repository.dart';
import 'package:login_interface/modules/survey/my_shops/bloc/shops_states.dart';

class ShopsBloc extends Bloc<ShopsEvents, ShopsStates> {
  final ShopsRepository shopsRepository = ShopsRepository();

  ShopsBloc() : super(ShopsInitialState()) {
    on<ShopsFetechedEvent>(_onShopsFetchedEvent);
  }

  Future<void> _onShopsFetchedEvent(
      ShopsFetechedEvent event, Emitter<ShopsStates> emit) async {
    emit(ShopsLoadingState());
    await shopsRepository.getAllShopsList().then((value) {
      emit(value);
    });
  }
}
