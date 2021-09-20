import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: Image(
                        image: NetworkImage(
                          'https://previews.123rf.com/images/pandavector/pandavector1901/pandavector190105477/115490218-vector-illustration-of-avatar-and-dummy-icon-set-of-avatar-and-image-vector-icon-for-stock-.jpg',
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '1000',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Posts',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '2000',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Followers',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '1000',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Following',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Fredericho Madi',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Studi Independent 2021 - Gits',
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'www.fredericho_madi.com',
              style: TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.8,
                child: OutlineButton(
                  onPressed: () {},
                  child: Text('Edit Profile'),
                  color: Colors.black,
                  borderSide: BorderSide(width: 1, color: Colors.white54),
                  highlightedBorderColor: Colors.white,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.1,
                child: OutlineButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_drop_down),
                  borderSide: BorderSide(width: 1, color: Colors.white54),
                  highlightedBorderColor: Colors.white,
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Container(
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 36,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text('New')
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
