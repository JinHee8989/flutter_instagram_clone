import 'package:flutter/material.dart';
import 'package:instagram_clone_renew/tab/account/account_model.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AccountModel();
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Clone'),
        actions: [
          IconButton(
            onPressed: () {
              model.logout();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    const SizedBox(
                      width: 80,
                      height: 80,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://cdn.sisamagazine.co.kr/news/photo/202112/420043_422171_2028.jpg'),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      alignment: Alignment.bottomRight,
                      child: Stack(
                        alignment: Alignment.center,
                        children: const [
                          SizedBox(
                            width: 28,
                            height: 28,
                            child: FloatingActionButton(
                              onPressed: null,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: FloatingActionButton(
                              onPressed: null,
                              child: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  '변진희',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Column(
              children: [
                Text('3', style: TextStyle(fontSize: 18)),
                Text('게시물', style: TextStyle(fontSize: 18)),
              ],
            ),
            Column(
              children: [
                Text('0', style: TextStyle(fontSize: 18)),
                Text('팔로워', style: TextStyle(fontSize: 18)),
              ],
            ),
            Column(
              children: [
                Text('0', style: TextStyle(fontSize: 18)),
                Text('팔로잉', style: TextStyle(fontSize: 18)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
