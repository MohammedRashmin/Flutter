import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Dynamic list of articles (for example, fetched from an API)
  List<Map<String, String>> articles = [
    {
      "title": "Harris vs. Trump — and what’s at stake for the world",
      "description": "Ian Bremmer • 887K views • 16 days ago",
      "subtitle": "POLITICS",
      "image":
          "https://images.pexels.com/photos/1026679/pexels-photo-1026679.jpeg?cs=srgb&dl=curry-delicious-food-delicious-indian-food-indian-cuisine-1026679.jpg&fm=jpg"
    },
    {
      "title": "Your empty wine bottle could help rebuild coastlines",
      "description": "Franziska Trautmann • 371K views • 6 days ago",
      "subtitle": "CLIMATE CHANGE",
      "image":
          "https://th.bing.com/th/id/R.47a635c80c67a7ecfd58b6e3bf4a61f8?rik=kBu9Uema3hK7iw&riu=http%3a%2f%2fwww.melissahartfiel.com%2fwp-content%2fuploads%2f2013%2f04%2f20130426-1304_untitled0051.jpg&ehk=n5Aoqgsqv7VERcHRAHV7gUSficnJRMA0gesRmZHRCWI%3d&risl=&pid=ImgRaw&r=0"
    },
  ];

  // Function to add a new article dynamically
  void addArticle() {
    setState(() {
      articles.add({
        "title": "New Article Added",
        "description": "Unknown • 100K views • Just now",
        "subtitle": "GENERAL",
        "image":
            "https://upload.wikimedia.org/wikipedia/commons/c/c1/Indian-Food-wikicont.jpg"
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: addArticle, // Add article when button is clicked
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // First large card
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: buildCard(
                  isLarge: true,
                  image: Image.network(
                    'https://th.bing.com/th/id/R.7e5273cea769ce5e4df569e2c3356562?rik=osjApSDgzfv3uA&pid=ImgRaw&r=0',
                    fit: BoxFit.cover,
                  ),
                  title: 'The tipping point I got wrong',
                  description:
                      'In his 2000 bestseller "The Tipping Point," Malcolm Gladwell told the story of why crime fell in New York City in the 1990s...',
                  subtitle: 'Malcolm Gladwell • 215K views • 19 hours ago',
                ),
              ),
              const SizedBox(height: 16),

              // Grid Layout for the remaining cards
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: articles.map((article) {
                  return buildSmallCard(
                    title: article["title"]!,
                    description: article["description"]!,
                    subtitle: article["subtitle"]!,
                    image: Image.network(article["image"]!, fit: BoxFit.cover),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Card Widgets
  Widget buildCard({
    Widget? image,
    required String title,
    required String description,
    required String subtitle,
    bool isLarge = false,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: isLarge
                    ? SizedBox(height: 300, width: double.infinity, child: image)
                    : image,
              ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                  fontSize: isLarge ? 22 : 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: isLarge ? 16 : 14),
              maxLines: isLarge ? null : 3,
              overflow:
                  isLarge ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSmallCard({
    Widget? image,
    required String title,
    required String description,
    required String subtitle,
  }) {
    return SizedBox(
      width: 300,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child:
                      SizedBox(height: 120, width: double.infinity, child: image),
                ),
              const SizedBox(height: 8),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
