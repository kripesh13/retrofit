part of 'home_bloc.dart';

class HomeState extends Equatable {
  final HomeModel? homeModel;
  final bool isLoading;
  final String? error;
  const HomeState({
    this.homeModel,
    this.isLoading = false,
    this.error,
  });

  HomeState copyWith({HomeModel? homeModel, bool? isLoading, String? error}) {
    return HomeState(
      homeModel: homeModel ?? this.homeModel,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [homeModel ?? [], isLoading, error ?? ''];
}
