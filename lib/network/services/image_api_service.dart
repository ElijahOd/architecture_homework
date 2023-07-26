import 'package:dio/dio.dart';

class ImageApiService {
  const ImageApiService({required Dio client}) : _client = client;

  final Dio _client;

  Future<List<Map<String, String>>> getImagesByBreed(String breedId,
      {int limit = 10}) async {
    final response = await _client.get('/images/search', queryParameters: {
      'limit': limit,
      'breed_ids': breedId,
      'include_breeds': false
    });

    final rawIterable =
        (response.data as List<dynamic>).cast<Map<String, dynamic>>();
    return rawIterable
        .map((e) => {'id': e['id'] as String, 'url': e['url'] as String})
        .toList();
  }
}
