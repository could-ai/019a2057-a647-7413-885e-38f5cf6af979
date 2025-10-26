import 'package:flutter/material.dart';

class NewDemandScreen extends StatefulWidget {
  const NewDemandScreen({super.key});

  @override
  State<NewDemandScreen> createState() => _NewDemandScreenState();
}

class _NewDemandScreenState extends State<NewDemandScreen> {
  String? _selectedCrop;
  String? _selectedInputType;
  String? _selectedBrand;
  final _quantityController = TextEditingController();

  final List<String> _crops = ['Paddy', 'Wheat', 'Maize', 'Cotton', 'Sugarcane'];
  final List<String> _inputTypes = ['Fertilizer', 'Seed', 'Pesticide'];
  final List<String> _brands = ['Brand A', 'Brand B', 'Brand C', 'Brand D'];

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  void _submitDemand() {
    if (_selectedCrop != null &&
        _selectedInputType != null &&
        _selectedBrand != null &&
        _quantityController.text.isNotEmpty) {
      // Logic to submit demand
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Demand submitted successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      // Clear form
      setState(() {
        _selectedCrop = null;
        _selectedInputType = null;
        _selectedBrand = null;
        _quantityController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all the fields.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Demand'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedCrop,
                decoration: const InputDecoration(
                  labelText: 'Select Crop',
                  border: OutlineInputBorder(),
                ),
                items: _crops.map((String crop) {
                  return DropdownMenuItem<String>(
                    value: crop,
                    child: Text(crop),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedCrop = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedInputType,
                decoration: const InputDecoration(
                  labelText: 'Select Input Type',
                  border: OutlineInputBorder(),
                ),
                items: _inputTypes.map((String input) {
                  return DropdownMenuItem<String>(
                    value: input,
                    child: Text(input),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedInputType = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedBrand,
                decoration: const InputDecoration(
                  labelText: 'Select Brand',
                  border: OutlineInputBorder(),
                ),
                items: _brands.map((String brand) {
                  return DropdownMenuItem<String>(
                    value: brand,
                    child: Text(brand),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedBrand = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _quantityController,
                decoration: const InputDecoration(
                  labelText: 'Enter Quantity (in Kg/Ltr)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submitDemand,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                child: const Text('Submit Demand'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
