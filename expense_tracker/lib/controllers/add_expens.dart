// ignore_for_file: non_constant_identifier_names, invalid_use_of_protected_member, unused_element, unused_local_variable

import 'dart:developer';

import 'package:expense_tracker/modal.dart';
import 'package:get/state_manager.dart';

class AddExpenseController extends GetxController {
  final RxString _title = ''.obs;
  final RxString _description = ''.obs;
  final RxInt _amount = 0.obs;
  final RxString _selectedDate = 'Date'.obs;
  final RxString _selectedTime = 'Time'.obs;
  final RxString _dropdownValue = 'Expenses'.obs;
  RxInt? totalIncome = 0.obs;
  RxInt? totalExpenses = 0.obs;
  final List<AmountInformation>? data = [];
  final List? income = [];
  final List? expenses = [];

  final List<String> options = [
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

  // @override
  // void onInit() async {
  //   // TODO: implement onInit
  //   super.onInit();
  //   await getData();
  // }

  // for title
  String get title => _title.value;

  set Gettitle(value) {
    _title.value = value;
  }

  handleTitle({required String title}) {
    Gettitle = title;
  }

  // for discription
  String get description => _description.value;

  set Getdescription(value) {
    _description.value = value;
  }

  handleDescription({required String description}) {
    Getdescription = description;
  }

  // for amount

  int get amount => _amount.value;

  set Getamount(value) {
    _amount.value = value;
  }

  handleAmount({required int amount}) {
    Getamount = amount;
  }

  /// for date and time

  String get selectedDate => _selectedDate.value;

  set selectedDate(value) {
    _selectedDate.value = value;
  }

  handleSelected({required final date}) {
    selectedDate = date;
  }

  String get selectedTime => _selectedTime.value;

  set selectedTime(value) {
    _selectedTime.value = value;
  }

  handleSelectedTime({required final time}) {
    selectedTime = time;
  }

  // for dropdown
  String get dropdownValue => _dropdownValue.value;

  set dropDown(value) {
    _dropdownValue.value = value;
  }

  handleDropDownValue({required final dropdown}) {
    dropDown = dropdown;
  }

  void add({
    required final title1,
    required final description1,
    required final selectedDate1,
    required final selectedTime1,
    required final amount1,
    required final typeOfAmount1,
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
        // for (int i = 0; i < income!.length; ++i) {
        //   totalIncome!.value += income![i] as int;
        //   log('${totalIncome!} total income');
        // }
        for (var value in income!) {
          totalIncome!.value += value as int;
          log('${totalIncome!} total income');
        }
        update();
      } catch (e) {
        log(e.toString());
      }
    } else {
      expenses!.add(amountInformation.amount);
      log(expenses!.toString());
      try {
        // for (int i = 0; i < expenses!.length; ++i) {
        //   totalExpenses!.value += expenses![i] as int;
        //   log('${totalExpenses!} total expense');
        // }
        for (var value in expenses!) {
          totalExpenses!.value += value as int;
          log('${totalExpenses!} total expense');
        }
        update();
      } catch (e) {
        log(e.toString());
      }
    }
  }

  void delete() async {
    data!.clear();
    income!.clear();
    expenses!.clear();
    totalIncome!.value = 0;
    totalExpenses!.value = 0;
    update();
  }

  deleteAmount(String amount) {
    amount.substring(0, amount.length - 1);
    update();
    return amount;
  }

  addAmount(String amount, int index) {
    amount += amount[index];
    update();
    return amount;
  }
}
