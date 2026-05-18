import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/data/model/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newset_book_state.dart';

class NewsetBookCubit extends Cubit<NewsetBookState> {
  NewsetBookCubit(this.homeRepo) : super(NewsetBookInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewsedBooks() async {
    emit(NewsetBookLoading());
    var result = await homeRepo.fetchNewsetBooks();
    result.fold(
      (Faliures) {
        emit(NewsetBookFailure(Faliures.errMessage));
      },
      (books) {
        emit(NewsetBookSuccess(books));
      },
    );
  }
}
