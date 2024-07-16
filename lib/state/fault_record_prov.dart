import 'package:flutter/material.dart';

import '../datasourse/imple/fault_info_ds.dart';
import '../entity/fault_report_record.dart';

class FaultRecordProv with ChangeNotifier {
  List<FaultReportRecord> _records = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<FaultReportRecord> get records => _records;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void _setRecords(List<FaultReportRecord> records) {
    _records = records;
    notifyListeners();
  }

  Future<void> fetchFaultReport(int status) async {
    _setLoading(true);
    try {
      final result = await TeacherFaultReportDs.getFaultReportRecord(status);
      if (result.isSuccess) {
        _setRecords(result.data!);
        _setError('');
      } else {
        _setError('Failed to load fault records');
      }
    } catch (e) {
      _setError('An error occurred: $e');
    } finally {
      _setLoading(false);
    }
  }
}