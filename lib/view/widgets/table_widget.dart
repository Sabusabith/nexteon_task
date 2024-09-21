import 'package:flutter/material.dart';

class DataTableWidget extends StatelessWidget {
  final List<dynamic> galleryData;

  DataTableWidget({required this.galleryData});

  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;
    return Container(margin: EdgeInsets.symmetric(horizontal: 20),
      width: size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 12,
          dataRowHeight: 50,
          columns: [
            DataColumn(label: Container(width: 100, child: Text('Name', style: TextStyle(fontWeight: FontWeight.bold)))),
            DataColumn(label: Text('UID', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text('Doc Type', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text('Image', style: TextStyle(fontWeight: FontWeight.bold))),
          ],
          rows: galleryData.map((item) {
            return DataRow(cells: [
              DataCell(
                Container(
                  width: 100, 
                  child: Text(
                    item.name,
                    style: TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis, 
                    maxLines: 1, 
                  ),
                ),
              ),
              DataCell(Text(item.uid.toString(), style: TextStyle(fontSize: 14))),
              DataCell(Text(item.docType.toString(), style: TextStyle(fontSize: 14))),
              DataCell(
                item.docType == 0
                    ? Image.network(
                        item.url,
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      )
                    : Text('Not an Image', style: TextStyle(fontSize: 14)),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
