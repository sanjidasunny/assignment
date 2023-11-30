import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0), // here the desired height
          child: AppBar(
            title: const Text(
                'Book List',
                style: TextStyle(fontSize: 50,fontWeight: FontWeight.w500)
            ),
            centerTitle: true,
            backgroundColor: Colors.blueAccent[100],
          )
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: const [
          BookCard('Harry Potter PART 1', 'J.K ROWLING', '4.7', 'https://i.ibb.co/mbTcrwG/1.jpg','magic story starting'),
          BookCard('Harry Potter PART 2', 'J.K ROWLING', '4.7', 'https://i.ibb.co/sCFqGsj/2.jpg','welcome to the hallway'),

        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String rating;
  final String img;
  final String description;

  const BookCard(this.bookName, this.authorName, this.rating,this.img,this.description);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow[200],
      child: ListTile(
        leading: Image.network(img),
        title: Text(bookName,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(authorName,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal)),
            Text('Rating: $rating',style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal)),
          ],
        ),
        trailing: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[400], // Background color
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BuyNowPage(bookName,authorName,rating,img,description),
              ),
            );
          },
          icon: const Icon(Icons.shopping_bag),
          label: const Text('Buy Now'),
        ),
      ),
    );
  }
}

class BuyNowPage extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String rating;
  final String img;
  final String description;

  const BuyNowPage(this.bookName, this.authorName, this.rating,this.img,this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[400],
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent[200],
        title: const Text('Buy Now'),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(img),
            Text('Book Name: $bookName',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300)),

            Text( 'Author: $authorName',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300)),
            Text('Description: $description',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300)),
            Text('Price: $rating',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300)),
            DropdownButton<String>(
              items: ['1 pieces', '2 pieces', '4 pieces']
                  .map((String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ))
                  .toList(),
              onChanged: (String? value) {
                // Handle dropdown value change
              },
              hint: const Text('Select an option',style: TextStyle(fontWeight: FontWeight.normal),),
            ),
            const Spacer(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green[200]),

              onPressed: () {

                Navigator.pop(context);
              },

              child: const Text('Go Back'),

            ),
          ],
        ),
      ),
    );
  }
}