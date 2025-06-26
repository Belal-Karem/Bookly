import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/data/model/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.homeRepon) : super(FeaturedBookInitial());

  final HomeRepo homeRepon;

  Future<void> fetchFeaturedBook() async {
    emit(FeaturedBookLoading());
    var result = await homeRepon.fetchFeaturedBooks();
    result.fold(
      (Faliures) {
        emit(FeaturedBookFailuer(Faliures.errMessage));
      },
      (books) {
        FeaturedBookSuccess(books);
      },
    );
  }
}
