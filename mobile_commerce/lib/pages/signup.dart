import 'package:flutter/material.dart';
import 'dart:io';
import 'homepage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  File? _imageFile;
  final List<String> _prefixname = ['นาย', 'นาง', 'นางสาว'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
        backgroundColor: Colors.pink[200],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'สมัครสมาชิก',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: GestureDetector(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                  child: _imageFile == null ? const Icon(Icons.camera_alt, size: 40, color: Colors.blue):null,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('คำนำหน้าชื่อ'),
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: _prefixname.map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e))).toList(),
                onChanged: (value){}
            ),
            SizedBox(height: 20),
            Text('ชื่อจริง'),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            const Text('นามสกุล'),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('เบอร์โทร'),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            Text('วัน/เดือน/ปีเกิด'),
            TextFormField(
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              controller: TextEditingController(
                text: _selectedDate != null ? 
                      '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                      : '',
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }, 
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],),
                child: Text(
                  'บันทึก',
                  style: TextStyle(color: Colors.white),),
                ),
              )
            
          ],
        ),
      ),
    );
  }
}