// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CropPlusApp());
}

class CropPlusApp extends StatelessWidget {
  const CropPlusApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CropPlus',

      theme: ThemeData(
        primaryColor: const Color(0xFF1B5E20),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1B5E20),
          brightness: Brightness.light,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CropPlus'),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bienvenue sur CropPlus',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Votre assistant agronomique intelligent',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            // Main Actions Grid
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildFeatureCard(
                    context,
                    'Diagnostiquer',
                    Icons.camera_alt,
                    const DiagnosticScreen(),
                  ),
                  _buildFeatureCard(
                    context,
                    'Cartographie',
                    Icons.map,
                    const MapScreen(),
                  ),
                  _buildFeatureCard(
                    context,
                    'Historique',
                    Icons.history,
                    const HistoryScreen(),
                  ),
                  _buildFeatureCard(
                    context,
                    'Conseils',
                    Icons.lightbulb_outline,
                    const AdviceScreen(),
                  ),
                ],
              ),
            ),
            // Recent Activity Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Activités récentes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildActivityCard(
                    'Diagnostic - Maïs',
                    'Brûlure des feuilles détectée',
                    '2 heures',
                    Icons.warning,
                    Colors.orange,
                  ),
                  _buildActivityCard(
                    'Diagnostic - Riz',
                    'Culture saine',
                    '5 heures',
                    Icons.check_circle,
                    Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Scanner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Carte',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
      BuildContext context,
      String title,
      IconData icon,
      Widget destination,
      ) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard(
      String title,
      String description,
      String time,
      IconData icon,
      Color color,
      ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title),
        subtitle: Text(description),
        trailing: Text(time),
      ),
    );
  }
}

// Diagnostic Screen
class DiagnosticScreen extends StatelessWidget {
  const DiagnosticScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnostic'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Camera Preview Placeholder
          Container(
            margin: const EdgeInsets.all(16),
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.camera_alt,
              size: 64,
              color: Colors.grey,
            ),
          ),
          // Action Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Prendre une photo'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.image),
                  label: const Text('Galerie'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
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

// Map Screen
class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartographie'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Stack(
        children: [
          // Map Placeholder
          Container(
            color: Colors.grey[200],
            child: const Center(
              child: Text('Carte interactive'),
            ),
          ),
          // Legend
          Positioned(
            top: 16,
            right: 16,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Légende',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    _LegendItem(color: Colors.red, label: 'Haute incidence'),
                    _LegendItem(color: Colors.orange, label: 'Incidence moyenne'),
                    _LegendItem(color: Colors.green, label: 'Faible incidence'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}

// History Screen
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historique'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.orange,
                child: Icon(Icons.warning, color: Colors.white),
              ),
              title: Text('Diagnostic #${10 - index}'),
              subtitle: const Text('Brûlure des feuilles - Maïs'),
              trailing: const Text('Il y a 2 jours'),
            ),
          );
        },
      ),
    );
  }
}

// Advice Screen
class AdviceScreen extends StatelessWidget {
  const AdviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conseils techniques'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAdviceCard(
            'Traitement recommandé',
            'Application de fongicide systémique...',
            Icons.medication,
          ),
          _buildAdviceCard(
            'Mesures préventives',
            'Rotation des cultures, gestion de l\'irrigation...',
            Icons.shield,
          ),
          _buildAdviceCard(
            'Suivi cultural',
            'Inspection régulière des plants...',
            Icons.trending_up,
          ),
        ],
      ),
    );
  }

  Widget _buildAdviceCard(String title, String content, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.green),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(content),
          ],
        ),
      ),
    );
  }
}