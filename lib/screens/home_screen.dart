import 'package:flutter/material.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dados simulados para preencher o escopo da Opção 1
    final List<Map<String, String>> serviceOrders = [
      {
        'id': 'OS-2026-001',
        'client': 'Lab de Informática 3',
        'status': 'Em Andamento',
        'desc': 'Manutenção preventiva dos computadores.',
      },
      {
        'id': 'OS-2026-002',
        'client': 'Secretaria Executiva',
        'status': 'Aberta',
        'desc': 'Configuração de nova sub-rede local.',
      },
      {
        'id': 'OS-2026-003',
        'client': 'Bloco Técnico B',
        'status': 'Concluída',
        'desc': 'Troca de switch e testes de patch panel.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('TechService Home'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sair do App',
            onPressed: () {
              // Melhores Práticas: Ao deslogar, limpa a pilha
              // para impedir navegação reversa à Home
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
          ), // IconButton
        ],
      ), // AppBar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Painel de Atividades',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E3A8A),
              ), // TextStyle
            ), // Text
            const SizedBox(height: 8),
            const Text('Olá, Técnico. Veja os seus chamados para hoje:'),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: serviceOrders.length,
                itemBuilder: (context, index) {
                  final os = serviceOrders[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    elevation: 2,
                    child: ListTile(
                      leading: Icon(
                        os['status'] == 'Concluída'
                            ? Icons.check_circle
                            : os['status'] == 'Em Andamento'
                                ? Icons.pending
                                : Icons.error_outline,
                        color: os['status'] == 'Concluída'
                            ? Colors.green
                            : os['status'] == 'Em Andamento'
                                ? Colors.orange
                                : Colors.red,
                      ), // Icon
                      title: Text(
                        '${os['id']} - ${os['client']}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ), // Text
                      subtitle: Text(os['desc'] ?? ''),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ), // EdgeInsets.symmetric
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade50,
                          borderRadius: BorderRadius.circular(4),
                        ), // BoxDecoration
                        child: Text(
                          os['status'] ?? '',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ), // TextStyle
                        ), // Text
                      ), // Container
                    ), // ListTile
                  ); // Card
                },
              ), // ListView.builder
            ), // Expanded
          ],
        ), // Column
      ), // Padding
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'Funcionalidade de criar nova OS em desenvolvimento.'),
            ), // SnackBar
          );
        },
        child: const Icon(Icons.add),
      ), // FloatingActionButton
    ); // Scaffold
  }
}