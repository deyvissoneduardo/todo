import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

import 'todo_list_page.dart';

abstract class TodoListModules {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;

  TodoListModules({
    required Map<String, WidgetBuilder> routers,
    List<SingleChildWidget>? bindings,
  })  : _routers = routers,
        _bindings = bindings;

  Map<String, WidgetBuilder> get routers {
    return _routers.map(
      (key, pageBuilder) => MapEntry(
        key,
        (_) => TodoListPage(
          bindigns: _bindings,
          page: pageBuilder,
        ),
      ),
    );
  }

  Widget getPage(String path, BuildContext context) {
    final widgetBuilder = _routers[path];
    if (widgetBuilder != null) {
      return TodoListPage(
        page: widgetBuilder,
        bindigns: _bindings,
      );
    }
    throw Exception();
  }
}
