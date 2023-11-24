import 'package:data_collect/Data/user.dart';
import 'package:gsheets/gsheets.dart';

class UserSheetsApi {
  static const credentials = r''' 
  {
  "type": "service_account",
  "project_id": "datacollectiontool-406106",
  "private_key_id": "0758886da35a554df159b987bb45145baf5b7e0e",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCij+JXCwjEg0pq\nztLOtKrsbNAKnAKQrKVJf5V4LoVreShhGTxFga7nsLuS6PPazOK/3C4zBB6eBadY\ndaVhkFTea9km2o3jefoYRz975OcnpslByV6meEAKvEVAbD8+AjR6JCG/8rUo/6g8\nLsPYdfKKcFmC7PJhEzqGQoYiMvdzyFBtw/Tn1HfCqUsduoz961Z3YCz7n8gvMpqI\nf5rOdV3q6J+TcGiDbxlkFcGHjY/24mCbzLj8t0IeXqI9YMf7MzH3CLysc/PUkTib\nILoyptX+ucRC0VqiKsRXkMfqVQcrTdYdA+cIOS2pNkbjEokEf7vxF2a4n/YWYSSP\nHQ+OMfN7AgMBAAECggEACRz72VlbAnlBwL8bfk8OjfaDqzSXyDiFg5tNa9Ff1WiT\nZO4fPN5KSd7UhSXeFdQKmirjxCRk+wLiIMlnnhKTT2zIXa8+6RO7e4TzACUS+FwX\nSELbtYVkQbXQRA5NdVJ2UqqX4cTfdw7uBYGxpP7nu+8UdYyHAf4r977e+ifVS35G\nZ0l6Ubh8RGfF2mcPElcVX+dA2WlNYpe7c0FdRAw3XE8ixFH7u+2F6LOzM0OpIUkK\nHGVkPl6dDlmY49xvnlzRC9crSUKqlkuKKyMrzrQV0QwKM0AH10IcqXroLx/6f71z\nuylBHdAFPNboMRGaLE341eFufhjEyfIKBpvSEDVzYQKBgQDaNqJTN6xu5nChHoGd\nGiFnlZfVG1EbW4Py/TTss3+pdXmcWzXF2xmxCRhhx//F18bMw/FMTG/7vag1mTLd\nnlwAxOXG8bWfzETtzmcXDmFjM8TY6AZB7PgWBq2H5NgAVuKqUzOe5XkVDJqyBNb+\nG7pn+56JYpaHPcvpmj4rSqdZeQKBgQC+tjvbt3x8dwt+gVGj16dkblnHu+yms9Sy\nNLGhC/H7xfKhbbCq4sa3frFKo1f4UoTVqMn11UmvG4uxzOszDTyvjCWHd7c7TJMN\ntsCtvdnT/EygtVwXgM2DSGq6p2kf7woTW6cDN/4tLUA6++4c0r4AfnEshiqtgdhD\naYYS8lRrkwKBgDSI5remNatVa1Q+5fGOsvAfQbiapQIzHCdJ8o3yARApKigMhXum\n7h6DFA2metuEwWXW3qcB2AwBcxfEVEyqrXe575/f3Vwlb4rZIFSar7OUaRXXdno0\ntN2IqgqHe8FJKbTb5xegI3B/4lZtd90hi9Uw7NAinh7dL9SDv+foRzXxAoGAJL6R\ny+SPbJ+3LDmYVDwRuWz1iWEw2HGfknJKox/dEMhz1hx/RH2LEgGsARh1s5eallv+\nBYqBtuZUxP4Zdu2e+qfC91XejONVFfhXKWKB3LEoxnIK+1BKyHekcLAethNlWpN3\nG0yngWbNkE/H8e+8wfWaspxrDqEM3Pgw5+ee0lcCgYEAmlSqHGPt9aMs2Cl/23Pj\nCDhXdA0iurO6RT+NhUR2GSSkw7Re6dXFbku2zPFgKnxn0j9CuclFdcZWXlJGP/p8\ndJAemsr7XgoEfXLc28ADXd2JwmFpUCi4wbL4mAO3APQQsfLGJ0mr1Kd43IQ+rYAW\nJlmOthSAcZEqzZ1kmqMtyqU=\n-----END PRIVATE KEY-----\n",
  "client_email": "datatcollection@datacollectiontool-406106.iam.gserviceaccount.com",
  "client_id": "104534005259742126718",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/datatcollection%40datacollectiontool-406106.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

  
  ''';
  static final _spreadsheetid = '1Uj_EYl78Z-VbVHAFzaqlFj-5XJg24C3ww2Q7hNTKmM0';

  static final _gsheets = GSheets(credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetid);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'users');

      final firstRow = UserFields.getFields();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('init error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowlist) async {
    if (_userSheet == null) return;
    _userSheet!.values.map.appendRows(rowlist);
  }
}
