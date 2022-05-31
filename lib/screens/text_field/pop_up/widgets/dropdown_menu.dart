import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// RU: Виджет [DropDownMenu] - это выпадающее меню для TextField виджетов.
/// ENG: The [DropDownMenu] widget is a drop-down menu for TextField widgets.
///
class DropDownMenu extends StatefulWidget {
  /// RU: Аргумент [textField] - виджет, под которым будет показываться меню.
  /// ENG: The [textField] argument is the widget under which the menu will be shown.
  ///
  final Widget textField;

  /// RU: Аргумент [boxWidgets] - виджет, который будет отображаться в меню.
  /// ENG: The [boxWidgets] argument is the widget to display in the menu.
  ///
  final Widget boxWidgets;

  /// RU: Аргумент [boxHeight] высота виджета по умолчанию.
  /// ENG: The [boxHeight] argument is the default height of the widget.
  ///
  final double? boxHeight;

  /// RU: Аргумент [key] является обязательным параметром. Используется для управления состоянием меню.
  /// Пример:
  /// инициализация - final _dropDownKey = GlobalKey<UniDropDownMenuState>();
  /// изменение состояния - void closeDropDownBox() {
  ///                           _dropDownKey.currentState?.closeDropDown(); - закрывает меню
  ///                       }
  /// ENG: The [key] argument is a required parameter. Used to control the state of the menu.
  ///
  const DropDownMenu({
    required Key key,
    required this.textField,
    required this.boxWidgets,
    this.boxHeight,
  }) : super(key: key);

  @override
  State<DropDownMenu> createState() => DropDownMenuState();
}

class DropDownMenuState extends State<DropDownMenu> {
  OverlayEntry? _overlayEntry;
  final _layerLink = LayerLink();
  final _formKey = GlobalKey(debugLabel: 'UniDropDownMenu');
  double _boxHeight = 0;
  final double _defaultBoxHeight = 300;
  late Widget _boxWidget;
  bool _isShownMenu = false;
  bool _isThereEnoughSpaseBellow = true;

  /// RU: Метод [updateHeight] используется для изменения высоты виджета;
  /// ENG: The [updateHeight] method is used to change the height of the widget;
  ///
  void updateHeight(double height) {
    if (_isShownMenu) {
      _boxHeight = height;
      _overlayEntry?.markNeedsBuild();
    }
  }

  /// RU: Метод [updateBoxWidget] используется для обновления виджета в меню;
  /// ENG: The [updateBoxWidget] method is used to update the widget in the menu;
  ///
  void updateBoxWidget(Widget boxWidget) {
    if (_isShownMenu) {
      _boxWidget = boxWidget;
      _overlayEntry?.markNeedsBuild();
    }
  }

  /// RU: Метод [showMenu] используется отображения меню;
  /// ENG: The [showMenu] method is used to display menus;
  ///
  Future<void> showMenu() async {
    _isShownMenu = true;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _overlayEntry = _createOverlayEntry();
      if (_overlayEntry != null) {
        Overlay.of(context)!.insert(_overlayEntry!);
      }
      await Future<void>.delayed(const Duration(milliseconds: 10));
      _boxHeight = widget.boxHeight ?? _defaultBoxHeight;
      _overlayEntry?.markNeedsBuild();
    });
  }

  /// RU: Метод [closeMenu] используется для закрытия меню;
  /// ENG: The [closeMenu] method is used to close the menu;
  ///
  void closeMenu() async {
    if (!_isShownMenu) return;
    _boxHeight = 0;
    _overlayEntry?.markNeedsBuild();
    _overlayEntry?.remove();
    _isShownMenu = false;
  }

  @override
  void initState() {
    _boxWidget = widget.boxWidgets;
    super.initState();
  }

  bool _checkSpaceBellow(RenderBox? renderBox) {
    double boxHeight = (widget.boxHeight ?? _defaultBoxHeight) + 5;
    Size screenSize = MediaQuery.of(context).size;
    Size overlaySize = renderBox?.size ?? Size.zero;
    final _positionRB = _positionWidget(renderBox) ?? Offset.zero;

    return (screenSize.height -
            _positionRB.dy -
            boxHeight -
            overlaySize.height) >
        0;
  }

  Offset? _positionWidget(RenderBox? renderBox) =>
      renderBox?.localToGlobal(Offset.zero);

  OverlayEntry _createOverlayEntry() {
    RenderBox? renderBox =
        _formKey.currentContext!.findRenderObject() as RenderBox?;
    Size overlaySize = renderBox?.size ?? Size.zero;
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    _isThereEnoughSpaseBellow = _checkSpaceBellow(renderBox);

    final animationDirection = _isThereEnoughSpaseBellow
        ? AnimationDirection.fromUpToDown
        : AnimationDirection.fromDownToUp;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: overlaySize.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: _isThereEnoughSpaseBellow
              ? Offset(0.0, overlaySize.height + 5)
              : const Offset(0.0, -5),
          child: animationDirection == AnimationDirection.fromUpToDown
              ? _buildBox(screenWidth)
              : FractionalTranslation(
                  translation:
                      const Offset(0.0, -1.0), // visually flips list to go up
                  child: _buildBox(screenWidth),
                ),
        ),
      ),
    );
  }

  Widget _buildBox(double screenWidth) {
    return Material(
      color: Colors.transparent,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: _boxHeight,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        constraints: BoxConstraints(
          minWidth: screenWidth,
          maxWidth: screenWidth,
        ),
        child: _boxWidget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      key: _formKey,
      child: VisibilityDetector(
        key: const Key('unique key'),
        onVisibilityChanged: (VisibilityInfo info) {
          if (info.visibleFraction < 0.2) {
            closeMenu();
          }
        },
        child: widget.textField,
      ),
    );
  }
}

enum AnimationDirection { fromUpToDown, fromDownToUp }
