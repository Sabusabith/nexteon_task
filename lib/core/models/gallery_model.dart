class GlobalGalleryResponse {
  final String message;
  final GalleryData data;

  GlobalGalleryResponse({required this.message, required this.data});

  factory GlobalGalleryResponse.fromJson(Map<String, dynamic> json) {
    return GlobalGalleryResponse(
      message: json['message'],
      data: GalleryData.fromJson(json['data']),
    );
  }
}

class GalleryData {
  final List<GalleryItem> list;
  final int totalCount;

  GalleryData({required this.list, required this.totalCount});

  factory GalleryData.fromJson(Map<String, dynamic> json) {
    var listFromJson = json['list'] as List;
    List<GalleryItem> galleryList =
        listFromJson.map((i) => GalleryItem.fromJson(i)).toList();

    return GalleryData(
      list: galleryList,
      totalCount: json['totalCount'],
    );
  }
}

class GalleryItem {
  final String id;
  final String name;
  final int docType;
  final int uid;
  final String url;

  GalleryItem({
    required this.id,
    required this.name,
    required this.docType,
    required this.uid,
    required this.url,
  });

  factory GalleryItem.fromJson(Map<String, dynamic> json) {
    return GalleryItem(
      id: json['_id'],
      name: json['_name'],
      docType: json['_docType'],
      uid: json['_uid'],
      url: json['_url'],
    );
  }
}
