import 'package:flutter/material.dart';
import 'package:state_management/model/data.dart';
import 'package:state_management/ui/add_update_page.dart';

class CardWidget extends StatefulWidget {
  final Data data;

  CardWidget({
    required this.data,
  });

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddUpdatePage(widget.data),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 6),
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "https://media.istockphoto.com/vectors/vector-bag-with-school-stationery-vector-id1095003184?b=1&k=20&m=1095003184&s=612x612&w=0&h=82Ya4wIfb-lKkVJHxVUCaHwc0pG1V_rt3JTesP9Lvyw=",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.black12],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      padding: EdgeInsets.all(4.0),
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(widget.data.name,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                        if (isFavorite) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("Add ${widget.data.name} to favorite"),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Remove ${widget.data.name} from favorite"),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        }
                      });
                    },
                    icon: !isFavorite
                        ? const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                    disabledColor: Colors.grey,
                    splashRadius: 40,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
