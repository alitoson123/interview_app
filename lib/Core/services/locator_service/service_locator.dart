import 'package:dio/dio.dart';
//import 'package:get_it/get_it.dart';

final Dio dio = Dio();

void setup() {
 /* // 1. Register AppServices first
  getIt.registerLazySingleton<DioService>(() => DioService(dio: dio));
  getIt.registerLazySingleton<CardService>(() => CardService());
  getIt.registerLazySingleton<CollectionService>(() => CollectionService());
  getIt.registerLazySingleton<PurchaseServiceLigic>(() => PurchaseServiceLigic.instance);

  //  Register AI Card Feature dependencies
  getIt.registerLazySingleton<QuotaRepo>(
    () => QuotaRepoImpl(
      firestore: FirebaseFirestore.instance,
      purchaseService: PurchaseServiceLigic.instance,
    ),
  );

  getIt.registerLazySingleton<AddAndShowCardRepo>(
    () => AddAndShowCardRepoImpl(
      addAndShowCardRemoteDataSource: ShowCardRemoteDataSourceImpl(
        dioService: getIt<DioService>(),
        cardService: getIt<CardService>(),
      ),
    ),
  );

  //  Register Normal Card Feature dependencies
  getIt.registerLazySingleton<NormalCardRepoImpl>(
    () => NormalCardRepoImpl(
      normalCardRemoteDataSourceImpl: NormalCardRemoteDataSourceImpl(
        cardService: getIt<CardService>(),
      ),
    ),
  );

  //  Register Auth Feature dependencies
  getIt.registerLazySingleton<AuthRepoImpl>(
    () => AuthRepoImpl(authObject: Auth(), arudUserObject: ArudUser()),
  );

  //  Register Collection Feature dependencies
  getIt.registerLazySingleton<CollectionRepoImpl>(
    () => CollectionRepoImpl(
      collectionRemoteDataSource: CollectionRemoteDataSourceImpl(
        collectionService: getIt<CollectionService>(),
      ),
    ),
  );

  //  Register CollectionStats Feature dependencies
  getIt.registerLazySingleton<CollectionStatsLocalDataSource>(
    () => const CollectionStatsLocalDataSourceImpl(),
  );
  //  Register CollectionStats Remote Data Source dependencies
  getIt.registerLazySingleton<CollectionStatsRemoteDataSource>(
    () => const CollectionStatsRemoteDataSourceImpl(),
  );
  //  Register CollectionStats Repo dependencies
  getIt.registerLazySingleton<CollectionStatsRepo>(
    () => CollectionStatsRepoImpl(
      localDataSource: getIt<CollectionStatsLocalDataSource>(),
      remoteDataSource: getIt<CollectionStatsRemoteDataSource>(),
    ),
  );

  //  Register Revision Feature dependencies
  getIt.registerLazySingleton<RevisionRepoImpl>(
    () => RevisionRepoImpl(
      revisionRemoteDataSource: RevisionRemoteDataSource(
        cardService: getIt<CardService>(),
      ),
    ),
  );*/
}
