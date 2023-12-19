import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/quiz-logo.png',color: const Color.fromARGB(100, 237, 171, 249),width: 300,),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 10,
              ),
               Text(
                'Learn With Fun',
                style: GoogleFonts.orbitron(color: const Color.fromARGB(255, 245, 170, 240),fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 18),
                  foregroundColor: Colors.white,
                ),
                onPressed: startQuiz,
                icon: const Icon(Icons.arrow_right,size: 35,),
                label: const Text('Let\'s Start'),
              ),
            ],
          ),
        );
  }
}
