import 'package:apple_shop_application/di/di.dart';
import 'package:apple_shop_application/data/model/banner.dart';
import 'package:apple_shop_application/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class IBannerDatasource {
  Future<List<BannerCampain>> getBanners();
}

class BannerDatasource implements IBannerDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<BannerCampain>> getBanners() async {
    try {
      var response = await _dio.get('collections/banner/records');

      return response.data['items']
          .map<BannerCampain>(
            (jsonObject) => BannerCampain.fromJsonObject(jsonObject),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }
}
