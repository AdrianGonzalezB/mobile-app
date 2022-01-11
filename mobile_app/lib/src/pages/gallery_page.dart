import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  GalleryPage({Key? key}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  bool loading = false;
  List<String> images = [];

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
    List<String> _images = [];
    setState(() {
      loading = false;
      images = _images;
    });
  }
}
