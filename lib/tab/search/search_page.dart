import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_renew/detail_post/detail_post_page.dart';
import 'package:instagram_clone_renew/domain/post.dart';
import 'package:instagram_clone_renew/tab/search/search_model.dart';

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
    final model = SearchModel();
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
        child: StreamBuilder<QuerySnapshot<Post>>(
            stream: model.postsStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('알 수 없는 에러');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              List<Post> posts =
                  snapshot.data!.docs.map((post) => post.data()).toList();

              return GridView.builder(
                  itemCount: posts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 2.0,
                    crossAxisSpacing: 2.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final post = posts[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailPostPage(post: (post))));
                      },
                      child: Hero(
                        tag: post.id,
                        child: Image.network(
                          post.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
