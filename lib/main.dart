import 'package:farmadex/consts/supabase_key.dart';
import 'package:farmadex/view/calculator/calculator_page.dart';
import 'package:farmadex/view/calculator/widgets/binary_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SupabaseConsts.SUPABASE_URL,
    anonKey: SupabaseConsts.ANON_KEY,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Farmadex',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPageView(
        children: [
          BinaryInput(
            trueLabel: 'Yes',
            falseLabel: 'No',
            label: 'Confusion',
            trueScore: 4,
            falseScore: 0,
          ),
          BinaryInput(
            trueLabel: 'Yes',
            falseLabel: 'No',
            label: 'BUN >19 mg/dL (>7 mmol/L urea)',
            trueScore: 1,
            falseScore: 0,
          ),
          BinaryInput(
            trueLabel: 'Yes',
            falseLabel: 'No',
            label: 'Respiratory Rate ≥30',
            trueScore: 1,
            falseScore: 0,
          ),
          BinaryInput(
            trueLabel: 'Yes',
            falseLabel: 'No',
            label: 'Systolic BP <90 mmHg or Diastolic BP ≤60 mmHg',
            trueScore: 1,
            falseScore: 0,
          ),
          BinaryInput(
            trueLabel: 'Yes',
            falseLabel: 'No',
            label: 'Age ≥65',
            trueScore: 1,
            falseScore: 0,
          ),
        ],
      ),
    );
  }
}
