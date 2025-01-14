import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currículo/Portfólio',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            // Scroll para o início da página
            _scrollToSection(context, 'home');
          },
          child: const Text('RafaUrbanek',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Scroll para a seção "Sobre Mim"
              _scrollToSection(context, 'about');
            },
            child: const Text('About Me',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
          ),
          TextButton(
            onPressed: () {
              // Scroll para a seção "Habilidades"
              _scrollToSection(context, 'skills');
            },
            child: const Text('Skills',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
          ),
          TextButton(
            onPressed: () {
              // Scroll para a seção "Projetos"
              _scrollToSection(context, 'projects');
            },
            child: const Text('Projects',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
          ),
          TextButton(
            onPressed: () {
              // Scroll para a seção "Contato"
              _scrollToSection(context, 'contact');
            },
            child: const Text('Contact',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
          ),
        ],
      ),
      body: const PortfolioContent(),
    );
  }

  void _scrollToSection(BuildContext context, String key) {
    final sectionKey = _sections[key];
    if (sectionKey != null) {
      Scrollable.ensureVisible(
        sectionKey.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}

// Map para armazenar as GlobalKeys de cada seção
final Map<String, GlobalKey> _sections = {
  'home': GlobalKey(),
  'about': GlobalKey(),
  'skills': GlobalKey(),
  'projects': GlobalKey(),
  'contact': GlobalKey(),
};

// Conteúdo do portfólio
class PortfolioContent extends StatelessWidget {
  const PortfolioContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            key: _sections['home'],
            padding: const EdgeInsets.all(20),
            color: Colors.blue,
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/profile.jpg'), // Coloque uma imagem no diretório assets
                ),
                SizedBox(height: 10),
                Text(
                  'Seu Nome',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'Desenvolvedor Flutter | Mobile & Web',
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
              ],
            ),
          ),
          // Seção: Sobre Mim
          Container(
            key: _sections['about'],
            padding: const EdgeInsets.all(20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sobre Mim',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Sou um desenvolvedor apaixonado por criar soluções incríveis usando Flutter. '
                  'Tenho experiência em desenvolvimento de aplicativos móveis e web, com foco em design responsivo e desempenho.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          // Seção: Habilidades
          Container(
            key: _sections['skills'],
            padding: const EdgeInsets.all(20),
            color: Colors.grey[200],
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Habilidades',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('• Flutter & Dart', style: TextStyle(fontSize: 16)),
                Text('• Firebase & REST APIs', style: TextStyle(fontSize: 16)),
                Text('• UI/UX Design', style: TextStyle(fontSize: 16)),
                Text('• Git & Controle de Versão',
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          // Seção: Projetos
          Container(
            key: _sections['projects'],
            padding: const EdgeInsets.all(20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Projetos',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '1. App de E-commerce - Um aplicativo completo de compras online.',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '2. Sistema de Gestão de Tarefas - Uma solução web responsiva.',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '3. Portfólio Pessoal - Site para apresentar meus projetos e currículo.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          // Seção: Contato
          Container(
            key: _sections['contact'],
            padding: const EdgeInsets.all(20),
            color: const Color.fromARGB(255, 33, 150, 243),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contato',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'Email: seuemail@exemplo.com',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  'LinkedIn: linkedin.com/in/seuperfil',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  'GitHub: github.com/seuperfil',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
