import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_view_state.dart';

class MainViewCubit extends Cubit<MainViewState> {
  MainViewCubit() : super(const MainViewState(showBookList: true));

  showBookList(bool showBookList) {
    emit(MainViewState(showBookList: showBookList));
  }
}
