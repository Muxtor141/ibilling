import 'dart:convert';

class DemoData {
  Future<dynamic> getDemoData() async {
    var list = [
      {
        "name": "Sanjar Abdullaev",
        "status": "In Process",
        "amount": "2,500,000 UZS",
        "lastInvoice": 134,
        "invoices": 9,
        "contractNumber": 67,
        "inn": "543234233",
        "address": "Boburshox ko'chasi 43-uy,Yunusobod tumani,Toshkent",
        "created": "2021-03-17 14:28:00"
      },
      {
        "name": "Azizbek Toraev",
        "status": "Rejected by Payme",
        "amount": "2,500,000 UZS",
        "lastInvoice": 185,
        "invoices": 3,
        "inn": "543234233",
        "contractNumber": 144,
        "address": "Boburshox ko'chasi 43-uy,Yunusobod tumani,Toshkent",
        "created": "2021-08-06 14:28:00"
      },
      {
        "name": "Malika Akbarova",
        "status": "Rejected by IQ",
        "amount": "2,500,000 UZS",
        "lastInvoice": 345,
        "invoices": 12,
        "contractNumber": 234,
        "inn": "543234233",
        "address": "Boburshox ko'chasi 43-uy,Yunusobod tumani,Toshkent",
        "created": "2021-08-10 11:56:00"
      },
      {
        "name": "Malika Akbarova",
        "status": "Paid",
        "amount": "2,500,000 UZS",
        "lastInvoice": 222,
        "invoices": 14,
        "contractNumber": 106,
        "inn": "543234233",
        "address": "Boburshox ko'chasi 43-uy,Yunusobod tumani,Toshkent",
        "created": "2021-08-09 17:13:00"
      },
      {
        "name": "Malika Akbarova",
        "status": "Rejected by IQ",
        "amount": "2,500,000 UZS",
        "lastInvoice": 345,
        "invoices": 12,
        "contractNumber": 234,
        "inn": "543234233",
        "address": "Boburshox ko'chasi 43-uy,Yunusobod tumani,Toshkent",
        "created": "2021-08-10 11:56:00"
      },
      {
        "name": "Malika Akbarova",
        "status": "Rejected by IQ",
        "amount": "2,500,000 UZS",
        "lastInvoice": 345,
        "invoices": 12,
        "contractNumber": 234,
        "inn": "543234233",
        "address": "Boburshox ko'chasi 43-uy,Yunusobod tumani,Toshkent",
        "created": "2021-08-10 11:56:00"
      }
    ];

    var jsonString = json.encode(list);

    // var data = json.encode(list);
    // print(data);
    return jsonString;
  }
}
