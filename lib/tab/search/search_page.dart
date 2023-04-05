import 'package:flutter/material.dart';

import '../../create/create_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  final List<String> _urls = const [
    'https://image.edaily.co.kr/images/Photo/files/NP/S/2022/02/PS22022100167.jpg',
    'https://thumb.mt.co.kr/06/2021/02/2021021913564958785_1.jpg/dims/optimize/',
    'https://www.jeonmae.co.kr/news/photo/202206/895433_587294_2748.png',
    'https://img.wowtv.co.kr/wowtv_news/dnrs/20220915/2022091514434502712d3244b4fed182172185139.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreatePage()),
          );
        },
        child: const Icon(Icons.create),
      ),
      appBar: AppBar(title: Text('Instagram Clone')),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: GridView.builder(
            itemCount: _urls.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              final url = _urls[index];
              return Image.network(
                url,
                fit: BoxFit.cover,
              );
            }),
      ),
    );
  }
}
