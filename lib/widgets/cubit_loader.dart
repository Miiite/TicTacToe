import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LoadableCubit<S> extends Cubit<S> {
  LoadableCubit({required S initialState}) : super(initialState);

  Future<void> load();
}

class CubitLoader<T extends LoadableCubit<S>, S> extends StatefulWidget {
  const CubitLoader({super.key, required this.child});

  final Widget child;

  @override
  State<CubitLoader> createState() => _CubitLoaderState<T, S>();
}

class _CubitLoaderState<T extends LoadableCubit<S>, S>
    extends State<CubitLoader> {
  @override
  void initState() {
    super.initState();
    context.read<T>().load();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
