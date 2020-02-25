import 'package:flutter/material.dart';

class AppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/main_image_smo.jpeg'),
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.dstATop,
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Treva Shop",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 100,
                          child: Divider(
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          "Get best products in treva shop",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 45.0,
                      child: FlatButton(
                        splashColor: Colors.white12,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(40.0),
                            side: BorderSide(color: Colors.white60)),
                        child: Center(
                          child: Text(
                            "Signup",
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Divider(
                              color: Colors.white70,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                "OR SKIP",
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Divider(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 45.0,
                      child: FlatButton(
                        splashColor: Colors.white12,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(40.0),
                            side: BorderSide(color: Colors.white60)),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
