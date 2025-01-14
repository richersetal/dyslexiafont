import 'package:com_richersetal_dyslexiafont/logic/cubit/font_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FontSettingsDialog extends StatefulWidget {
  const FontSettingsDialog({super.key});

  @override
  State<FontSettingsDialog> createState() => _FontSettingsDialogState();
}

class _FontSettingsDialogState extends State<FontSettingsDialog> {
  String? selectedFont; // Geselecteerde waarde

  @override
  Widget build(BuildContext context) {
    // Haal de huidige lettertypekeuze uit de FontCubit
    final currentFont = context.read<FontCubit>().state;

    // uses "default"
    selectedFont = selectedFont ?? (currentFont ?? "default");

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Pick Font',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),

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
            ),

            const SizedBox(height: 16.0),

            // Opslaan-knop
            ElevatedButton(
              onPressed: () {
                // Pas de keuze toe in FontCubit
                context.read<FontCubit>().changeFont(
                      selectedFont == "default" ? null : selectedFont,
                    );
                Navigator.of(context).pop(); // close window
              },
              child: const Text('Use'),
            ),

            // Annuleren-knop
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // close window without savinf
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
