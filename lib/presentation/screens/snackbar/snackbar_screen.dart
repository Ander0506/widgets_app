import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const String name = 'snackbar_screen';
  
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context){

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'OK!', onPressed: (){}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text('Eu anim excepteur amet deserunt quis est amet enim ea fugiat sint adipisicing tempor reprehenderit. Cupidatat mollit reprehenderit ad consequat minim excepteur dolore dolor sit tempor nostrud est consectetur. Esse ullamco elit non veniam pariatur sint ex minim officia qui tempor aliquip id. Id aliqua nostrud culpa minim voluptate ea aliqua sunt eiusmod reprehenderit consequat labore minim occaecat. Aute qui sunt enim elit cupidatat culpa commodo est fugiat est aliquip consectetur aliqua. Exercitation culpa ullamco laborum duis non amet occaecat ut voluptate eiusmod ex magna.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Aliqua occaecat ipsum ad laboris est et. Nostrud occaecat tempor commodo cillum Lorem commodo anim aliquip tempor reprehenderit. Dolor et ad laborum commodo culpa nulla quis laborum eiusmod cupidatat reprehenderit occaecat Lorem.')
                  ]
                );
              }, 
              child: const Text('Licencias usadas')
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar diálogo')
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Mostrar Snackbars'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}