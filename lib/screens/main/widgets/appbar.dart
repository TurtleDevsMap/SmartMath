import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../../view.dart';
import '../main_viewmodel.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  Appbar({state}) : _state = state;
  final _state;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  void _onLogin(BuildContext context, MainViewmodel viewmodel) async {
    final User _user = await viewmodel.authenticate();

    // if (_user != null) Navigator.pop(context, _user);
    if (_user != null) Navigator.pushNamed(context, '/register');
  }

  void _onCancel(BuildContext context, MainViewmodel viewmodel) {
    viewmodel.showErrorMessage = false;
    Navigator.pop(context, null);
  }

  @override
  Widget build(BuildContext context) {
    //return AppBar();
    return AppBar(
      leading: CircleAvatar(
          backgroundImage: AssetImage('assets/image/editprofile.png')),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_state.loguser.name),
          Text('${_state.loguser.login} (${_state.loguser.role})', style: TextStyle(fontSize: 12.0)),
        ],
      ),
      actions: [
        IconButton(icon: Icon(Icons.login), onPressed: () {
          _state.loguser = null;
          Navigator.pop(context);
        })
      ],
    );
  }
}

// child: View(
//   viewmodel: MainViewmodel(),
//   builder: (context, viewmodel, _) => SingleChildScrollView(
//     child: Column(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [],
//     ),
//   ),
// ),
