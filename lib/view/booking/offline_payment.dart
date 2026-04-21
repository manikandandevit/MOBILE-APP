import 'package:bright_kid/Core/Services/home_services.dart';
import 'package:bright_kid/controller/home_controller.dart';
import 'package:bright_kid/view/widget/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../data/app_colors.dart';
import '../data/app_style.dart';
import '../data/app_text.dart';
import '../data/utils.dart';
import '../routes/app_pages.dart';
import '../widget/custom_button.dart';
import 'booking_fee_amount_card_widget.dart';

class OfflinePayment extends StatelessWidget {
  const OfflinePayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orangeShadeFour,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: AppColors.black,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              Strings.bookingFee,
              style: nunitoSans.copyWith(
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: Consumer<HomeController>(
        builder: (context, provider, child) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Form(
              key: provider.formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  BookingFeeAmountCardWidget(),
                  const SizedBox(height: 20),
                  Text(
                    Strings.amountPaid,
                    style: nunitoSans.copyWith(
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    prefixIcon: Icon(
                      Icons.currency_rupee,
                      color: Colors.black,
                      size: 16,
                    ),
                    controller: provider.amountPaid,
                    filled: true,
                    fillColor: AppColors.white,
                    borderColor: AppColors.greyShadeOne,
                    hintText: Strings.enterAmount,
                    hintStyle: nunitoSans.copyWith(
                      fontSize: 15,
                      color: AppColors.black,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '* Amount Required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    Strings.dateOfPayment,
                    style: nunitoSans.copyWith(
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: provider.datePicker,
                    readOnly: true,
                    suffixIcon: const Icon(Icons.calendar_month),
                    filled: true,
                    fillColor: AppColors.white,
                    borderColor: AppColors.greyShadeOne,
                    hintStyle: nunitoSans.copyWith(
                      fontSize: 15,
                      color: AppColors.black,
                    ),
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        provider.datePickerValue = picked;
                        provider.datePicker.text =
                            "${picked.day}/${picked.month}/${picked.year}";
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '* Date Required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    Strings.paymentMode,
                    style: nunitoSans.copyWith(
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: "Cash",
                        groupValue: provider.paymentMode,
                        activeColor: Colors.orange,
                        onChanged: (value) {
                          provider.boolPaymentMode(
                            provider.paymentMode = value!,
                          );
                          provider.chequeDetails.clear();
                        },
                      ),
                      Text(
                        "Cash",
                        style: nunitoSans.copyWith(
                          fontSize: 14,
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 50),
                      Radio<String>(
                        value: "Cheque",
                        groupValue: provider.paymentMode,
                        activeColor: Colors.orange,
                        onChanged: (value) {
                          provider.boolPaymentMode(
                            provider.paymentMode = value!,
                          );
                        },
                      ),
                      Text(
                        "Cheque",
                        style: nunitoSans.copyWith(
                          fontSize: 14,
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  if (provider.paymentMode == "Cheque") ...[
                    const SizedBox(height: 10),
                    Text(
                      Strings.enterChequeDetails,
                      style: nunitoSans.copyWith(
                        fontSize: 14,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: provider.chequeDetails,
                      filled: true,
                      fillColor: AppColors.white,
                      borderColor: AppColors.greyShadeOne,
                      hintText: Strings.enterChequeDetails,
                      hintStyle: nunitoSans.copyWith(
                        fontSize: 15,
                        color: AppColors.black,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '* Cheque Details Required';
                        }
                        return null;
                      },
                    ),
                  ],
                  const SizedBox(height: 20),
                  Text(
                    Strings.offlinePaymentContent,
                    textAlign: TextAlign.center,
                    style: nunitoSans.copyWith(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () async {
                        if (!provider.formkey.currentState!.validate()) return;
                        provider.offlinePaymentDetailsApi().then((value) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.BOTTOMNAVIGATIONBAR,
                            (route) => false,
                          );
                        });
                      },
                      child: CustomButton(
                        buttonWidth: kWidth,
                        buttonHeight: 50,
                        border: Border.all(color: AppColors.orange),
                        text: Strings.submitDetails,
                        style: nunitoSans.copyWith(
                          fontSize: 14,
                          color: AppColors.orange,
                          fontWeight: FontWeight.w700,
                        ),
                        isLoading: provider.loading,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
