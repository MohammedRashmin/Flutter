import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> articles = [
    {
      "title": 'The tipping point I got wrong',
      "description":
          'In his 2000 bestseller "The Tipping Point," Malcolm Gladwell told the story of why crime fell in New York City in the 1990s.',
      "subtitle": 'Malcolm Gladwell • 215K views • 19 hours ago',
      "image":
          'https://th.bing.com/th/id/R.7e5273cea769ce5e4df569e2c3356562?rik=osjApSDgzfv3uA&pid=ImgRaw&r=0',
      "isFavorite": false,
      "inCart": false,
    },
    {
      "title": 'Harris vs. Trump — and what’s at stake for the world',
      "description": 'Ian Bremmer • 887K views • 16 days ago',
      "subtitle": 'POLITICS',
      "image":
          'https://images.pexels.com/photos/1026679/pexels-photo-1026679.jpeg',
      "isFavorite": false,
      "inCart": false,
    }
  ];

  List<Map<String, dynamic>> cart = [];
  int _selectedIndex = 0;

  void toggleFavorite(int index) {
    setState(() {
      articles[index]['isFavorite'] = !articles[index]['isFavorite'];
    });
  }

  void addToCart(int index) {
    setState(() {
      if (!articles[index]['inCart']) {
        articles[index]['inCart'] = true;
        cart.add(articles[index]);
      }
    });
  }

  void removeFromCart(int index) {
    setState(() {
      cart[index]['inCart'] = false;
      cart.removeAt(index);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToPage(String value) {
    if (value == "About Us") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsPage()));
    } else if (value == "Terms & Conditions") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => TermsPage()));
    } else if (value == "Contact Us") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ContactPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          PopupMenuButton<String>(
            onSelected: _navigateToPage,
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(value: "Home", child: Text("Home")),
              PopupMenuItem(value: "About Us", child: Text("About Us")),
              PopupMenuItem(value: "Terms & Conditions", child: Text("Terms & Conditions")),
              PopupMenuItem(value: "Contact Us", child: Text("Contact Us")),
            ],
          ),
        ],
      ),
      body: _selectedIndex == 0 ? buildHome() : buildCart(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget buildHome() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: buildCard(articles[0], isLarge: true, index: 0),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(
              articles.length - 1,
              (index) => buildCard(articles[index + 1], index: index + 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCart() {
    return ListView.builder(
      itemCount: cart.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.network(cart[index]['image'], width: 50, height: 50),
          title: Text(cart[index]['title']),
          subtitle: Text(cart[index]['subtitle']),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle, color: Colors.red),
            onPressed: () => removeFromCart(index),
          ),
        );
      },
    );
  }

  Widget buildCard(Map<String, dynamic> article, {bool isLarge = false, required int index}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: SizedBox(
                height: isLarge ? 300 : 150,
                width: double.infinity,
                child: Image.network(article["image"], fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    article["title"],
                    style: TextStyle(fontSize: isLarge ? 22 : 18, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    article["isFavorite"] ? Icons.favorite : Icons.favorite_border,
                    color: article["isFavorite"] ? Colors.red : Colors.grey,
                  ),
                  onPressed: () => toggleFavorite(index),
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
              article["description"],
              style: TextStyle(fontSize: isLarge ? 16 : 14),
              maxLines: isLarge ? null : 3,
              overflow: isLarge ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
            SizedBox(height: 10),
            Text(
              article["subtitle"],
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => addToCart(index),
              child: Text(article["inCart"] ? "Added to Cart" : "Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}

// Pages for Navigation
class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Us")),
      body: Center(child: Text("This is the About Us page")),
    );
  }
}

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Terms & Conditions")),
      body: Center(child: Text("This is the Terms & Conditions page")),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact Us")),
      body: Center(child: Text("This is the Contact Us page")),
    );
  }
}
