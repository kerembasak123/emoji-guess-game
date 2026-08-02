import 'package:flutter/material.dart';
import 'team_setup_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kategori Seç')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Hangi Kategoride Oynamak İstersiniz?',
                style: TextStyle(fontSize: 22)),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Şarkı Kategorisi
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeamSetupScreen(category: 'ŞARKI'),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.music_note, size: 60, color: Colors.blue[800]),
                        const SizedBox(height: 10),
                        const Text('ŞARKI',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
                // Film/Dizi Kategorisi
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeamSetupScreen(category: 'FİLM/DİZİ'),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.movie, size: 60, color: Colors.red[800]),
                        const SizedBox(height: 10),
                        const Text('FİLM/DİZİ',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))
              ),
              child: const Text('OYUNA BAŞLA'),
              onPressed: () {
                // Varsayılan kategori ile geçiş
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeamSetupScreen(category: 'ŞARKI'),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}