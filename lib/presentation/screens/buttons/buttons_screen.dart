import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {

  static const String name = 'buttons_screen';
  
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {

  const _ButtonsView();
  
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            const ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
            ElevatedButton.icon(
              icon: const Icon(Icons.access_alarm_rounded),
              onPressed: () {},
              label: const Text('Elevated Icon')
            ),

            FilledButton(onPressed: (){}, child: const Text('Filled')),
            FilledButton.icon(
              icon: const Icon(Icons.all_inclusive_rounded),
              onPressed: (){}, 
              label: const Text('Filled Icon'),
            ),

            OutlinedButton(onPressed: (){}, child: const Text('Outline')),
            OutlinedButton.icon(
              icon: const Icon(Icons.baby_changing_station),
              onPressed: (){}, 
              label: const Text('Outline Icon'),
            ),

            TextButton(onPressed: (){}, child: const Text('Text')),
            TextButton.icon(
              icon: const Icon(Icons.cabin_rounded),
              onPressed: (){}, 
              label: const Text('Text Icon'),
            ),

            IconButton(onPressed: (){}, icon: const Icon(Icons.dark_mode)),
            IconButton(
              onPressed: (){},
              color: Colors.white,
              icon: const Icon(Icons.dark_mode),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary)
              ),
            ),

            const CustomButton()
    
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Custom', style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}