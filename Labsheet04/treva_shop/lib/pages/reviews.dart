import 'package:flutter/material.dart';
import 'package:treva_shop/components/star_rating.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ReviewsPage extends StatefulWidget {
  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  int _reviewsCount = 0;
  List _reviewList = [];

  void initState() {
    super.initState();
  }

  double _getAverageRating() {
    double avgRating = 0;
    if (_reviewList.length > 0) {
      this._reviewList.forEach((review) => avgRating += review['rating']);
      return avgRating / _reviewList.length;
    } else
      return 0;
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('reviews').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        _reviewList = snapshot.data.documents;
        _reviewsCount = _reviewList.length;

        return Padding(
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
                      StarRating(rating: _getAverageRating(), iconSize: 22.0),
                      Text("$_reviewsCount Reviews")
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                  return true;
                },
                child: Expanded(
                  child: _buildList(_reviewList),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildList(List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => _buildListItem(data)).toList(),
    );
  }

  Widget _buildListItem(DocumentSnapshot data) {
    final userReview = Review.fromSnapshot(data);

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
                userReview.image,
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      StarRating(
                        rating: userReview.rating,
                      ),
                      Text(
                        DateFormat('dd MMM yyy').format(
                          userReview.date.toDate(),
                        ),
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
                      userReview.review,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
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
      body: _buildBody(context),
    );
  }
}

class Review {
  final String image;
  final double rating;
  final Timestamp date;
  final String review;

  Review.fromSnapshot(DocumentSnapshot snapshot)
      : assert(snapshot['rating'] != null),
        assert(snapshot['date'] != null),
        assert(snapshot['review'] != null),
        image = snapshot['image'],
        rating = snapshot['rating'].toDouble(),
        date = snapshot['date'],
        review = snapshot['review'];
}
