import 'package:flutter/widgets.dart';

extension KeyExtensions on GlobalKey {
  Offset get widgetOffset {
    final renderBox = this.currentContext!.findRenderObject() as RenderBox;
    return renderBox.localToGlobal(Offset.zero);
  }

  Size get widgetSize {
    final renderBox = this.currentContext!.findRenderObject() as RenderBox;
    return renderBox.size;
  }

  Offset get widgetPositionOffset {
    final renderBox = currentContext?.findRenderObject();
    var translation = renderBox?.getTransformTo(null).getTranslation();
    if (renderBox != null && translation != null) {
      return renderBox.paintBounds
          .shift(Offset(translation.x, translation.y + 25))
          .center;
    } else {
      return widgetOffset;
    }
  }

    Rect? get widgetPositionRect {
    final renderBox = currentContext?.findRenderObject();
    var translation = renderBox?.getTransformTo(null).getTranslation();

    return renderBox?.paintBounds
        .shift(Offset(translation?.x ?? 0, translation?.y ?? 0));
  }
}

extension ContextExtensions on BuildContext {
  Size get screenSize {
    return MediaQuery.of(this).size;
  }
}
