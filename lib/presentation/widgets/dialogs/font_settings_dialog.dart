import 'package:com_richersetal_dyslexiafont/logic/cubit/font_cubit.dart';
import 'package:com_richersetal_dyslexiafont/logic/cubit/opacity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FontSettingsDialog extends StatefulWidget {
  const FontSettingsDialog({super.key});

  @override
  State<FontSettingsDialog> createState() => _FontSettingsDialogState();
}

class _FontSettingsDialogState extends State<FontSettingsDialog> {
  String? selectedFont; // selected value for font
  late int selectedOpacity; // selected value for opacity

  @override
  void initState() {
    super.initState();
    // get current opacity-value from OpacityCubit and set
    selectedOpacity = context.read<OpacityCubit>().state;
  }

  @override
  Widget build(BuildContext context) {
    // get current font from FontCubit
    final currentFont = context.read<FontCubit>().state;

    // Set initial values
    selectedFont = selectedFont ?? (currentFont ?? "default");

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Change Font Settings',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),

            // Text above Dropdown
            const Text(
              'Pick Font',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),

            // DropdownMenu
            DropdownButton<String>(
              value: selectedFont,
              items: [
                const DropdownMenuItem(
                  value: "default", // Special value for default font
                  child: Text('Default'),
                ),
                const DropdownMenuItem(
                  value: 'Lexend',
                  child: Text('Lexend'),
                ),
                const DropdownMenuItem(
                  value: 'OpenDyslexic',
                  child: Text('OpenDyslexic'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedFont = value;
                });
              },
              isExpanded: true,
              borderRadius: BorderRadius.circular(12),
            ),

            const SizedBox(height: 16.0),

            // text above Slider
            const Text(
              'Adjust Opacity',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),

            // Slider for opacity
            Slider(
              value: selectedOpacity.toDouble(),
              min: 0, // Min transparant
              max: 100, // Max visible
              divisions: 100, // Staps of 1
              label: '$selectedOpacity%', // Label with percentage
              onChanged: (value) {
                setState(() {
                  selectedOpacity = value.toInt();
                });
              },
            ),

            const SizedBox(height: 16.0),

            // save
            ElevatedButton(
              onPressed: () {
                // use choice in FontCubit and OpacityCubit
                context.read<FontCubit>().changeFont(
                      selectedFont == "default" ? null : selectedFont,
                    );
                context.read<OpacityCubit>().changeOpacity(selectedOpacity);
                Navigator.of(context).pop(); // close dialog window
              },
              child: const Text('Set'),
            ),

            // Annuleren-knop
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // close dialog window without changes
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
