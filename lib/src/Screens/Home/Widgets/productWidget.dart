import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class ProductWidget extends StatelessWidget {
  final dynamic lastItem;
  const ProductWidget({Key key, this.lastItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 100,
            height: 120,
            child: Stack(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    image: DecorationImage(
                      image: NetworkImage(
                        lastItem.image == null
                            ? "https://cdn.pixabay.com/photo/2016/12/19/21/36/winters-1919143_1280.jpg"
                            : "https://five-starsupplies.com/users/images/${lastItem.image.image}",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment:  Alignment.topLeft,
                  child: lastItem.favorited == 0
                      ? Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                ),
                Align(
                alignment: Alignment.topRight,
                child: lastItem.offer == 1
                    ? Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                        size: 15,
                      )
                    : Container(),
              ),
              ],
            ),
          ),
          SizedBox(
            width: 100,
            child: AutoSizeText(
              lastItem.title ?? "اسم المنتج",
              maxLines: 2,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
            ),
          ),
          RatingBarIndicator(
            rating: double.parse(lastItem.rate.toString()),
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            unratedColor: Colors.grey[400],
            itemSize: 15.0,
            direction: Axis.horizontal,
          ),
        ],
      ),
    );
  }
}