import 'package:flutter/material.dart';
import '../../store/app_store.dart';
import 'package:provider/provider.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({Key key}) : super(key: key);

  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => AppStore(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('书影音'),
        ),
        body: _SubjectBodyState(),
        floatingActionButton: Consumer<AppStore>(
          builder: (context, appStoreVM, child) {
            return FloatingActionButton(
              child: child,
              onPressed: () {
                appStoreVM.isLogin = !appStoreVM.isLogin;
              },
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class _SubjectBodyState extends StatefulWidget {
  const _SubjectBodyState({Key key}) : super(key: key);

  @override
  _SubjectBodyStateState createState() => _SubjectBodyStateState();
}

class _SubjectBodyStateState extends State<_SubjectBodyState> {
  @override
  Widget build(BuildContext context) {
    bool _isLogin = Provider.of<AppStore>(context).isLogin;
    return Container(
      child: Text('当前登陆状态：$_isLogin'),
    );
  }
}

