import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductInfor {
  final String name;
  final int price;
  ProductInfor(
    this.name,
    this.price,
  );
}

final products = [
  ProductInfor("Wireless Mouse", 3),
  ProductInfor("Key Board", 5),
  ProductInfor("Camera", 8),
  ProductInfor("Speaker", 4),
  ProductInfor("Ipad", 1000),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentProductIndex = 0;
  int? _inputedPrice;
  String _result = "";

  @override
  Widget build(BuildContext context) {
    late Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(products[_currentProductIndex].name),
              SizedBox(
                width: size.width * 0.3,
                child: TextField(
                  key: const Key('priceInput'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    _inputedPrice = int.tryParse(value);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _result =
                        _inputedPrice == products[_currentProductIndex].price
                            ? "passed"
                            : "failed";
                  });
                },
                child: const Text("Check"),
              ),
              Text(_result),
              _result == "passed"
                  ? ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentProductIndex++;
                          _result = "failed";
                        });
                      },
                      child: const Text("Next"),
                    )
                  : const ElevatedButton(onPressed: null, child: Text("Next")),
            ],
          ),
        ),
      ),
    );
  }
}
