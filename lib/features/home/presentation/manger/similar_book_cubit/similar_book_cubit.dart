import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/data/model/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_book_state.dart';

class SimilarBookCubit extends Cubit<SimilarBookState> {
  SimilarBookCubit(this.homeRepo) : super(SimilarBookInitial());

  final HomeRepo homeRepo;

  Future<void> fetchsmiilarbooks({required String category}) async {
    emit(SimilarBookLoaing());
    var result = await homeRepo.fethcSimilarBooks(category: category);
    result.fold(
      (faliures) {
        emit(SimilarBookFailure(faliures.errMessage));
      },
      (books) {
        emit(SimilarBookSuccess(books));
      },
    );
  }
}
