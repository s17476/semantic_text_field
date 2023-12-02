import 'dart:io';

import 'package:flutter/material.dart';

class SemanticTextField extends StatefulWidget {
  const SemanticTextField({
    Key? key,
    this.decoration,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  final InputDecoration? decoration;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  State<SemanticTextField> createState() => _SemanticTextFieldState();
}

class _SemanticTextFieldState extends State<SemanticTextField> {
  late final TextEditingController _textEditingController;
  final FocusNode _focusNode = FocusNode();
  bool _isKeyboardVisible = false;

  String? _getSemanticLabel() {
    if (Platform.isAndroid) {
      return null;
    }

    // Add translations here

    // Textfield
    final textFieldLabel = 'Pole tekstowe';
    // Edition
    final editingLabel = 'Edycja';
    // Double tap to edit
    final doubleTapLabel = 'Stuknij dwukrotnie aby edytować';

    var label = _textEditingController.text.isEmpty
        ? widget.decoration?.hintText ?? ''
        : '';
    label += ';$textFieldLabel';
    label += ';${_isKeyboardVisible ? editingLabel : doubleTapLabel}';

    return label;
  }

  @override
  void initState() {
    _textEditingController = widget.controller ?? TextEditingController();
    _focusNode.addListener(() {
      setState(() {
        _isKeyboardVisible = _focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _textEditingController.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      value: Platform.isIOS ? _textEditingController.text : null,
      label: _getSemanticLabel(),
      child: ExcludeSemantics(
        excluding: Platform.isIOS,
        child: TextField(
          controller: _textEditingController,
          focusNode: _focusNode,
          decoration: widget.decoration ?? const InputDecoration(),
          onChanged: (value) {
            setState(() {});
            widget.onChanged?.call(value);
          },
        ),
      ),
    );
  }
}
