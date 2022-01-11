import 'dart:io';

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
  List<File> images = [];

  @override
  void initState() {
    loading = true;
    images = [];

    _loadImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) => Image.network(''),
      itemCount: images.length,
    );
  }

  void _loadImages() async {
    List<File> _images = [];
    setState(() {
      loading = false;
      images = _images;
    });
  }
}
