import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(App());
}
class NameBloc extends Cubit<int> {
  NameBloc() : super(0);
  void decrement() => emit(state - 1);
  void increment(List<String> list) {
    if (state < list.length - 1) {
      emit(state + 1);
    } else {
      emit(state);
    }
  }
}
class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}
class _AppState extends State<App> {
  final NameBloc _nameBloc = NameBloc();
  List<String> ls = [
    'Jasur', 'Akbarali', 'Aziza', 'Gulrux', 'Fotima', 'Muhammadrasul',
    'Muhammadamin', 'Feruzbek', 'Muhammadziyo', 'Sardor', 'Javongir',
    'Mehrojiddin', 'Dovudxon', 'Mahmudxon', 'Muhammadsaid', 'Hojiakbar',
    'Ozod', 'Sohibjon', 'Javohir'
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => _nameBloc,
        child: Builder(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Names"),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Biz tanlagan ism:",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  BlocBuilder<NameBloc, int>(
                    builder: (context, state) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () => context.read<NameBloc>().decrement(),
                          color: Colors.lightBlue,
                          child: Text(
                            "<",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        SizedBox(width: 30),
                        Text(
                          ls[state],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 30),
                        MaterialButton(
                          onPressed: () =>  _onNextButtonPressed(context),


                          color: Colors.redAccent,
                          child: Text(
                            ">",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onNextButtonPressed(BuildContext context) {
    if (_nameBloc.state < ls.length - 1) {
      _nameBloc.increment(ls);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Listda boshqa ism qolmadi"),
        ),
      );
    }
  }


}



