import 'package:fam_flutter_storyapp/presentation/widget/app_appbar_widget.dart';
import 'package:flutter/material.dart';

class AddStoryPage extends StatefulWidget {
  const AddStoryPage({super.key});

  @override
  State<AddStoryPage> createState() => _AddStoryPageState();
}

class _AddStoryPageState extends State<AddStoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBarWidget(
        title: 'Add New Story',
      ),
      body: Container(),
    );
  }
}
