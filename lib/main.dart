import 'package:flutter/material.dart';
import 'telas/lista_cuidadores.dart';

void main() {
  runApp(const AmigoPet());
}

class AmigoPet extends StatelessWidget {
  const AmigoPet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AmigoPet',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4CAF50),
        ),
        useMaterial3: true,
      ),

      home: ListaCuidadores(),
    );
  }
}


