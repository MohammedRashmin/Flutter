import 'package:flutter/material.dart';
import 'login_page.dart';
// Import LoginPage

class SignUpPage extends StatefulWidget {
  
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Account Created Successfully!")),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to LoginPage
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: isMobile ? screenWidth * 0.9 : 800,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 242, 239, 239),
              image: DecorationImage(
                image: NetworkImage("https://www.cypressgreen.in/blog/wp-content/uploads/2021/03/food-2048x1366.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(66, 204, 199, 199),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildSignUpForm(),
                if (isMobile) SizedBox(height: 20),
                _buildImageSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "Welcome To Rash Restaurant",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  SizedBox(height: 5),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lock, color: const Color.fromARGB(255, 62, 74, 85), size: 24),
                    SizedBox(width: 8),
                    Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 14, 46, 73)),
                    ),
                  ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_3),
                labelText: "Enter your email",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email";
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return "Enter a valid email";
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: "Enter your password",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your password";
                } else if (value.length < 6) {
                  return "Password must be at least 6 characters";
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: "Confirm your password",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              validator: (value) {
                if (value != _passwordController.text) {
                  return "Passwords do not match";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _signUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 31, 47, 59),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text("Sign Up"),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text("Already have an account? Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://th.bing.com/th///id/R.38b38667d672a4d545b10d47ce683e89?rik=LOXTUqzH6jjKCQ&riu=http%3a%2f%2fstudio3.com%2fblog%2fwp-content%2fuploads%2f2015%2f05%2fsteak-potato-restaurant-dinner-food-photography-studio-3.jpg&ehk=blW6ACwhDpa9%2b6aVobLC8FM6MmG0qqpx%2bPsyahCTjO4%3d&risl=&pid=ImgRaw&r=0'
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
  
}
