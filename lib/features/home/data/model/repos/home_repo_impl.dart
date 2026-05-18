import 'dart:developer';

import 'package:bookly/core/errors/faliures.dart';
import 'package:bookly/core/utils/api_server.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/data/model/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServer apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Faliures, List<BookModel>>> fetchNewsetBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=computerscience',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioError) {
        log(e.toString());
        return left(ServerFaliure.fromDioError(e));
      }
      return left(ServerFaliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliures, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=subject:Mathematics',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFaliure.fromDioError(e));
      }
      log('fetchFeaturedBooks: ${e.toString()}');
      return left(ServerFaliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliures, List<BookModel>>> fethcSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:Programming',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFaliure.fromDioError(e));
      }
      return left(ServerFaliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliures, List<BookModel>>> fetchSearchBooks({
    required String search,
  }) async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$search',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFaliure.fromDioError(e));
      }
      return left(ServerFaliure(e.toString()));
    }
  }
}
