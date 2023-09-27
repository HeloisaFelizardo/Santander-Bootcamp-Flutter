import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/card_page.dart';
import 'package:trilhaapp/pages/image_assets.dart';
import 'package:trilhaapp/pages/tarefa_page.dart';
import 'package:trilhaapp/shared/widgets/custom_drawer.dart';

import 'list_view_horizontal.dart';
import 'list_view_v.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Main Page"),
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: const [
                  CardPage(),
                  ImageAssetsPage(),
                  ListViewPage(),
                  ListViewHorizontal(),
                  TarefaPage()
                ],
              ),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: 'Pag1', icon: Icon(Icons.home)),
                  BottomNavigationBarItem(label: 'Pag2', icon: Icon(Icons.add)),
                  BottomNavigationBarItem(
                      label: 'Pag3', icon: Icon(Icons.person)),
                  BottomNavigationBarItem(
                      label: 'Pag4', icon: Icon(Icons.image)),
                  BottomNavigationBarItem(
                      label: 'Tarefas', icon: Icon(Icons.list)),
                ])
          ],
        ),
      ),
    );
  }
}
