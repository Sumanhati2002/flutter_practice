import 'package:flutter/material.dart';
import 'package:flutter_stream/provider/home_provider_logic.dart';
import 'package:provider/provider.dart';

class HomeProvider extends StatefulWidget {
  const HomeProvider({super.key});

  @override
  State<HomeProvider> createState() => _HomeProviderState();
}

class _HomeProviderState extends State<HomeProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: ChangeNotifierProvider<MyHomeProvider>(
            create: (context) => MyHomeProvider(),
            child: Consumer<MyHomeProvider>(
              builder: (context, provider, child) => Column(
                children: [
                  Text(
                    provider.message.toString(),
                    style: TextStyle(
                        color: (provider.eligible == true)
                            ? Colors.green
                            : Colors.red),
                  ),
                  TextField(
                    decoration:
                        const InputDecoration(hintText: "Enter Your Age"),
                    keyboardType: TextInputType.number,
                    onChanged: (value) =>
                        provider.checkEligibility(int.parse(value)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
