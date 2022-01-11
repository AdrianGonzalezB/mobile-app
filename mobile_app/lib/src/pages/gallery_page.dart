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

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) =>
          Image.network('https://picsum.photos/id/${images[index]}/300/300}'),
      itemCount: images.length,
    );
  }

  void _loadImages() async {
    //var url = Uri.https("https://picsum.photos/v2/list");
    final response = await http.get(Uri.parse('https://picsum.photos/v2/list'));
    final json = jsonDecode(response.body);
    List<String> _images = [];
    for (var image in json) {
      _images.add(image['id']);
    }
    setState(() {
      loading = false;
      images = _images;
    });
  }
}
