// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/ApiManager.dart' as _i3;
import '../data/dataSourceContract/NewsDataSource.dart' as _i4;
import '../data/dataSourceContract/NewsSourceDataSource.dart' as _i8;
import '../data/dataSourceImpl/NewsDataSourceImpl.dart' as _i5;
import '../data/dataSourceImpl/NewsSourceDataSourceImpl.dart' as _i9;
import '../data/repositoryImpl/NewsRepositoryImpl.dart' as _i7;
import '../data/repositoryImpl/NewsSourceRepositoryImpl.dart' as _i11;
import '../repositoryContract/NewsRepositoryContract.dart' as _i6;
import '../repositoryContract/NewsSourceRepository.dart' as _i10;
import '../ui/home/categories/categoryDetails/CategoryDetailsViewModel.dart'
    as _i12;
import '../ui/home/news/NewsListViewModel.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(_i3.ApiManager());
    gh.factory<_i4.NewsDataSource>(
        () => _i5.NewsDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.NewsRepositoryContract>(
        () => _i7.NewsRepositoryImpl(gh<_i4.NewsDataSource>()));
    gh.factory<_i8.NewsSourceDataSource>(
        () => _i9.NewsSourceDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.NewsSourceRepository>(
        () => _i11.NewsSourceRepositoryImpl(gh<_i8.NewsSourceDataSource>()));
    gh.factory<_i12.CategoryDetailsViewModel>(
        () => _i12.CategoryDetailsViewModel(gh<_i10.NewsSourceRepository>()));
    gh.factory<_i13.NewsListViewModel>(
        () => _i13.NewsListViewModel(gh<_i6.NewsRepositoryContract>()));
    return this;
  }
}
