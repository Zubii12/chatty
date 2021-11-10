import 'package:chatty/models/index.dart';
import 'package:chatty/shared/components/loading_indicator.dart';
import 'package:chatty/shared/components/search_field.dart';
import 'package:chatty/shared/state/index.dart';
import 'package:chatty/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void showAddNewContactDialog({required BuildContext context, required UserStore userStore}) {
  showDialog<void>(
    context: context,
    useSafeArea: true,
    builder: (BuildContext context) {
      return Dialog(
        child: _AddNewContactDialog(userStore: userStore),
      );
    },
  );
}

class _AddNewContactDialog extends StatelessWidget {
  const _AddNewContactDialog({Key? key, required this.userStore}) : super(key: key);

  final UserStore userStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SearchField(
          onChanged: (String v) => userStore.setAddNewContactsSearchKeyword(v),
        ),
        Observer(builder: (BuildContext context) {
          if (userStore.searchContactsState is Loading && userStore.addNewContactsSearchKeyword.isNotEmpty) {
            return const Expanded(child: Center(child: ChattyLoadingIndicator()));
          }
          if (userStore.searchContactsState is Error) {
            return Expanded(child: Center(child: Text((userStore.searchContactsState as Error<List<User>>).message)));
          }
          List<User> users = <User>[];
          if (userStore.searchContactsState is Fulfilled) {
            users = (userStore.searchContactsState as Fulfilled<List<User>>).data;
          }

          if (users.isEmpty) {
            return const Expanded(child: Center(child: Text('No users found.')));
          }

          return Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                final User user = users[index];

                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Palette.darkModeBlue,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            user.name[0].toUpperCase(),
                          ),
                        ),
                      ),
                      title: Text(user.name),
                      trailing: IconButton(
                        icon: const Icon(Icons.add),
                        color: Palette.weakGrey,
                        onPressed: () {
                          userStore.addNewContact(contactId: user.id);
                          Navigator.of(context).pop();
                        },
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
    );
  }
}
