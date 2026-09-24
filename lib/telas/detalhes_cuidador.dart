import 'package:flutter/material.dart';
import '../style/app_style.dart';

class DetalhesCuidador extends StatelessWidget {
  final String nome;
  final String cidade;
  final double avaliacao;
  final String servico;
  final String descricao;

  const DetalhesCuidador({
    super.key,
    required this.nome,
    required this.cidade,
    required this.avaliacao,
    required this.servico,
    required this.descricao,
  });

  void mostrarTipoServico(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Tipo de serviço'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Passeio'),
            ),

            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Hospedagem'),
            ),

            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Banho e tosa'),
            ),
          ],
        );
      },
    );
  }

  void mostrarCancelamento(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Cancelar agendamento?',
          ),

          content: const Text(
            'Tem certeza que deseja cancelar este agendamento?',
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Não',
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Agendamento cancelado.',
                    ),
                  ),
                );
              },
              child: const Text(
                'Sim, cancelar',
              ),
            ),
          ],
        );
      },
    );
  }

  void mostrarMaisOpcoes(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.share,
                  color: AppStyles.verdePrincipal,
                ),
                title: const Text(
                  'Compartilhar perfil',
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.flag,
                  color: Colors.red,
                ),
                title: const Text(
                  'Denunciar',
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          'Detalhes do cuidador',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
            ),
            onPressed: () {
              mostrarMaisOpcoes(context);
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 55,
                backgroundColor: AppStyles.verdeClaro,
                child: const Icon(
                  Icons.person,
                  size: 65,
                  color: AppStyles.verdePrincipal,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: Text(
                nome,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),

                  const SizedBox(width: 5),

                  Text(
                    avaliacao.toString(),
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Sobre o cuidador',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              descricao,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: AppStyles.verdePrincipal,
                ),

                const SizedBox(width: 8),

                Text(
                  cidade,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(
                  Icons.pets,
                  color: AppStyles.verdePrincipal,
                ),

                const SizedBox(width: 8),

                Text(
                  servico,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  mostrarTipoServico(context);
                },
                child: const Text(
                  'Tipo de serviço',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  mostrarCancelamento(context);
                },

                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                child: const Text(
                  'Cancelar agendamento',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  mostrarMaisOpcoes(context);
                },

                child: const Text(
                  'Mais opções',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppStyles.verdePrincipal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}