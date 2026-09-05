import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Test App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const ColorChangePage(),
    );
  }
}

class ColorChangePage extends StatefulWidget {
  const ColorChangePage({super.key});

  @override
  State<ColorChangePage> createState() => _ColorChangePageState();
}

class _ColorChangePageState extends State<ColorChangePage> {
  bool _isRed = false;

  void _toggleColor() {
    setState(() {
      _isRed = !_isRed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Web Test'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: ElevatedButton.icon(
                onPressed: _toggleColor,
                icon: Icon(
                  _isRed ? Icons.check_circle : Icons.touch_app,
                  color: Colors.white,
                ),
                label: Text(
                  _isRed ? 'Ich bin jetzt Rot!' : 'Klick mich!',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isRed ? Colors.red : Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 6,
                  shadowColor: _isRed
                      ? Colors.red.withOpacity(0.5)
                      : Colors.blueAccent.withOpacity(0.5),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _isRed
                  ? 'Status: Rot aktiviert (Klicke erneut zum Zurücksetzen)'
                  : 'Status: Standard',
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
