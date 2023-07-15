
import 'package:get_it/get_it.dart';
import 'package:trashbanker/data/repository/SampahRepository.dart';

final GetIt locator = GetIt.instance;

void setUpLocator(){
  locator.registerLazySingleton<SampahRepository>(() => SampahRepository());
}