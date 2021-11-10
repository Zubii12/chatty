import 'package:chatty/models/index.dart';
import 'package:chatty/screens/contacts_page/widgets/add_new_contact_dialog.dart';
import 'package:chatty/shared/components/loading_indicator.dart';
import 'package:chatty/shared/components/search_field.dart';
import 'package:chatty/shared/providers/providers.dart';
import 'package:chatty/shared/state/index.dart';
import 'package:chatty/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContactsPage extends HookWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserStore userStore = useProvider(userStorePOD);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Contacts',
          style: TextStyle(fontSize: 18.0),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => showAddNewContactDialog(context: context, userStore: userStore),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: SearchField(
                onChanged: (String v) => userStore.setContactsSearchKeyword(v),
              ),
            ),
            Observer(builder: (BuildContext context) {
              if (userStore.contactsState is Loading) {
                return const Expanded(child: Center(child: ChattyLoadingIndicator()));
              }
              if (userStore.contactsState is Error) {
                return Expanded(child: Center(child: Text((userStore.contactsState as Error<List<User>>).message)));
              }
              final List<User> contacts = (userStore.contactsState as Fulfilled<List<User>>).data;

              if (contacts.isEmpty) {
                return const Expanded(child: Center(child: Text('No contacts found.')));
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final User contact = contacts[index];
                    // todo make this real time
                    final Duration duration = contact.lastSeen.difference(DateTime.now());
                    String lastSeenState = '';

                    bool isOnline = false;
                    if (duration.inMinutes > -5) {
                      isOnline = true;
                      lastSeenState = 'Online';
                    } else if (duration.inMinutes <= -5 && duration.inMinutes > -60) {
                      lastSeenState = 'Last seen ${duration.inMinutes.abs()} minutes ago';
                    } else if (duration.inHours <= -1 && duration.inHours > -24) {
                      lastSeenState = 'Last seen ${duration.inHours.abs()} hours ago';
                    } else if (duration.inDays <= -1 && duration.inDays > -30) {
                      if (duration.inDays == -1) {
                        lastSeenState = 'Last seen yesterday';
                      } else {
                        lastSeenState = 'Last seen ${duration.inDays.abs()} days ago';
                      }
                    }

                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              const SizedBox(height: 50, width: 50),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Palette.darkModeBlue,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Center(
                                  child: Text(
                                    contact.name[0].toUpperCase(),
                                  ),
                                ),
                              ),
                              if (isOnline)
                                Positioned(
                                  left: 40,
                                  bottom: 38,
                                  child: Container(
                                    height: 10.0,
                                    width: 10.0,
                                    alignment: Alignment.topRight,
                                    decoration: BoxDecoration(
                                      color: Palette.succesGreen,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          title: Text(
                            contact.name,
                          ),
                          subtitle: Text(
                            lastSeenState,
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Palette.disabledGrey,
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 2.0,
                          indent: 8.0,
                          endIndent: 8.0,
                          color: Palette.darkBlack,
                        )
                      ],
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
