import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/model/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/book_model/book_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final HomeRepo homeRepo;
  SearchCubit(this.homeRepo) : super(SearchInitial());

  Future<void> fetchSearchBooks({required String search}) async {
    emit(SearchLoading());
    var result = await homeRepo.fetchSearchBooks(search: search);
    result.fold(
      (faliure) => emit(SearchFailuer(faliure.errMessage)),
      (books) => emit(SearchSuccess(books)),
    );
  }
}
