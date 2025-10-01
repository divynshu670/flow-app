import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/app.dart';
import 'src/repository/cart_repository.dart';
import 'src/bloc/cart/cart_bloc.dart';

void main() {
  final cartRepository = CartRepository(); 
  runApp(
    RepositoryProvider.value(
      value: cartRepository,
      child: BlocProvider(
        create: (_) => CartBloc(repository: cartRepository),
        child: const MyApp(),
      ),
    ),
  );
}
