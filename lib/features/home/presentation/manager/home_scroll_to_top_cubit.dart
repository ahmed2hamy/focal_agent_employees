import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScrollToTopCubit extends Cubit<bool> {
  HomeScrollToTopCubit() : super(false);

  void showBackToTopButton() {
    emit(true);
  }

  void hideBackToTopButton() {
    emit(false);
  }
}
