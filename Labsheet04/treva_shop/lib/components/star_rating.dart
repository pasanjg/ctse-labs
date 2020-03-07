import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double iconSize;

  StarRating({
    Key key,
    this.rating = 0,
    this.iconSize = 20.0,
  })  : assert(rating != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          5,
          (index) {
            return rating <= index
                ? Icon(
                    Icons.star_border,
                    color: Colors.amber,
                    size: iconSize,
                  )
                : index > rating - 1 && index < rating
                    ? Icon(
                        Icons.star_half,
                        color: Colors.amber,
                        size: iconSize,
                      )
                    : Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: iconSize,
                      );
          },
        ),
      ),
    );
  }
}
