import 'package:bloc_code/Feature/ScavengerScreen/domain/entities/scavenger_entity.dart';
import 'package:flutter/material.dart';

 showLockUnlockPopup(BuildContext context, DataEntity task) {
  final isHidden = task.h == "1"; // h=1 => hidden => show unlock
  final actionText = isHidden ? "Unlock" : "Lock";
  String qr = task.qr;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          children: [
            Icon(
              isHidden ? Icons.lock_open_rounded : Icons.lock_rounded,
              color: isHidden ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 8),
            Text("$actionText Task"),
          ],
        ),
        content: Text("Are you sure you want to $actionText this task?"),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              try {
                //    Navigator.pop(context); // close popup first
                // await _lockUnlockTask(
                //     !isHidden,// true => unlock, false => lock
                //     task['qr']
                // );
              } catch (e) {
                print(e);
              }
            },
            icon: Icon(
              isHidden ? Icons.lock_open_rounded : Icons.lock_rounded,
            ),
            label: Text(actionText),
            style: ElevatedButton.styleFrom(
              backgroundColor: isHidden ? Colors.green : Colors.red,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      );
    },
  );
}
// Future<void> _lockUnlockTask( bool unlock, String qr) async {
//   final apiUrl = "http://13.234.251.159:8081/api/Events/LockUnlockEvents"; // replace with your endpoint
//   final payload = {
//     "emp_id": userid,
//     "qr": qr,
//     "lock_status": unlock ? "1" : "0", // 0 = unlocked, 1 = locked
//   };
//   print("📤 Sending payload: ${jsonEncode(payload)}");
//   try {
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(payload), // send encoded JSON
//     );
//
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> resp = jsonDecode(response.body);
//       String json_status = resp["json_status"].toString();
//       String msg = resp["msg"].toString();
//       if (json_status == '1'){
//         print("Task updated successfully ✅");
//         fetchData(3);
//         Navigator.pop(context);
//
//       }else{
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error: ${msg}'),
//             duration: Duration(seconds: 2),
//           ),
//         );
//       }
//       // optional: refresh your scavengerTasks list
//     } else {
//       print("Failed to update task ❌");
//     }
//   } catch (e) {
//     print("API error: $e");
//   }
// }

