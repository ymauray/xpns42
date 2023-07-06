import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpns42/custom_form/single_text_field.dart';
import 'package:xpns42/provider/expense_form_state_provider.dart';

class ExpenseForm extends ConsumerWidget {
  const ExpenseForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();
    final dateController = TextEditingController()
      ..text =
          DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY).format(DateTime.now());

    final state = ref.watch(expenseFormProvider);

    titleController.text = state.title ?? '';
    amountController.text = state.amount?.toStringAsFixed(2) ?? '';
    dateController.text = DateFormat(
      DateFormat.ABBR_MONTH_WEEKDAY_DAY,
    ).format(state.date ?? DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SingleTextField(
                  labelText: 'Title',
                  controller: titleController,
                ),
              ],
            ),
            Row(
              children: [
                SingleTextField(
                  labelText: 'Amount',
                  controller: amountController,
                  keyboadType: TextInputType.number,
                  flex: 3,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: DropdownButtonFormField<String>(
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        labelText: 'Currency',
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'CHF',
                          child: Text('CHF'),
                        ),
                        DropdownMenuItem(
                          value: 'EUR',
                          child: Text('EUR'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      readOnly: true,
                      controller: dateController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        labelText: 'Date',
                      ),
                      onTap: () async {
                        final dateTime = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        if (dateTime != null) {
                          dateController.text = DateFormat(
                            DateFormat.ABBR_MONTH_WEEKDAY_DAY,
                          ).format(dateTime);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
