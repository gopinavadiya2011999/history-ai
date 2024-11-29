import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/common_toast.dart';

class CustomDropdown<T> extends StatefulWidget {
  final Widget child;
  final String? text;
  final void Function(T, int)? onChange;
  final GestureTapCallback? onPressed;
  final List<DropdownItem<T>> items;
  final DropdownStyle? dropdownStyle;
  final DropdownButtonStyle? dropdownButtonStyle;
  final Icon? icon;
  final Widget? iconWidget;
  final bool? hideIcon;
  final bool? enableToggle;
  final bool leadingIcon;
  final bool showBorder;
  final String? hintText;
  bool loading;
  final bool emptyValue;
  final bool errorBorder;
  CustomDropdown({
    Key? key,
    this.hideIcon = false,
    required this.child,
    this.text,
    required this.items,
    this.dropdownStyle = const DropdownStyle(),
    this.dropdownButtonStyle = const DropdownButtonStyle(),
    this.icon,
    this.leadingIcon = false,
    this.onChange,
    this.onPressed,
    this.enableToggle,
    this.iconWidget,
    this.hintText,
    this.showBorder = true,
    this.loading = false,
    this.errorBorder = false,
    this.emptyValue = false,
  }) : super(key: key);

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>>
    with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  Timer? timer;

