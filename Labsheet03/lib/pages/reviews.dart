import 'package:flutter/material.dart';
import 'package:treva_shop/components/star_rating.dart';

class ReviewsPage extends StatefulWidget {
  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  double totalRating;
  var reviews = [
    {
      "image": "assets/images/avatars/user_1.png",
      "rating": 5.0,
      "date": "18 Feb 2020",
      "review":
          "Item delivered in good condition. I recommend to other buyers.\n\n"
              "Very Recommended item."
    },
    {
      "image": "assets/images/avatars/user_2.png",
      "rating": 4.5,
      "date": "15 Feb 2020",
      "review": "Item delivered in good condition. I recommend to other buyers."
    },
    {
      "image": "assets/images/avatars/user_3.png",
      "rating": 4.0,
      "date": "02 Feb 2020",
      "review": "Item delivered in good condition. I recommend to other buyers."
    },
    {
      "image": "assets/images/avatars/user_4.png",
      "rating": 4.5,
      "date": "28 Jan 2020",
      "review": "Item delivered in good condition. I recommend to other buyers."
    },
    {
      "image": "assets/images/avatars/user_5.png",
      "rating": 5.0,
      "date": "21 Jan 2020",
      "review": "Item delivered in good condition. I recommend to other buyers."
    },
    {
      "image": "assets/images/avatars/user_6.png",
      "rating": 4.0,
      "date": "14 Jan 2020",
      "review": "Item delivered in good condition. I recommend to other buyers."
    },
    {
      "image": "assets/images/avatars/user_7.png",
      "rating": 5.0,
      "date": "04 Jan 2020",
      "review": "Item delivered in good condition. I recommend to other buyers."
    },
    {
      "image": "assets/images/avatars/user_8.png",
      "rating": 5.0,
      "date": "01 Jan 2020",
      "review": "Item delivered in good condition. I recommend to other buyers."
    }
  ];

  double averageRating() {
    totalRating = 0;
    reviews.forEach((review) => totalRating += review['rating']);
    return totalRating / reviews.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Reviews",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Reviews",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: <Widget>[
                    StarRating(rating: averageRating(), iconSize: 22.0),
                    Text(reviews.length.toString() + " Reviews")
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                  return true;
                },
                child: ListView.builder(
                  itemCount: reviews.length,
                  itemBuilder: (context, int index) {
                    return Column(
                      children: <Widget>[
                        Divider(
                          color: Colors.grey,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                reviews[index]['image'],
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      StarRating(
                                        rating: reviews[index]['rating'],
                                      ),
                                      Text(
                                        reviews[index]['date'],
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(
                                    child: Text(
                                      reviews[index]['review'],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
