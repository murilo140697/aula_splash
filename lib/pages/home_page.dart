import 'package:aula_splash/controllers/home_controller.dart';
import 'package:aula_splash/models/post_model.dart';
import 'package:aula_splash/repositories/home_repository_imp.dart';
import 'package:aula_splash/services/prefs_service.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());
  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                PrefsService.logout();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login', (_) => true);
              },
              icon: Icon(Icons.logout))
        ],
        centerTitle: true,
        title: Text('Home Page'),
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _controller.posts,
        builder: (_, list, __) {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (_, idx) => ListTile(
              leading: Text(
                list[idx].id.toString(),
              ),
              trailing: Icon(Icons.arrow_forward),
              title: Text(list[idx].title),
              onTap: () => Navigator.of(context).pushNamed(
                '/details',
                arguments: list[idx],
              ),
            ),
            separatorBuilder: (_, __) => Divider(),
          );
        },
      ),
    );
  }
}
