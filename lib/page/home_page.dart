// ignore_for_file: prefer_const_constructors

import 'package:app1/page/pageView/page_One.dart';
import 'package:app1/page/pageView/page_Two.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pc;
  int paginaAtual = 0;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setIndexBar(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Aplicativo'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                color: Colors.indigo,
                height: 56,
                child: Icon(Icons.menu, color: Colors.grey[50],),
                alignment: AlignmentDirectional.centerStart,
                padding: EdgeInsets.only(left: 15),
              ),
              ListTile(
                  title: Text('Home'),
                  trailing: Icon(Icons.search),
                  onTap: () {
                    paginaAtual = 0;
                    pc.jumpToPage(0);
                  }),
              Divider(height: 1,thickness: 1),
              ListTile(
                  title: Text('Número'),
                  trailing: Icon(Icons.numbers),
                  onTap: () {
                    paginaAtual = 1;
                    pc.jumpToPage(1);
                  }),Divider(height: 1,thickness: 1,)
            ],
          ),
        ),
        body: PageView(
          controller: pc,
          onPageChanged: setIndexBar,
          children: const [
            pageOne(),
            pageTwo(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: paginaAtual,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.numbers),
              label: 'Número',
            ),
          ],
          onTap: (pagina) {
            pc.animateToPage(
              pagina,
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
        )
        );
  }
}
