import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Star Rating'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Rating $rating', style: TextStyle(fontSize: 40)),
            const SizedBox(height: 32),
            buildRating(),
            const SizedBox(height: 32),
            TextButton(
                onPressed: () => showRating(),
                child: Text(
                  'Show Dialog',
                  style: TextStyle(fontSize: 32),
                ))
          ],
        ),
      ),
    );
  }

  showRating() => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Rate This App'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Please leave a star rating.',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 32),
              buildRating()
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'OK',
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      );

  Widget buildRating() => RatingBar.builder(
        initialRating: rating,
        minRating: 1,
        itemSize: 46,
        itemPadding: EdgeInsets.symmetric(horizontal: 4),
        itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
        updateOnDrag: true,
        onRatingUpdate: (rating) => setState(() {
          this.rating = rating;
        }),
      );
}
