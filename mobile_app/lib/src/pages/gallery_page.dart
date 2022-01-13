import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery')),
      body: Gallery(),
    );
  }
}

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  bool loading = false;
  List<String> images = [];

  @override
  void initState() {
    loading = true;
    images = ['0', '10', '1002'];

    _loadImages();
    super.initState();
  }

  void _loadImages() async {
    var url = 'https://picsum.photos/v2/list';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    List<String> _ids = [];
    for (var image in json) {
      _ids.add(image['id']);
    }
    setState(() {
      loading = false;
      images = _ids;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ImagePage(images[index])),
          );
        },
        child: Image.network(
          'https://picsum.photos/id/${images[index]}/300/300',
        ),
      ),
      itemCount: images.length,
    );
  }
}

class ImagePage extends StatelessWidget {
  final String id;
  ImagePage(this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(20.0),
            minScale: 0.1,
            maxScale: 3.0,
            child: Image.network(
              'https://picsum.photos/id/$id/600/600',
            )),
      ),
    );
  }
}
