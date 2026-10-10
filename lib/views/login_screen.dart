import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/home_screen.dart';
import 'package:flutter_application_1/services/local_storage_service.dart';

class LoginScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController(); // Kontroller ekledik => TextField'daki metni alabiliriz
  TextEditingController surnameController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  LocalStorageService lsService = LocalStorageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey, // Assign the form key

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),

                Text(
                  "Please login to your account",
                  style: TextStyle(color: Colors.grey),
                ),

                SizedBox(height: 40),

                TextFormField(
                  controller: nameController, // Kontroller ekledik => TextField'daki metni alabiliriz
                  decoration: InputDecoration(
                    labelText: "Name",
                    prefixIcon: Icon(Icons.person_outlined),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),

                  validator: (value) {
                    // Validasyon ekledik => Eğer metin boşsa hata mesajı gösterir
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: surnameController,
                  decoration: InputDecoration(
                    labelText: "Surname",
                    prefixIcon: Icon(Icons.person_outlined),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),

                  validator: (value) {
                    // Validasyon ekledik => Eğer metin boşsa hata mesajı gösterir
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your surname';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {
                    // Eğer form geçerliyse sayfalar arası geçiş yapabiliriz
                    if (_formKey.currentState!.validate()) {
                      lsService.saveData(nameController.text); //formun validasyonu gerçekleşirse localstorageda saklanacak

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      ); // başarılıysa newsScreen sayfasına yönlendir
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