  bool _isOpen = false;
  int _currentIndex = -1;
  AnimationController? _animationController;
  Animation<double>? _expandAnimation;
  Animation<double>? _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _expandAnimation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut,
    );
    _rotateAnimation = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut,
    ));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var style = widget.dropdownButtonStyle;
    // link the overlay to the button
    return CompositedTransformTarget(
      link: this._layerLink,
      child: SizedBox(
        width: style!.width,
        height: style.height,
        child: OutlinedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
              return style.bgColor ?? Colors.transparent;
            }),
            padding:
            WidgetStateProperty.resolveWith<EdgeInsetsGeometry>((states) {
              return style.padding!;
            }),
            shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
              return style.shape!;
            }),
            side: WidgetStateProperty.resolveWith<BorderSide>((states) {
              if (widget.dropdownButtonStyle!.showSelectedBorder) {
                return BorderSide(
                    color: widget.showBorder
                        ? ( ColorConstants.grayD6)
                        : widget.errorBorder
                        ? ColorConstants.red19
                        : Colors.grey);
              } else {
                return BorderSide(
                    color: widget.emptyValue ? ColorConstants.red19 : ColorConstants.grayD6);
              }
            }),
            elevation: WidgetStateProperty.resolveWith<double>((states) {
              return style.elevation!;
            }),
            foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
              return style.primaryColor!;
            }),
          ),
          onPressed: () {
            if (widget.enableToggle != null) {
              if (widget.enableToggle ?? false) {
                if (widget.loading == false) {
                  _toggleDropdown();
                } else {
                  showTopToast(msg: "Please wait",context: context);
                }
              } else {
                widget.onPressed!();
              }
            } else {
              if (widget.loading == false) {
                _toggleDropdown();
              } else {
                showTopToast(msg: "Please wait",context: context);
              }
            }
          },
          child: Row(
            mainAxisAlignment:
            style.mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
            textDirection:
            widget.leadingIcon ? TextDirection.rtl : TextDirection.ltr,
            children: [
              if (_currentIndex == -1) ...[
                Flexible(child: widget.child),
              ] else ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.hintText != null)
                      Text(
                        widget.hintText ?? "",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            color: ColorConstants.black10,
                            fontSize: 12),
                      ),
                    // widget.items![_currentIndex],
                    widget.child,
                  ],
                ),
              ],
              if (!widget.hideIcon! && widget.loading == false)
                RotationTransition(
                  turns: _rotateAnimation!,
                  child: widget.icon ??
                      const Icon(
                        Icons.keyboard_arrow_down,
                        size: 35,
                        // color: _currentIndex == -1 ? Colors.grey : Colors.black,
                        color: Colors.grey,
                      ),
                ),
              if (widget.iconWidget != null) widget.iconWidget!,
              if (widget.loading == true)
                const Padding(
                  padding: EdgeInsets.only(
                      left: 8.0), // Adjust the padding as needed
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0, // Adjust the stroke width as needed
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    var size = renderBox!.size;

    var offset = renderBox.localToGlobal(Offset.zero);
    var topOffset = offset.dy + size.height + 5;
    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () => _toggleDropdown(close: true),
        behavior: HitTestBehavior.translucent,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                left: offset.dx,
                top: topOffset,
                width: widget.dropdownStyle!.width ?? size.width,
                child: CompositedTransformFollower(
                  offset: widget.dropdownStyle!.offset ??
                      Offset(0, size.height + 5),
                  link: this._layerLink,
                  showWhenUnlinked: false,
                  child: Material(
                    elevation: widget.dropdownStyle!.elevation ?? 0,
                    borderRadius:
                    widget.dropdownStyle!.borderRadius ?? BorderRadius.zero,
                    color: ColorConstants.grayD6,
                    child: SizeTransition(
                      axisAlignment: 1,
                      sizeFactor: _expandAnimation!,
                      child: ConstrainedBox(
                        constraints: widget.dropdownStyle!.constraints ??
                            BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height -
                                  topOffset -
                                  15,
                            ),
                        child: widget.loading
                            ? const SizedBox(
                          height: 150,
                          child: Center(
                              child: CircularProgressIndicator(
                                  color: ColorConstants.black)),
                        )
                            : !widget.loading && widget.items.isEmpty
                            ? const SizedBox(
                          height: 100,
                          child: Center(
                              child: Text("No Data Available")),
                        )
                            : ListView(
                          padding: widget.dropdownStyle!.padding ??
                              EdgeInsets.zero,
                          shrinkWrap: true,
                          children: widget.items
                              .asMap()
                              .entries
                              .map((item) {
                            return InkWell(
                              onTap: () {
                                setState(
                                        () => _currentIndex = item.key);
                                widget.onChange!(
                                    item.value.value as T, item.key);
                                _toggleDropdown();
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(8),
                                    color: _currentIndex == item.key
                                        ? widget.dropdownStyle!
                                        .selectedItemColor
                                        : Colors.transparent,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Flexible(child: item.value),
                                      if (widget.dropdownStyle!
                                          .trailingIcon !=
                                          null)
                                        if (_currentIndex == item.key)
                                          Icon(
                                            widget.dropdownStyle!
                                                .trailingIcon,
                                            size: 18,
                                            color: Colors.grey,
                                          ),
                                    ],
                                  )),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleDropdown({bool close = false}) async {
    if (widget.text != null) {
      _currentIndex = widget.text == "" ? (-1) : _currentIndex;
    }
    FocusScope.of(context).unfocus();
    if (widget.items.isNotEmpty) {
      if (mounted) {
        setState(() {});
      }
    }
    if (_isOpen || close) {
      await _animationController!.reverse();
      if (this._overlayEntry != null) {
        this._overlayEntry?.remove();
      }
      if (mounted) {
        setState(() {
          _isOpen = false;
        });
      }
    } else {
      // if(widget.items.isNotEmpty) {
      this._overlayEntry = this._createOverlayEntry();
      Overlay.of(context).insert(this._overlayEntry!);
      if (mounted) {
        setState(() => _isOpen = true);
      }
      Timer(
        const Duration(milliseconds: 1000),
            () {
          this._overlayEntry!.remove();

          this._overlayEntry = this._createOverlayEntry();
          Overlay.of(context).insert(this._overlayEntry!);
          if (mounted) {
            setState(() => _isOpen = true);
          }
        },
      );

      _animationController!.forward();
    }
  }
}

class DropdownItem<T> extends StatelessWidget {
  final T? value;
  final Widget child;

  const DropdownItem({Key? key, this.value, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class DropdownButtonStyle {
  final MainAxisAlignment? mainAxisAlignment;
  final RoundedRectangleBorder? shape;
  final double? elevation;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;
  final double? width;
  final double? height;
  final Color? primaryColor;
  final Color? bgColor;
  final bool showSelectedBorder;

  const DropdownButtonStyle({
    this.showSelectedBorder = false,
    this.mainAxisAlignment,
    this.backgroundColor,
    this.primaryColor,
    this.bgColor,
    this.constraints,
    this.height,
    this.width,
    this.elevation,
    this.padding,
    this.shape,
  });
}

class DropdownStyle {
  final BorderRadius? borderRadius;
  final double? elevation;
  final Color? color;
  final IconData? trailingIcon;
  final Color? selectedItemColor;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;

  final Offset? offset;

  final double? width;

  const DropdownStyle({
    this.trailingIcon,
    this.selectedItemColor,
    this.constraints,
    this.offset,
    this.width,
    this.elevation,
    this.color,
    this.padding,
    this.borderRadius,
  });
}
