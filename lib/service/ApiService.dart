import 'package:dio/dio.dart';

import '../data/Business.dart';
import '../utils/StringResource.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _apiUrl = 'https://api.yelp.com/v3/businesses/search?location=NYC';
  final String _bearerToken = 'bza6Hp9uiEWv2F86OSEycfB9Sc7-7G9FfMZ1JgtQM3cqSpEnG6CsF_IzpEmouNAdfiXcvmL4DSbMqbsp6jmWpyKJ-DG7-FzN3hfqXxjvQ_jfgvZQWXr5yN9pdIrjZXYx'; // Replace with your actual Bearer token

  ApiService() {
    _dio.options.headers['Authorization'] = 'Bearer $_bearerToken';
  }

  Future<List<Businesses>> fetchBusinesses() async {
    try {
      final response = await _dio.get(_apiUrl);
      List<dynamic> data = response.data['businesses'];
      List<Businesses> businesses = data.map((item) => Businesses.fromJson(item)).toList();
      return businesses;
    } catch (e) {
      throw Exception(StringResource.failedToLoad);
    }
  }
}