import 'package:flutter/cupertino.dart';
import '../model/item_navigation';
import '../routes/app_routes.dart';

class BottomNavigation extends StatelessWidget {
  final List<OptionNavigations> items;
  const BottomNavigation({Key? key, required this.items}) : super(key: key);

  List<ButtonNavigation> _getOptions(List<OptionNavigations> items) =>
      AppRoute.listSreens
          .map((option) => ButtonNavigation(option: option))
          .toList();

  @override
  Widget build(Object context) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.all(5),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: _getOptions(items)),
    ));
  }
}

class ButtonNavigation extends StatelessWidget {
  final OptionNavigations option;
  const ButtonNavigation({Key? key, required this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: CupertinoButton(
        pressedOpacity: 1.0,
        onPressed: () => Navigator.pushReplacementNamed(context, option.route),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                option.icon,
                color: const Color(0xFF644394),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                option.title,
                style: const TextStyle(color: Color(0xFF644394), fontSize: 12),
              )
            ]),
      ),
    );
  }
}
