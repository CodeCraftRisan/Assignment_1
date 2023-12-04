import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookListPage(),
    );
  }
}

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            'Book List',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          CardWidget(
            bookName: 'The Daughter tale',
            authorName: 'Armando Lucas Correa',
            rating: 4.5,
            imageUrl:
                'https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781501187933/the-daughters-tale-9781501187933_xlg.jpg', // Replace with book 1 image URL
          ),
          CardWidget(
            bookName: 'Gorgeous Lies',
            authorName: 'Martha McPhee',
            rating: 4.8,
            imageUrl:
                'https://offtheshelf.b-cdn.net/app/uploads/2019/12/Goergeous-Lies.jpg', // Replace with book 2 image URL
          ),
          CardWidget(
            bookName: 'All the Missing Girls',
            authorName: 'Megan Miranda',
            rating: 4.2,
            imageUrl:
                'https://offtheshelf.b-cdn.net/app/uploads/2017/03/All-the-Missing-Girls.jpg', // Replace with book 3 image URL
          ),
          CardWidget(
            bookName: 'The Winemakers Wife',
            authorName: 'Kristin Harmel',
            rating: 4.0,
            imageUrl:
                'https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781982112301/the-winemakers-wife-9781982112301_xlg.jpg', // Replace with book 4 image URL
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String bookName;
  final String authorName;
  final double rating;
  final String imageUrl; // Add imageUrl for the book cover

  const CardWidget({
    required this.bookName,
    required this.authorName,
    required this.rating,
    required this.imageUrl, // Pass imageUrl to the constructor
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          color: Colors.grey,
          child: Image.network(imageUrl), // Use imageUrl here
        ),
        title: Text(bookName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(authorName),
            Text('Rating: $rating'),
          ],
        ),
        trailing: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BuyNowPage(
                  bookName: bookName,
                  authorName: authorName,
                  rating: rating,
                  imageUrl: imageUrl, // Pass imageUrl to the BuyNowPage
                ),
              ),
            );
          },
          icon: Icon(Icons.shopping_cart),
          label: Text('Buy Now'),
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.greenAccent, // Change this color to your preference
          ),
        ),
      ),
    );
  }
}

class BuyNowPage extends StatelessWidget {
  final String bookName;
  final String authorName;
  final double rating;
  final String imageUrl; // Add imageUrl for the book cover

  const BuyNowPage({
    required this.bookName,
    required this.authorName,
    required this.rating,
    required this.imageUrl, // Pass imageUrl to the constructor
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            'Buy Now',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 150,
              color: Colors.green,
              child: Image.network(imageUrl), // Use imageUrl here
            ),
            SizedBox(height: 16.0),
            Text(
              bookName,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text('by $authorName'),
            Text('Rating: $rating'),
            SizedBox(height: 16.0),
            Text(
                'The author of the “engrossing” (People) international bestseller The Room on Rue Amélie returns with a moving story set amid the champagne vineyards of France during the darkest days of World War II, perfect for fans of Heather Morris’s The Tattooist of Auschwitz.'),
            SizedBox(height: 16.0),
            Text('Price: \$19.99'),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: 'Historical Fiction',
              onChanged: (String? newValue) {
                // Handle dropdown value change
              },
              items: [
                'Historical Fiction',
                'Biography',
                'Memoir',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Go Back',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.red, // Change this color as your preference
              ),
            ),
          ],
        ),
      ),
    );
  }
}
