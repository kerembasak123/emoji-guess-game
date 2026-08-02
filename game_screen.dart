import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class GameScreen extends StatefulWidget {
  final String category;
  final String teamA;
  final String teamB;

  const GameScreen({
    super.key,
    required this.category,
    required this.teamA,
    required this.teamB,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _currentTeam = 0; // 0: Takım A, 1: Takım B
  int _teamAScore = 0;
  int _teamBScore = 0;
  int _remainingTime = 30;
  int _passCount = 3;
  int _jokerCount = 2;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // Geri sayım timer'ı burada başlatılabilir
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _useJoker() {
    if (_jokerCount > 0) {
      setState(() {
        _jokerCount--;
      });

      if (widget.category == 'ŞARKI') {
        // Müzik çal
        _audioPlayer.play(UrlSource('https://example.com/sample.mp3'));
      } else {
        // Film/Dizi için oyuncu resmi göster
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Joker Kullanıldı'),
            content: Image.network('https://example.com/actor.jpg'),
            actions: [
              TextButton(
                child: const Text('Kapat'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Kategori Başlığı
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: widget.category == 'ŞARKI' ? Colors.blue[800] : Colors.red[800],
            child: Center(
              child: Text(
                '[${widget.category}]',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Emojiler
          Expanded(
            child: Center(
              child: Text(
                '🎤 🌟 🎧',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ),

          // Geri Sayım
          Text(
            '⏱️ $_remainingTime',
            style: const TextStyle(fontSize: 28),
          ),

          // Kontroller
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.skip_next),
                  label: Text('PAS ($_passCount)'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  ),
                  onPressed: () {
                    if (_passCount > 0) {
                      setState(() {
                        _passCount--;
                        _currentTeam = (_currentTeam + 1) % 2;
                      });
                    }
                  },
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.card_giftcard),
                  label: Text('JOKER ($_jokerCount)'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  ),
                  onPressed: _useJoker,
                ),
              ],
            ),
          ),

          // Takım Bilgisi
          Container(
            padding: const EdgeInsets.all(15),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Takım: ${_currentTeam == 0 ? widget.teamA : widget.teamB}',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Puan: ${_currentTeam == 0 ? _teamAScore : _teamBScore}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}