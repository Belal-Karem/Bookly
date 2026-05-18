import 'package:bookly/core/utils/api_server.dart';
import 'package:bookly/features/home/data/model/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;
void setupServiceLocator() {
  getit.registerSingleton<ApiServer>(ApiServer(Dio()));
  getit.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getit.get<ApiServer>()));
}
