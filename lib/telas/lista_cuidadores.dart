import 'package:flutter/material.dart';
import '../style/app_style.dart';
import 'detalhes_cuidador.dart';

class ListaCuidadores extends StatelessWidget {
  const ListaCuidadores({super.key});

  final List<Map<String, dynamic>> cuidadores = const [
    {
      'nome': 'Beatriz Almeida',
      'cidade': 'São Paulo - SP',
      'avaliacao': 4.9,
      'servico': 'Passeio',
      'descricao':
      'Apaixonada por animais e com experiência com cães.',
    },
    {
      'nome': 'Rafael Mendes',
      'cidade': 'São Paulo - SP',
      'avaliacao': 4.8,
      'servico': 'Hospedagem',
      'descricao':
      'Cuidador com espaço seguro e confortável para pets.',
    },
    {
      'nome': 'Camila Ferreira',
      'cidade': 'São Paulo - SP',
      'avaliacao': 5.0,
      'servico': 'Banho e tosa',
      'descricao':
      'Especialista em cuidados e higiene para pets.',
    },
    {
      'nome': 'Gabriel Rocha',
      'cidade': 'São Paulo - SP',
      'avaliacao': 4.7,
      'servico': 'Passeio',
      'descricao':
      'Experiência com cães de pequeno e médio porte.',
    },
    {
      'nome': 'Larissa Martins',
      'cidade': 'São Paulo - SP',
      'avaliacao': 4.9,
      'servico': 'Hospedagem',
      'descricao':
      'Ambiente tranquilo para seu pet se sentir em casa.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AmigoPet',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (valor) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ordenado por: $valor'),
                ),
              );
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 'Mais próximos',
                  child: Text('Mais próximos'),
                ),
                const PopupMenuItem(
                  value: 'Melhor avaliados',
                  child: Text('Melhor avaliados'),
                ),
              ];
            },
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppStyles.verdePrincipal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.pets,
                    color: AppStyles.branco,
                    size: 45,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'AmigoPet',
                    style: TextStyle(
                      color: AppStyles.branco,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Cuidando de quem você ama',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(
                Icons.pets,
                color: AppStyles.verdePrincipal,
              ),
              title: const Text('Cuidadores'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.calendar_month,
                color: AppStyles.verdePrincipal,
              ),
              title: const Text('Meus agendamentos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.settings,
                color: AppStyles.verdePrincipal,
              ),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cuidadores.length,
        itemBuilder: (context, index) {
          final cuidador = cuidadores[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 14),
            child: ListTile(
              contentPadding: const EdgeInsets.all(14),

              leading: CircleAvatar(
                radius: 30,
                backgroundColor: AppStyles.verdeClaro,
                child: const Icon(
                  Icons.person,
                  color: AppStyles.verdePrincipal,
                  size: 35,
                ),
              ),

              title: Text(
                cuidador['nome'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),

                  Text(
                    cuidador['servico'],
                  ),

                  const SizedBox(height: 4),

                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        cuidador['avaliacao'].toString(),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Text(
                    cuidador['cidade'],
                    style: const TextStyle(
                      color: AppStyles.cinza,
                    ),
                  ),
                ],
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: AppStyles.verdePrincipal,
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetalhesCuidador(
                        nome: cuidador['nome'],
                        cidade: cuidador['cidade'],
                        avaliacao: cuidador['avaliacao'],
                        servico: cuidador['servico'],
                        descricao: cuidador['descricao'],
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}