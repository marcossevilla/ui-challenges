import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final IconData icon;
  final Function onPressed;

  PinterestButton({
    @required this.icon,
    @required this.onPressed,
  });
}

class PinterestMenu extends StatelessWidget {
  final bool show;
  final List<PinterestButton> items;

  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;

  PinterestMenu({
    this.show = true,
    this.items,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.grey,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _MenuState(),
      child: AnimatedOpacity(
        opacity: this.show ? 1 : 0,
        duration: Duration(milliseconds: 500),
        child: Builder(
          builder: (context) {
            Provider.of<_MenuState>(context).activeColor = this.activeColor;
            Provider.of<_MenuState>(context).inactiveColor = this.inactiveColor;

            Provider.of<_MenuState>(context).backgroundColor =
                this.backgroundColor;

            return _PinterestMenuCard(child: _MenuItems(this.items));
          },
        ),
      ),
    );
  }
}

class _PinterestMenuCard extends StatelessWidget {
  _PinterestMenuCard({@required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<_MenuState>(context).backgroundColor;

    return Container(
      child: this.child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(1, 3),
            blurRadius: 10,
            spreadRadius: -5,
          ),
        ],
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> items;

  _MenuItems(this.items);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < items.length; i++)
          _PinterestMenuButton(i, items[i]),
      ],
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  _PinterestMenuButton(
    this.index,
    this.item,
  );

  final int index;
  final PinterestButton item;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<_MenuState>(context);
    bool isSelected = state.selectedItem == index;

    return GestureDetector(
      onTap: () => state.selectedItem = index,
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: isSelected ? 30.0 : 25.0,
          color: isSelected ? state.activeColor : state.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuState with ChangeNotifier {
  int _selectedItem = 0;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.grey;
  Color _backgroundColor = Colors.white;

  int get selectedItem => this._selectedItem;
  set selectedItem(int value) {
    this._selectedItem = value;
    notifyListeners();
  }

  Color get activeColor => this._activeColor;
  set activeColor(Color value) {
    this._activeColor = value;
  }

  Color get inactiveColor => this._inactiveColor;
  set inactiveColor(Color value) {
    this._inactiveColor = value;
  }

  Color get backgroundColor => this._backgroundColor;
  set backgroundColor(Color value) {
    this._backgroundColor = value;
  }
}
