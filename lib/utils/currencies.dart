import 'package:flutter/material.dart';

const currencies = [
  DropdownMenuItem(value: 'AED', child: Text('AED')),
  DropdownMenuItem(value: 'AFN', child: Text('AFN')),
  DropdownMenuItem(value: 'ALL', child: Text('ALL')),
  DropdownMenuItem(value: 'AMD', child: Text('AMD')),
  DropdownMenuItem(value: 'ANG', child: Text('ANG')),
  DropdownMenuItem(value: 'AOA', child: Text('AOA')),
  DropdownMenuItem(value: 'ARS', child: Text('ARS')),
  DropdownMenuItem(value: 'AUD', child: Text('AUD')),
  DropdownMenuItem(value: 'AWG', child: Text('AWG')),
  DropdownMenuItem(value: 'AZN', child: Text('AZN')),
  DropdownMenuItem(value: 'BAM', child: Text('BAM')),
  DropdownMenuItem(value: 'BBD', child: Text('BBD')),
  DropdownMenuItem(value: 'BDT', child: Text('BDT')),
  DropdownMenuItem(value: 'BGN', child: Text('BGN')),
  DropdownMenuItem(value: 'BHD', child: Text('BHD')),
  DropdownMenuItem(value: 'BIF', child: Text('BIF')),
  DropdownMenuItem(value: 'BMD', child: Text('BMD')),
  DropdownMenuItem(value: 'BND', child: Text('BND')),
  DropdownMenuItem(value: 'BOB', child: Text('BOB')),
  DropdownMenuItem(value: 'BOV', child: Text('BOV')),
  DropdownMenuItem(value: 'BRL', child: Text('BRL')),
  DropdownMenuItem(value: 'BSD', child: Text('BSD')),
  DropdownMenuItem(value: 'BTN', child: Text('BTN')),
  DropdownMenuItem(value: 'BWP', child: Text('BWP')),
  DropdownMenuItem(value: 'BYN', child: Text('BYN')),
  DropdownMenuItem(value: 'BZD', child: Text('BZD')),
  DropdownMenuItem(value: 'CAD', child: Text('CAD')),
  DropdownMenuItem(value: 'CDF', child: Text('CDF')),
  DropdownMenuItem(value: 'CHE', child: Text('CHE')),
  DropdownMenuItem(value: 'CHF', child: Text('CHF')),
  DropdownMenuItem(value: 'CHW', child: Text('CHW')),
  DropdownMenuItem(value: 'CLF', child: Text('CLF')),
  DropdownMenuItem(value: 'CLP', child: Text('CLP')),
  DropdownMenuItem(value: 'CNY', child: Text('CNY')),
  DropdownMenuItem(value: 'COP', child: Text('COP')),
  DropdownMenuItem(value: 'COU', child: Text('COU')),
  DropdownMenuItem(value: 'CRC', child: Text('CRC')),
  DropdownMenuItem(value: 'CUC', child: Text('CUC')),
  DropdownMenuItem(value: 'CUP', child: Text('CUP')),
  DropdownMenuItem(value: 'CVE', child: Text('CVE')),
  DropdownMenuItem(value: 'CZK', child: Text('CZK')),
  DropdownMenuItem(value: 'DJF', child: Text('DJF')),
  DropdownMenuItem(value: 'DKK', child: Text('DKK')),
  DropdownMenuItem(value: 'DOP', child: Text('DOP')),
  DropdownMenuItem(value: 'DZD', child: Text('DZD')),
  DropdownMenuItem(value: 'EGP', child: Text('EGP')),
  DropdownMenuItem(value: 'ERN', child: Text('ERN')),
  DropdownMenuItem(value: 'ETB', child: Text('ETB')),
  DropdownMenuItem(value: 'EUR', child: Text('EUR')),
  DropdownMenuItem(value: 'FJD', child: Text('FJD')),
  DropdownMenuItem(value: 'FKP', child: Text('FKP')),
  DropdownMenuItem(value: 'GBP', child: Text('GBP')),
  DropdownMenuItem(value: 'GEL', child: Text('GEL')),
  DropdownMenuItem(value: 'GHS', child: Text('GHS')),
  DropdownMenuItem(value: 'GIP', child: Text('GIP')),
  DropdownMenuItem(value: 'GMD', child: Text('GMD')),
  DropdownMenuItem(value: 'GNF', child: Text('GNF')),
  DropdownMenuItem(value: 'GTQ', child: Text('GTQ')),
  DropdownMenuItem(value: 'GYD', child: Text('GYD')),
  DropdownMenuItem(value: 'HKD', child: Text('HKD')),
  DropdownMenuItem(value: 'HNL', child: Text('HNL')),
  DropdownMenuItem(value: 'HRK', child: Text('HRK')),
  DropdownMenuItem(value: 'HTG', child: Text('HTG')),
  DropdownMenuItem(value: 'HUF', child: Text('HUF')),
  DropdownMenuItem(value: 'IDR', child: Text('IDR')),
  DropdownMenuItem(value: 'ILS', child: Text('ILS')),
  DropdownMenuItem(value: 'INR', child: Text('INR')),
  DropdownMenuItem(value: 'IQD', child: Text('IQD')),
  DropdownMenuItem(value: 'IRR', child: Text('IRR')),
  DropdownMenuItem(value: 'ISK', child: Text('ISK')),
  DropdownMenuItem(value: 'JMD', child: Text('JMD')),
  DropdownMenuItem(value: 'JOD', child: Text('JOD')),
  DropdownMenuItem(value: 'JPY', child: Text('JPY')),
  DropdownMenuItem(value: 'KES', child: Text('KES')),
  DropdownMenuItem(value: 'KGS', child: Text('KGS')),
  DropdownMenuItem(value: 'KHR', child: Text('KHR')),
  DropdownMenuItem(value: 'KMF', child: Text('KMF')),
  DropdownMenuItem(value: 'KPW', child: Text('KPW')),
  DropdownMenuItem(value: 'KRW', child: Text('KRW')),
  DropdownMenuItem(value: 'KWD', child: Text('KWD')),
  DropdownMenuItem(value: 'KYD', child: Text('KYD')),
  DropdownMenuItem(value: 'KZT', child: Text('KZT')),
  DropdownMenuItem(value: 'LAK', child: Text('LAK')),
  DropdownMenuItem(value: 'LBP', child: Text('LBP')),
  DropdownMenuItem(value: 'LKR', child: Text('LKR')),
  DropdownMenuItem(value: 'LRD', child: Text('LRD')),
  DropdownMenuItem(value: 'LSL', child: Text('LSL')),
  DropdownMenuItem(value: 'LYD', child: Text('LYD')),
  DropdownMenuItem(value: 'MAD', child: Text('MAD')),
  DropdownMenuItem(value: 'MDL', child: Text('MDL')),
  DropdownMenuItem(value: 'MGA', child: Text('MGA')),
  DropdownMenuItem(value: 'MKD', child: Text('MKD')),
  DropdownMenuItem(value: 'MMK', child: Text('MMK')),
  DropdownMenuItem(value: 'MNT', child: Text('MNT')),
  DropdownMenuItem(value: 'MOP', child: Text('MOP')),
  DropdownMenuItem(value: 'MRU', child: Text('MRU')),
  DropdownMenuItem(value: 'MUR', child: Text('MUR')),
  DropdownMenuItem(value: 'MVR', child: Text('MVR')),
  DropdownMenuItem(value: 'MWK', child: Text('MWK')),
  DropdownMenuItem(value: 'MXN', child: Text('MXN')),
  DropdownMenuItem(value: 'MXV', child: Text('MXV')),
  DropdownMenuItem(value: 'MYR', child: Text('MYR')),
  DropdownMenuItem(value: 'MZN', child: Text('MZN')),
  DropdownMenuItem(value: 'NAD', child: Text('NAD')),
  DropdownMenuItem(value: 'NGN', child: Text('NGN')),
  DropdownMenuItem(value: 'NIO', child: Text('NIO')),
  DropdownMenuItem(value: 'NOK', child: Text('NOK')),
  DropdownMenuItem(value: 'NPR', child: Text('NPR')),
  DropdownMenuItem(value: 'NZD', child: Text('NZD')),
  DropdownMenuItem(value: 'OMR', child: Text('OMR')),
  DropdownMenuItem(value: 'PAB', child: Text('PAB')),
  DropdownMenuItem(value: 'PEN', child: Text('PEN')),
  DropdownMenuItem(value: 'PGK', child: Text('PGK')),
  DropdownMenuItem(value: 'PHP', child: Text('PHP')),
  DropdownMenuItem(value: 'PKR', child: Text('PKR')),
  DropdownMenuItem(value: 'PLN', child: Text('PLN')),
  DropdownMenuItem(value: 'PYG', child: Text('PYG')),
  DropdownMenuItem(value: 'QAR', child: Text('QAR')),
  DropdownMenuItem(value: 'RON', child: Text('RON')),
  DropdownMenuItem(value: 'RSD', child: Text('RSD')),
  DropdownMenuItem(value: 'RUB', child: Text('RUB')),
  DropdownMenuItem(value: 'RWF', child: Text('RWF')),
  DropdownMenuItem(value: 'SAR', child: Text('SAR')),
  DropdownMenuItem(value: 'SBD', child: Text('SBD')),
  DropdownMenuItem(value: 'SCR', child: Text('SCR')),
  DropdownMenuItem(value: 'SDG', child: Text('SDG')),
  DropdownMenuItem(value: 'SEK', child: Text('SEK')),
  DropdownMenuItem(value: 'SGD', child: Text('SGD')),
  DropdownMenuItem(value: 'SHP', child: Text('SHP')),
  DropdownMenuItem(value: 'SLE', child: Text('SLE')),
  DropdownMenuItem(value: 'SOS', child: Text('SOS')),
  DropdownMenuItem(value: 'SRD', child: Text('SRD')),
  DropdownMenuItem(value: 'SSP', child: Text('SSP')),
  DropdownMenuItem(value: 'STN', child: Text('STN')),
  DropdownMenuItem(value: 'SVC', child: Text('SVC')),
  DropdownMenuItem(value: 'SYP', child: Text('SYP')),
  DropdownMenuItem(value: 'SZL', child: Text('SZL')),
  DropdownMenuItem(value: 'THB', child: Text('THB')),
  DropdownMenuItem(value: 'TJS', child: Text('TJS')),
  DropdownMenuItem(value: 'TMT', child: Text('TMT')),
  DropdownMenuItem(value: 'TND', child: Text('TND')),
  DropdownMenuItem(value: 'TOP', child: Text('TOP')),
  DropdownMenuItem(value: 'TRY', child: Text('TRY')),
  DropdownMenuItem(value: 'TTD', child: Text('TTD')),
  DropdownMenuItem(value: 'TWD', child: Text('TWD')),
  DropdownMenuItem(value: 'TZS', child: Text('TZS')),
  DropdownMenuItem(value: 'UAH', child: Text('UAH')),
  DropdownMenuItem(value: 'UGX', child: Text('UGX')),
  DropdownMenuItem(value: 'USD', child: Text('USD')),
  DropdownMenuItem(value: 'USN', child: Text('USN')),
  DropdownMenuItem(value: 'UYI', child: Text('UYI')),
  DropdownMenuItem(value: 'UYU', child: Text('UYU')),
  DropdownMenuItem(value: 'UZS', child: Text('UZS')),
  DropdownMenuItem(value: 'VED', child: Text('VED')),
  DropdownMenuItem(value: 'VEF', child: Text('VEF')),
  DropdownMenuItem(value: 'VND', child: Text('VND')),
  DropdownMenuItem(value: 'VUV', child: Text('VUV')),
  DropdownMenuItem(value: 'WST', child: Text('WST')),
  DropdownMenuItem(value: 'XAF', child: Text('XAF')),
  DropdownMenuItem(value: 'XCD', child: Text('XCD')),
  DropdownMenuItem(value: 'XDR', child: Text('XDR')),
  DropdownMenuItem(value: 'XOF', child: Text('XOF')),
  DropdownMenuItem(value: 'XPF', child: Text('XPF')),
  DropdownMenuItem(value: 'XSU', child: Text('XSU')),
  DropdownMenuItem(value: 'XUA', child: Text('XUA')),
  DropdownMenuItem(value: 'YER', child: Text('YER')),
  DropdownMenuItem(value: 'ZAR', child: Text('ZAR')),
  DropdownMenuItem(value: 'ZMW', child: Text('ZMW')),
  DropdownMenuItem(value: 'ZWL', child: Text('ZWL')),
];
