// ignore_for_file: deprecated_member_use

import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../models/gallery_model.dart'; 

class GalleryController extends GetxController {
  var isLoading = false.obs;
  var galleryData = <GalleryItem>[].obs; 
  var errorMessage = ''.obs;

  final Dio _dio = Dio();

  Future<void> fetchGalleryList() async {
    final url = 'https://ajcjewel.com:4000/api/global-gallery/list';
    final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjYzMDI2ZjIxNWE5ZDVjNDY1NzQ3MTMxYSIsIl9lbXBsb3llZUlkXyI6IjYzMDI2ZjIxYTI1MTZhMTU0YTUxY2YxOSIsIl91c2VyUm9sZV8iOiJzdXBlcl9hZG1pbiIsImlhdCI6MTcyNjkxMjA1OCwiZXhwIjoxNzU4NDQ4MDU4fQ.2DIEnBnB0Xgc1USz5zmCMRoq0V55Wap_haKYxUs9hwA'; // Replace with your token

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await _dio.post(
        url,
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
        data: {
          "statusArray": [1],
          "screenType": [],
          "responseFormat": [],
          "globalGalleryIds": [],
          "categoryIds": [],
          "docTypes": [],
          "types": [],
          "limit": 10,
          "skip": 0,
          "searchingText": "",
        },
      );

      GlobalGalleryResponse galleryResponse = GlobalGalleryResponse.fromJson(response.data);
      galleryData.value = galleryResponse.data.list; 
      print("Fetched data: ${galleryData.map((item) => item.name).toList()}");
    } on DioError catch (e) {
      if (e.response != null) {
        errorMessage.value = 'Error: ${e.response?.statusCode} - ${e.response?.data}';
      } else {
        errorMessage.value = 'Error: ${e.message}';
      }
    } finally {
      isLoading.value = false;
    }
  }
}
