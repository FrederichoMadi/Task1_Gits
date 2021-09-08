import 'package:flutter/material.dart';

class GridPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      crossAxisCount: 3,
      children: [
        Image.network(
          'https://cdn.pixabay.com/photo/2015/06/19/21/24/avenue-815297__480.jpg',
          fit: BoxFit.fill,
        ),
        Image.network(
          'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg?size=626&ext=jpg',
          fit: BoxFit.fill,
        ),
        Image.network(
          'https://images.unsplash.com/photo-1618588507085-c79565432917?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmVhdXRpZnVsJTIwbmF0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
          fit: BoxFit.fill,
        ),
        Image.network(
          'https://thumbs.dreamstime.com/b/concept-open-magic-book-pages-water-land-small-child-fantasy-nature-learning-copy-space-166401875.jpg',
          fit: BoxFit.fill,
        ),
        Image.network(
          'http://images.unsplash.com/photo-1546587348-d12660c30c50?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMjA3fDB8MXxzZWFyY2h8NHx8bmF0dXJhbHx8MHx8fHwxNjMwODE2MTA5&ixlib=rb-1.2.1&q=80&w=1080',
          fit: BoxFit.fill,
        ),
        Image.network(
          'https://thumbs-prod.si-cdn.com/P4Smi9MthEBXH7pdW8Y-bvwR6ts=/1072x720/filters:no_upscale()/https://public-media.si-cdn.com/filer/04/8e/048ed839-a581-48af-a0ae-fac6fec00948/gettyimages-168346757_web.jpg',
          fit: BoxFit.fill,
        ),
        Image.network(
          'https://economictimes.indiatimes.com/thumb/msid-68721417,width-1200,height-900,resizemode-4,imgsize-1016106/nature1_gettyimages.jpg?from=mdr',
          fit: BoxFit.fill,
        ),
        Image.network(
          'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20043864-f95034ab64c5d1dcb41b820a510d132b.jpeg?tr=q-40,c-at_max,w-740,h-500&_src=imagekit',
          fit: BoxFit.fill,
        ),
        Image.network(
            'https://mymodernmet.com/wp/wp-content/uploads/2021/04/Nature-Sounds-For-Well-Being-03.jpg',
            fit: BoxFit.fill),
      ],
    );
  }
}
