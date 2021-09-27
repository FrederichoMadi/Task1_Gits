import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:foodstuff/src/data/food.dart';
import 'package:foodstuff/src/ui/form_food_page.dart';

class CardFood extends StatefulWidget {
  Food food;

  CardFood({required this.food});

  @override
  _CardFoodState createState() => _CardFoodState();
}

class _CardFoodState extends State<CardFood> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, FormFoodPage.routeName,
            arguments: widget.food);
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 8),
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FormFoodPage(widget.food),
              ),
            );
          },
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
                  child: Image(
                    image: NetworkImage(
                      widget.food.urlImage,
                    ),
                    fit: BoxFit.fill,
                    errorBuilder: (context, exception, stackTrace) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.error_outline_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              "Wrong url, please update your url",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.black12],
                      begin: Alignment.topCenter,
                      end: Alignment(0.1, -0.3),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            widget.food.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          child: Ink(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                  if (isFavorite) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            "Add ${widget.food.name} to favorite"),
                                        duration: const Duration(seconds: 1),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            "Remove ${widget.food.name} from favorite"),
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
                            decoration: const ShapeDecoration(
                              shape: CircleBorder(),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.black45.withOpacity(0.6),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          )),
                      child: Text(
                        widget.food.description,
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
