import 'package:flutter/material.dart';

class JijiScreen extends StatelessWidget {
  const JijiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 10),

              const Text(
                "Jiji",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Your AI Friend",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 62,
                  backgroundColor: Colors.teal.shade100,
                  child: const CircleAvatar(
                    radius: 58,
                    backgroundImage:
                        AssetImage('assets/images/jiji_avatar.png'),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                decoration: InputDecoration(
                  hintText: "Explain RAG",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.send, color: Colors.teal),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jiji says",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade700,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "Retrieval-Augmented Generation (RAG) combines search "
                        "with large language models to improve the accuracy of "
                        "generated answers by providing relevant information "
                        "from external data sources.",
                      ),

                      const SizedBox(height: 10),

                      _bullet("Retrieves data from external sources"),
                      _bullet("Uses a language model to generate answers"),
                      _bullet("Enhances the accuracy of responses"),

                      const SizedBox(height: 16),

                      _resourceCard(
                        context: context,
                        icon: Icons.slideshow,
                        title: "Presentation on RAG",
                        subtitle: "PowerPoint Presentation",
                        buttonText: "Open",
                      ),

                      _resourceCard(
                        context: context,
                        icon: Icons.play_circle,
                        title: "What is RAG?",
                        subtitle: "YouTube Video",
                        buttonText: "Watch",
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "VeidaLabs",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Bullet point widget
  static Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          const Icon(Icons.circle, size: 8),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  // 🔹 Resource card with snackbar
  static Widget _resourceCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required String buttonText,
  }) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(icon, size: 36, color: Colors.teal),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$buttonText coming soon'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
