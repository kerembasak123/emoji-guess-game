import 'package:flutter/material.dart';
import 'game_screen.dart';

class TeamSetupScreen extends StatefulWidget {
  final String category;

  const TeamSetupScreen({super.key, required this.category});

  @override
  State<TeamSetupScreen> createState() => _TeamSetupScreenState();
}

class _TeamSetupScreenState extends State<TeamSetupScreen> {
  final TextEditingController _teamAController = TextEditingController();
  final TextEditingController _teamBController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Takımları Oluştur')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('${widget.category} Modu - Takım Adlarını Girin',
                style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 30),
            // Takım A
            TextField(
              controller: _teamAController,
              decoration: const InputDecoration(
                labelText: 'Takım A',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.group, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 20),
            // Takım B
            TextField(
              controller: _teamBController,
              decoration: const InputDecoration(
                labelText: 'Takım B',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.group, color: Colors.red),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50)),
              child: const Text('BAŞLA'),
              onPressed: () {
                if (_teamAController.text.isNotEmpty && _teamBController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(
                        category: widget.category,
                        teamA: _teamAController.text,
                        teamB: _teamBController.text,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Lütfen her iki takım adını da girin')),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _teamAController.dispose();
    _teamBController.dispose();
    super.dispose();
  }
}