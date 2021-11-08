import 'package:chatty/models/index.dart';
import 'package:chatty/screens/chats_page/chats_page.dart';
import 'package:chatty/screens/contacts_page/contacts_page.dart';
import 'package:chatty/screens/more_page/more_page.dart';
import 'package:chatty/shared/providers/providers.dart';
import 'package:chatty/shared/router/router_store.dart';
import 'package:chatty/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key, required this.currentTab}) : super(key: key);

  final HomePageTab currentTab;

  @override
  Widget build(BuildContext context) {
    final RouterStore routerStore = useProvider(routerStorePOD);

    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: IndexedStack(
                index: currentTab.index,
                children: const <Widget>[
                  ContactsPage(),
                  ChatsPage(),
                  MorePage(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab.index,
        onTap: (int index) {
          switch (index) {
            case 0:
              routerStore.changeHomePageTab(tab: HomePageTab.contacts);
              break;
            case 1:
              routerStore.changeHomePageTab(tab: HomePageTab.chats);
              break;
            case 2:
              routerStore.changeHomePageTab(tab: HomePageTab.more);
              break;
            default:
          }
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.people_outlined,
              color: Palette.offWhite,
            ),
            activeIcon: Container(
              height: 6.0,
              width: 6.0,
              margin: const EdgeInsets.only(bottom: 4.0),
              decoration: const BoxDecoration(
                color: Palette.offWhite,
                shape: BoxShape.circle,
              ),
            ),
            label: currentTab.index == 0 ? 'Contacts' : '',
            tooltip: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.send_rounded,
              color: Palette.offWhite,
            ),
            activeIcon: Container(
              height: 6.0,
              width: 6.0,
              margin: const EdgeInsets.only(bottom: 4.0),
              decoration: const BoxDecoration(
                color: Palette.offWhite,
                shape: BoxShape.circle,
              ),
            ),
            label: currentTab.index == 1 ? 'Chats' : '',
            tooltip: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.more_horiz,
              color: Palette.offWhite,
            ),
            activeIcon: Container(
              height: 6.0,
              width: 6.0,
              margin: const EdgeInsets.only(bottom: 4.0),
              decoration: const BoxDecoration(
                color: Palette.offWhite,
                shape: BoxShape.circle,
              ),
            ),
            label: currentTab.index == 2 ? 'More' : '',
            tooltip: 'More',
          )
        ],
      ),
    );
  }
}
