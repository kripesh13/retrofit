import 'dart:isolate';

import 'package:api_call_with_retrofit/model/home_model.dart';
import 'package:api_call_with_retrofit/network_model/dio_interceptors.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<LoadHomeData>(_getData);
  }
  Future<void> _getData(HomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      final homeModel = await restClient.getHome();
      emit(state.copyWith(homeModel: homeModel, isLoading: false));
    } catch (error) {
      emit(state.copyWith(isLoading: false, error: error.toString()));
      print(error);
    }
  }
}
