import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FormBuilder Example'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: FormBuilder(
            key: _fbKey,
            child: Column(
              children: <Widget>[
                FormBuilderDateTimePicker(
                  name: 'date',
                  inputType: InputType.date,
                  format: DateFormat('yyyy-MM-dd'),
                  decoration: InputDecoration(labelText: 'Date Field'),
                ),
                FormBuilderTextField(
                  name: 'text_field',
                  decoration: InputDecoration(labelText: 'Text Field'),
                ),
                FormBuilderDateTimePicker(
                  name: 'calendar_field',
                  inputType: InputType.date,
                  decoration: InputDecoration(labelText: 'Calendar Field'),
                ),
                FormBuilderDateTimePicker(
                  name: 'time_field',
                  inputType: InputType.time,
                  decoration: InputDecoration(labelText: 'Time Field'),
                ),
                FormBuilderDropdown(
                  name: 'select_field',
                  decoration: InputDecoration(labelText: 'Select Field'),
                  items: ['Option 1', 'Option 2', 'Option 3']
                      .map((option) => DropdownMenuItem(
                            value: option,
                            child: Text('$option'),
                          ))
                      .toList(),
                ),
                FormBuilderRadioGroup(
                  name: 'radio_field',
                  decoration: InputDecoration(labelText: 'Radio Field'),
                  options: ['Option 1', 'Option 2', 'Option 3']
                      .map((option) => FormBuilderFieldOption(value: option))
                      .toList(),
                ),
                FormBuilderTextField(
                  name: 'text_field',
                  decoration: InputDecoration(labelText: 'Text Field'),
                ),
                FormBuilderSwitch(
                  name: 'switch_field',
                  title: Text('Switch Field'),
                  initialValue: false,
                ),
                FormBuilderCheckbox(
                  name: 'checkbox_field',
                  title: Text('Checkbox Field'),
                  initialValue: false,
                ),
                FormBuilderDateRangePicker(
                  name: 'date_range_picker_field',
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2030),
                  format: DateFormat('yyyy-MM-dd'),
                  decoration:
                      InputDecoration(labelText: 'Date Range Picker Field'),
                ),
                FormBuilderSlider(
                  name: 'slider_field',
                  min: 0.0,
                  max: 100.0,
                  initialValue: 50.0,
                  decoration: InputDecoration(labelText: 'Slider Field'),
                ),
                FormBuilderRangeSlider(
                  name: 'range_slider_field',
                  min: 0.0,
                  max: 100.0,
                  initialValue: RangeValues(30, 70),
                  decoration: InputDecoration(labelText: 'Range Slider Field'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
