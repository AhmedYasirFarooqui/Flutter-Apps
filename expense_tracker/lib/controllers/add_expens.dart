// ignore_for_file: non_constant_identifier_names, invalid_use_of_protected_member, unused_element, unused_local_variable

import 'dart:developer';

import 'package:expense_tracker/modal.dart';
import 'package:flutter/material.dart';

class AddExpenseController with ChangeNotifier {
  String _title = '';
  String _description = '';
  int _amount = 0;
  String _selectedDate = 'Date';
  String _selectedTime = 'Time';
  String _dropdownValue = 'Expenses';
  int? totalIncome = 0;
  int? totalExpenses = 0;
  List<AmountInformation>? data = [];
  List? income = [];
  List? expenses = [];

  List<String> options = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
    'Delete',
  ];

  // for title
  String get title => _title;

  set getTitle(value) {
    _title = value;
  }

  handleTitle({required String title}) {
    getTitle = title;
  }

  // for description
  String get description => _description;

  set Getdescription(value) {
    _description = value;
  }

  handleDescription({required String description}) {
    Getdescription = description;
  }

  // for amount

  int get amount => _amount;

  set Getamount(value) {
    _amount = value;
  }

  handleAmount({required int amount}) {
    Getamount = amount;
  }

  /// for date and time

  String get selectedDate => _selectedDate;

  set selectedDate(value) {
    _selectedDate = value;
  }

  handleSelected({required date}) {
    selectedDate = date;
    notifyListeners();
  }

  String get selectedTime => _selectedTime;

  set selectedTime(value) {
    _selectedTime = value;
  }

  handleSelectedTime({required time}) {
    selectedTime = time;
    notifyListeners();
  }

  // for dropdown
  String get dropdownValue => _dropdownValue;

  set dropDown(value) {
    _dropdownValue = value;
  }

  handleDropDownValue({required dropdown}) {
    dropDown = dropdown;
  }

  void add({
    required title1,
    required description1,
    required selectedDate1,
    required selectedTime1,
    required amount1,
    required typeOfAmount1,
  }) async {
    final amountInformation = AmountInformation(
      title: title1,
      description: description1,
      selectedDate: selectedDate1,
      selectedTime: selectedTime1,
      typeOfAmount: typeOfAmount1,
      amount: amount1,
    );
    data!.add(amountInformation);
    if (amountInformation.typeOfAmount == 'Income') {
      try {
        income!.add(amountInformation.amount);
        log(income!.toString());
        totalIncome = income!.reduce((value, element) => value + element);
        log('${totalIncome!} total income');
        notifyListeners();
      } catch (e) {
        log(e.toString());
      }
    } else {
      expenses!.add(amountInformation.amount);
      log(expenses!.toString());
      try {
        totalExpenses = expenses!.reduce((value, element) => value + element);
        notifyListeners();
      } catch (e) {
        log(e.toString());
      }
    }
  }

  void delete() async {
    data!.clear();
    income!.clear();
    expenses!.clear();
    totalIncome = 0;
    totalExpenses = 0;
    notifyListeners();
  }
}
