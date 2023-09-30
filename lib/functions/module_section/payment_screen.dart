import 'package:dhan_manthan/functions/become_consultant.dart/modules_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upi_india/upi_india.dart';

class UpiPayment extends StatefulWidget {
  const UpiPayment({super.key});

  @override
  _UpiPaymenteState createState() => _UpiPaymenteState();
}

class _UpiPaymenteState extends State<UpiPayment> {
  Future<UpiResponse>? _transaction;
  final UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;
  Widget button = Align(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
          onPressed: () {
            Get.off(() => const Modules());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(68, 149, 250, 1.0),
          ),
          child: const Text('Next')));

  TextStyle header = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  TextStyle value = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "8815122276@ybl",
      receiverName: 'Dhan Manthan',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'Not actual. Just an example.',
      amount: 1.00,
    );
  }

  Widget displayUpiApps() {
    if (apps == null) {
      return const Center(child: CircularProgressIndicator());
    } else if (apps!.isEmpty) {
      return Center(
        child: Text(
          "No apps found to handle transaction.",
          style: header,
        ),
      );
    } else {
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                onTap: () {
                  _transaction = initiateTransaction(app);
                  setState(() {});
                },
                child: Column(
                  children: [
                    SizedBox(
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.memory(
                            app.icon,
                            height: 60,
                            width: 60,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            app.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      );
    }
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'An Unknown error has occurred';
    }
  }

  void _checkTxnStatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        setState(() {
          button = Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(68, 149, 250, 1.0),
                  ),
                  child: const Text('Next')));
        });
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transaction Submitted');
        break;
      case UpiPaymentStatus.FAILURE:
        print('Transaction Failed');
        break;
      default:
        print('Received an Unknown transaction status');
    }
  }

  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ", style: header),
          Flexible(
              child: Text(
            body,
            style: value,
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(builder: (context) {
                    return IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        ));
                  }),
                  const SizedBox(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 20,
                          child: Image(
                            image: AssetImage(
                                'assets/images/dhan_manthan__4_-removebg-preview.png'),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'DHAN MANTHAN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.info,
                        color: Colors.white,
                        size: 25,
                      ))
                ],
              )),
            ),
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(68, 149, 250, 1.0),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Expanded(
                child: displayUpiApps(),
              ),
              Expanded(
                child: FutureBuilder(
                  future: _transaction,
                  builder: (BuildContext context,
                      AsyncSnapshot<UpiResponse> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            _upiErrorHandler(snapshot.error.runtimeType),
                            style: header,
                          ), // Print's text message on screen
                        );
                      }

                      // If we have data then definitely we will have UpiResponse.
                      // It cannot be null
                      UpiResponse _upiResponse = snapshot.data!;

                      // Data in UpiResponse can be null. Check before printing
                      String txnId = _upiResponse.transactionId ?? 'N/A';
                      String resCode = _upiResponse.responseCode ?? 'N/A';
                      String txnRef = _upiResponse.transactionRefId ?? 'N/A';
                      String status = _upiResponse.status ?? 'N/A';
                      String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
                      _checkTxnStatus(status);

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            displayTransactionData('Transaction Id', txnId),
                            displayTransactionData('Response Code', resCode),
                            displayTransactionData('Reference Id', txnRef),
                            displayTransactionData(
                                'Status', status.toUpperCase()),
                            displayTransactionData('Approval No', approvalRef),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(''),
                      );
                    }
                  },
                ),
              ),
              button
            ],
          ),
        ),
      ),
    );
  }
}
