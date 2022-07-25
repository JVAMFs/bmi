import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData(

      ),
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // the controller for the text field associated with "height"
  final _heightController = TextEditingController();

  // the controller for the text field associated with "weight"
  final _weightController = TextEditingController();

  double? _bmi;
  // the message at the beginning
  String _message = 'Please enter your height an weight';

  // This function is triggered when the user pressess the "Calculate" button
  void _calculate() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

    // Check if the inputs are valid
    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        _message = "Your height and weigh must be positive numbers";
      });
      return;
    }

    setState(() {
      _bmi = weight / (height * height);
      if (_bmi! < 18.5) {
        _message = "Anda kekurangan berat badan";
      } else if (_bmi! < 25) {
        _message = 'Tubuhmu baik-baik saja';
      } else if (_bmi! < 30) {
        _message = 'Anda kelebihan berat badan';
      } else {
        _message = 'anda gemuk';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: SizedBox(
            width: 320,
            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                      decoration:
                      const InputDecoration(labelText: 'Height (m)'),
                      controller: _heightController,
                    ),
                    TextField(
                      keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        labelText: 'Weight (kg)',
                      ),
                      controller: _weightController,
                    ),
                    ElevatedButton(
                      onPressed: _calculate,
                      child: const Text('Calculate'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      _bmi == null ? '' : _bmi!.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 50),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      _message,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   //
//   final _heightcontroller = TextEditingController();
//   final _weightcontroller = TextEditingController();
//   double? _bmi;
//
//   String _message = 'Please enter your Height an Weight';
//
//   void _calculate() {
//     final double? height = double.tryParse(_heightcontroller.value.text);
//     final double? weight = double.tryParse(_weightcontroller.value.text);
//
//     if (height == null || height <= 0 || weight == null || weight <= 0) {
//       setState(() {
//         _message = "Your height and weight must be positive numbers";
//       });
//       return;
//     }
//
//     setState(
//       () {
//         _bmi = weight / (height * weight);
//         if (_bmi! < 18.5) {
//           _message = "You are underweight";
//         } else if (_bmi! < 25) {
//           _message = 'You body is fine';
//         } else if (_bmi! < 30) {
//           _message = 'You are overweight';
//         } else {
//           _message = 'You are obese';
//         }
//       },
//     );
//   }
//
//   //
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueAccent,
//       body: Center(
//         child: SizedBox(
//           width: 320,
//           child: Card(
//             color: Colors.white70,
//             elevation: 10,
//             child: Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   const TextField(
//                     keyboardType:
//                         TextInputType.numberWithOptions(decimal: true),
//                     decoration: InputDecoration(labelText: 'Height (m)'),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   TextField(
//                     keyboardType:
//                         const TextInputType.numberWithOptions(decimal: true),
//                     decoration: const InputDecoration(
//                       labelText: 'Weight (kg)',
//                     ),
//                     controller: _weightcontroller,
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   ElevatedButton(
//                     onPressed: _calculate,
//                     child: const Text('Calculate'),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Text(
//                     _bmi == null ? 'No Result' : _bmi!.toStringAsFixed(2),
//                     style: TextStyle(fontSize: 50),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
