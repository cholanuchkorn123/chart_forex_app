import 'package:chart_projects/src/modals/data.dart';
import 'package:dio/dio.dart';

class Service {
  final Dio _dio = Dio();
  final String mainUrl = "https://pro-api.coinmarketcap.com/v1/";
  final String apikey = '';
  Future<List<Data>> getcoinprice() async {
    try {
    _dio.options.headers['X-CMC_PRO_API_KEY'] = apikey;
      final response =
          await _dio.get('${mainUrl}cryptocurrency/listings/latest');

      
      List<dynamic> body = response.data['data'];
      List<Data> datalist = body.map((e) => Data.fromJson(e)).toList();
   
      return datalist;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
