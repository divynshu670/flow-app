import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/cart/cart_event.dart';
import '../confirmation/confirmation_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _cardNameController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardNameController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  String _generateOrderId() {
    final r = Random().nextInt(9999).toString().padLeft(4, '0');
    final ts = DateTime.now().millisecondsSinceEpoch.toString().substring(7);
    return 'ORD$r$ts';
  }

  Future<void> _handlePay() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 2)); // simulate
    final orderId = _generateOrderId();

    // clear cart
    context.read<CartBloc>().add(const CartClear());

    if (!mounted) return;
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => ConfirmationPage(orderId: orderId)));
  }

  String? _validateCardNumber(String? value) {
    if (value == null) return 'Enter card number';
    final digitsOnly = value.replaceAll(RegExp(r'\s+|-'), '');
    if (digitsOnly.length < 13 || digitsOnly.length > 19) return 'Enter a valid card number';
    return null;
  }

  String? _validateExpiry(String? value) {
    if (value == null || value.isEmpty) return 'Enter expiry (MM/YY)';
    final m = RegExp(r'^(0[1-9]|1[0-2])\/?([0-9]{2})$');
    if (!m.hasMatch(value)) return 'Invalid expiry';
    return null;
  }

  String? _validateCvv(String? value) {
    if (value == null) return 'Enter CVV';
    if (!RegExp(r'^[0-9]{3,4}$').hasMatch(value)) return 'Invalid CVV';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final total = context.read<CartBloc>().state.totalPrice;
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Text('Pay with Card', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Amount: ₹${total.toStringAsFixed(0)}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            Expanded(child: SingleChildScrollView(child: Form(key: _formKey, child: Column(children: [
              TextFormField(controller: _cardNumberController, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly], decoration: const InputDecoration(labelText: 'Card number', hintText: '4242 4242 4242 4242', border: OutlineInputBorder()), validator: _validateCardNumber),
              const SizedBox(height: 12),
              TextFormField(controller: _cardNameController, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'Cardholder name', border: OutlineInputBorder()), validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter name' : null),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(flex: 2, child: TextFormField(controller: _expiryController, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9/]'))], decoration: const InputDecoration(labelText: 'Expiry (MM/YY)', hintText: '08/25', border: OutlineInputBorder()), validator: _validateExpiry)),
                const SizedBox(width: 12),
                Expanded(flex: 1, child: TextFormField(controller: _cvvController, keyboardType: TextInputType.number, obscureText: true, inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(4)], decoration: const InputDecoration(labelText: 'CVV', hintText: '123', border: OutlineInputBorder()), validator: _validateCvv)),
              ]),
              const SizedBox(height: 18),
              Container(width: double.infinity, padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)), child: const Text('Payments are accepted by card only on this page.')),
            ])))),
            const SizedBox(height: 12),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _loading ? null : _handlePay, child: _loading ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : const Padding(padding: EdgeInsets.symmetric(vertical: 14.0), child: Text('Pay Now')))),
          ]),
        ),
      ),
    );
  }
}
