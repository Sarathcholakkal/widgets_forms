import 'package:flutter/material.dart';

class ListviewSample extends StatefulWidget {
  const ListviewSample({super.key});

  @override
  State<ListviewSample> createState() => _ListviewSampleState();
}

class _ListviewSampleState extends State<ListviewSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: Text('Flutter'),
              subtitle: Text('Learn to build apps'),
              leading: Icon(Icons.code),
            ),
            ListTile(
              title: Text('MERN Stack'),
              subtitle: Text('Master full-stack development'),
              leading: Icon(Icons.computer),
            ),
            ListTile(
              title: Text('Machine Learning'),
              subtitle: Text('Explore AI and ML concepts'),
              leading: Icon(Icons.auto_awesome),
            ),
            ListTile(
              title: Text('Data Science'),
              subtitle: Text('Analyze and visualize data'),
              leading: Icon(Icons.analytics),
            ),
            ListTile(
              title: Text('Game Development'),
              subtitle: Text('Create immersive games'),
              leading: Icon(Icons.games),
            ),
          ],
        ),
      ),
    );
  }
}
