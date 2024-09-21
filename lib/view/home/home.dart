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
      appBar: AppBar(backgroundColor: Colors.deepPurple.shade300,
        title: const Text("Gallery Table",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          if (galleryController.isLoading.value) {
            return CircularProgressIndicator(color: Colors.deepPurple.shade300);
          } else if (galleryController.errorMessage.isNotEmpty) {
            return Text(galleryController.errorMessage.value);
          } else {
           
            if (galleryController.galleryData.isNotEmpty) {
              return Container(
                width: size.width,
                child: DataTableWidget(galleryData: galleryController.galleryData),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("No data available"),
                  const SizedBox(height: 20), 
                  ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.deepPurple.shade300)),
                    onPressed: () {
                      galleryController.fetchGalleryList();
                    },
                    child: const Text("Show Gallery",style: TextStyle(color: Colors.white),),
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
