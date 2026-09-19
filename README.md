# 📱 กิจกรรมอบรม "พี่สอนน้อง" — ภาควิชาคอมพิวเตอร์
### Flutter Mobile App Workshop

> กิจกรรมอบรมพัฒนาแอปพลิเคชันมือถือด้วย **Flutter & Dart**  
> จัดโดยพี่ๆ ภาควิชาคอมพิวเตอร์เพื่อถ่ายทอดความรู้สู่น้องๆ

---

## 📖 ภาพรวมกิจกรรม / Overview

กิจกรรมนี้แบ่งการเรียนรู้ออกเป็น **2 ช่วง** เรียงตามลำดับความยากจากพื้นฐานไปสู่ระดับสูงขึ้น:

| ช่วง | โฟลเดอร์ | หัวข้อ |
|---|---|---|
| 🥚 ช่วงที่ 1 | `App/` | Flutter พื้นฐาน — Todo App (StatefulWidget) |
| 🚀 ช่วงที่ 2 | `GetX/todo_getx/` | State Management ด้วย GetX + Firebase |

---

## 🗂️ โครงสร้างโปรเจกต์ / Project Structure

```
Mobile_App/
├── App/                    # ช่วงที่ 1: Flutter พื้นฐาน
│   └── lib/
│       ├── main.dart                # Entry point
│       ├── home_screen.dart         # หน้าหลัก — แสดงรายการ Todo
│       └── add.todo_screen.dart     # หน้าเพิ่ม Todo
│
└── GetX/
    └── todo_getx/          # ช่วงที่ 2: GetX + Firebase
        └── lib/
            ├── main.dart            # Entry point + Firebase init
            ├── controllers/
            │   ├── auth_controller.dart    # จัดการ Authentication
            │   └── todo_controller.dart    # จัดการ Todo (CRUD)
            ├── views/
            │   ├── home_view.dart          # หน้าหลัก
            │   ├── add_todo_View.dart      # หน้าเพิ่ม Todo
            │   ├── login_view.dart         # หน้า Login
            │   └── register_view.dart      # หน้า Register
            ├── models/              # Data models
            ├── services/            # Firebase services
            └── widgets/             # Reusable widgets
```

---

## 🥚 ช่วงที่ 1 — Flutter พื้นฐาน (`App/`)

เรียนรู้การสร้างแอป Todo อย่างง่ายด้วย Flutter โดยไม่ใช้ state management library ภายนอก

### สิ่งที่ได้เรียนรู้
- 📌 การสร้าง `StatefulWidget` และ `StatelessWidget`
- 📌 การใช้งาน `ListView.builder` แสดงรายการข้อมูล
- 📌 Navigation ระหว่างหน้าด้วย `Navigator.push` / `pop`
- 📌 การใช้ `TextEditingController` รับ input จากผู้ใช้
- 📌 Widget พื้นฐาน: `Scaffold`, `AppBar`, `FloatingActionButton`, `ListTile`, `Checkbox`

### ฟีเจอร์
- ✅ แสดงรายการ Todo
- ✅ เพิ่ม Todo รายการใหม่
- ✅ ลบ Todo ออกจากรายการ

### Tech Stack
| รายการ | รายละเอียด |
|---|---|
| Framework | Flutter |
| ภาษา | Dart |
| SDK | Dart ^3.7.0 |
| Dependency | `cupertino_icons ^1.0.8` |

---

## 🚀 ช่วงที่ 2 — GetX + Firebase (`GetX/todo_getx/`)

ยกระดับแอป Todo ด้วย **GetX** สำหรับ State Management และ **Firebase** สำหรับ Backend

### สิ่งที่ได้เรียนรู้
- 📌 **GetX Pattern** — แยก Logic ออกจาก UI ด้วย `GetxController`
- 📌 **Firebase Authentication** — Login / Register / Logout
- 📌 **Cloud Firestore** — บันทึกและดึงข้อมูล Todo แบบ Real-time
- 📌 **GetStorage** — Local storage บนอุปกรณ์
- 📌 **GetMaterialApp** + Route Management ด้วย GetX
- 📌 Architecture แบบ **MVC** (Model / View / Controller)

### ฟีเจอร์
- ✅ สมัครสมาชิก (Register)
- ✅ เข้าสู่ระบบ / ออกจากระบบ (Login / Logout) ด้วย Firebase Auth
- ✅ เพิ่ม / ลบ / ดู Todo ที่ Sync กับ Cloud Firestore

### Tech Stack
| รายการ | รายละเอียด |
|---|---|
| Framework | Flutter |
| ภาษา | Dart |
| SDK | Dart ^3.7.0 |
| State Management | [GetX](https://pub.dev/packages/get) ^4.3.8 |
| Local Storage | [get_storage](https://pub.dev/packages/get_storage) ^2.0.3 |
| Auth | [firebase_auth](https://pub.dev/packages/firebase_auth) ^5.5.1 |
| Database | [cloud_firestore](https://pub.dev/packages/cloud_firestore) ^5.6.5 |
| Firebase Core | [firebase_core](https://pub.dev/packages/firebase_core) ^3.12.1 |

---

## ⚙️ วิธีรันโปรเจกต์ / Getting Started

### ข้อกำหนดเบื้องต้น
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart SDK ^3.7.0)
- Android Studio / VS Code พร้อม Flutter Extension
- (สำหรับช่วงที่ 2) บัญชี Firebase + ตั้งค่า `google-services.json`

---

### ▶️ รันช่วงที่ 1 — Flutter พื้นฐาน

```bash
cd App
flutter pub get
flutter run
```

---

### ▶️ รันช่วงที่ 2 — GetX + Firebase

> ⚠️ ต้องตั้งค่า Firebase ก่อนรัน — ดูขั้นตอนด้านล่าง

**1. ตั้งค่า Firebase**
```bash
# ติดตั้ง Firebase CLI (ถ้ายังไม่มี)
npm install -g firebase-tools
firebase login

# ติดตั้ง FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure Firebase สำหรับโปรเจกต์
cd GetX/todo_getx
flutterfire configure
```

**2. รันแอป**
```bash
flutter pub get
flutter run
```

---

## 📚 แนะนำสำหรับน้องๆ / Learning Path

```
1. ศึกษาโค้ดใน App/ ก่อน (Flutter พื้นฐาน)
   ↓
2. เข้าใจ StatefulWidget, setState, Navigator
   ↓
3. เปรียบเทียบกับโค้ดใน GetX/todo_getx/
   ↓
4. สังเกตความแตกต่างของการจัดการ State
   ↓
5. ทดลองเพิ่มฟีเจอร์ใหม่ด้วยตัวเอง 🎉
```

---

## 🔗 เอกสารอ้างอิง / References

- [Flutter Documentation](https://docs.flutter.dev/)
- [GetX Package](https://pub.dev/packages/get)
- [Firebase Flutter Setup](https://firebase.google.com/docs/flutter/setup)
- [Cloud Firestore](https://firebase.google.com/docs/firestore)
- [Dart Language](https://dart.dev/)

---

<div align="center">

❤️ **จัดทำโดยพี่ๆ ภาควิชาคอมพิวเตอร์** ❤️  
*กิจกรรมอบรม "พี่สอนน้อง"*

</div>
