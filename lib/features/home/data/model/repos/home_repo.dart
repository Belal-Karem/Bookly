import 'package:bookly/core/errors/faliures.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Faliures, List<BookModel>>> fetchNewsetBooks();
  Future<Either<Faliures, List<BookModel>>> fetchFeaturedBooks();
}
