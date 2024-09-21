import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controllers/gallery_controller.dart';
import '../widgets/table_widget.dart';

class HomePage extends StatelessWidget {
  final GalleryController galleryController = Get.put(GalleryController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery Table"),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          if (galleryController.isLoading.value) {
            return CircularProgressIndicator(color: Colors.black);
          } else if (galleryController.errorMessage.isNotEmpty) {
            return Text(galleryController.errorMessage.value);
          } else {
            // Show DataTable or the button based on data availability
            if (galleryController.galleryData.isNotEmpty) {
              return Container(
                width: size.width,
                child: DataTableWidget(galleryData: galleryController.galleryData),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No data available"),
                  SizedBox(height: 20), // Space before the button
                  ElevatedButton(
                    onPressed: () {
                      galleryController.fetchGalleryList(); // Fetch data when pressed
                    },
                    child: Text("Show Gallery"),
                  ),
                ],
              );
            }
          }
        }),
      ),
    );
  }
}
