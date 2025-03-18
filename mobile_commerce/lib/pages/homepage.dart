import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
        backgroundColor: Color(0xFFF8BBF2),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                    child: Image.asset(
                      'assets/profile.png',
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.broken_image, color: Colors.grey);
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Text('นายธนาธาร จันทร์โท')
                ]
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'สถานะ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildStatusCard('สถานที่ทำงาน', '😄'),
                    const SizedBox(width: 12),
                    _buildStatusCard('กีฬา', '🏀'),
                    const SizedBox(width: 12),
                    _buildStatusCard('การแต่งกาย', '👕'),
                    const SizedBox(width: 12),
                    _buildStatusCard('อาหาร', '🍜'),
                    const SizedBox(width: 12),
                    _buildStatusCard('ดนตรี', '🎵'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'สถานที่ท่องเที่ยว',
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      ),),
                  SizedBox(width: 20),
                  Text(
                    'ธรรมชาติ',
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),)
                ]
              ),
            ),
            _buildListItem(
              'น้ำตกธรรมชาติ',
              'น้ำตกที่สวยงามท่ามกลางป่าเขียวขจี\nบรรยากาศร่มรื่น เย็นสบาย',
              'assets/น้ำตก.png',
            ),
            _buildListItem(
              'ภูเขาหิมะ',
              'ภูเขาสูงตระหง่านพร้อมหิมะปกคลุม\nวิวทิวทัศน์สวยงาม',
              'assets/ภูเขา.png',
            ),
            _buildListItem(
              'ทะเลสาบในหุบเขา',
              'ทะเลสาบสีฟ้าใสท่ามกลางขุนเขา\nอากาศบริสุทธิ์ วิวสวยงาม',
              'assets/แม่น้ำ.png',
            ),
          ]
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: ''),
            ]),
          Positioned(
            top: 0,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  )
                ]
              ),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 30,
              ),
            )
          )
        ],
      ),
    );
  }
  //status card
  Widget _buildStatusCard(String title, String icon) {
    return Container(
      width: 110,
      height: 140,
      decoration: BoxDecoration(
        color: const Color.fromARGB(174, 255, 247, 201),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
  //list item
  Widget _buildListItem(String title, String subtitle, String imagePath) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 150,
              height: 150,
              color: Colors.grey[300],
              child: const Icon(Icons.broken_image, color: Colors.grey),
            );
          },
        ),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}
