part of 'main_cubit.dart';
@immutable
abstract class MainStates {}

class BannerInitialState extends MainStates {}
class BannerLoadingState extends MainStates {}
class BannerSuccessState extends MainStates {}
class BannerFailureState extends MainStates {}
class ProductFailureState extends MainStates {}
class ProductSuccessState extends MainStates {}
class ProductLoadingState extends MainStates {}
