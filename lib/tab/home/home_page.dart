import 'package:flutter/material.dart';
import 'package:instagram_clone_renew/tab/home/home_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final model = HomeModal();
    return Scaffold(
      appBar: AppBar(title: const Text('Instagram Clone')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Instagram에 오신 것을 환영합니다.',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text('사진과 동영상을 보려면 팔로우하세요'),
            SizedBox(height: 20),
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  SizedBox(height: 8),
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: GestureDetector(
                      onTap: () async {
                        await model.updateProfileImage();
                        setState(() {});
                      },
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(model.getProfileImageUrl()),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    model.getEmail(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(model.getNickName()),
                  SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                          'https://www.jeonmae.co.kr/news/photo/202206/895433_587294_2748.png',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover),
                      SizedBox(width: 4),
                      Image.network(
                          'https://thumb.mt.co.kr/06/2021/02/2021021913564958785_1.jpg/dims/optimize/',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover),
                      SizedBox(width: 4),
                      Image.network(
                          'https://image.edaily.co.kr/images/Photo/files/NP/S/2022/02/PS22022100167.jpg',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text('Facebook 친구'),
                  SizedBox(height: 8),
                  ElevatedButton(onPressed: () {}, child: Text('팔로우'))
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
