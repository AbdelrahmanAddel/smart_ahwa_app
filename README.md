# Smart Qhwa Manager ☕
Smart Qhwa Manager & Qhwa App for managing drink orders in a coffee shop.  
This project allows users to place drink orders, track pending orders, and view reports about sales performance.  
---
## 🚀 Features
- **📝 Add Order**: Customers can add new drink orders.  
- **📊 Dashboard**: Displays pending orders and the number of waiting orders.  
- **📈 Reports**: Shows the best-selling drink, the total number of times it was served, and the total number of all products served.  
---
## 💻 Tech Stack
- **Language**: Dart  
- **Framework**: Flutter  
- **Principles & Patterns**: Encapsulation, Inheritance, Polymorphism, Composition,  
  SRP (Single Responsibility Principle), OCP (Open-Closed Principle),  
  DIP (Dependency Inversion Principle), Singleton.  
---
## 📦 Installation
Clone the repository:
```bash
git clone https://github.com/mazenanter/Ahwa-Manager.git
flutter pub get
flutter run
```
## 📱 Usage

### 📝 Add Order Screen
Add new customer orders with drink selection and special instructions.

<img width="660" height="1434" alt="Add Order Screen" src="https://github.com/user-attachments/assets/3e0307fa-c7d0-4ad8-9e93-780278260f6e" />

### 📊 Dashboard Screen  
View pending orders and monitor current order status.

<img width="660" height="1434" alt="Dashboard Screen" src="https://github.com/user-attachments/assets/f7f071b4-71cb-4d15-a13d-1df379e2d15f" />

### 📈 Reports Screen
Analyze sales performance and view best-selling drinks statistics.

<img width="660" height="1434" alt="Reports Screen" src="https://github.com/user-attachments/assets/7f62067e-89aa-408f-a145-7538fa004a39" />

---

## 🏗️ Architecture & Design
- **🔐 Encapsulation**: Made all variables private to implement Encapsulation, so that no one is allowed to change their values directly.
- **🔗 Inheritance**: Created the Drink class as an abstract base class (blueprint), and other classes extend from it.
- **⚡ Polymorphism**: Made the function make() abstract so that any class extending the parent class (Drink) can write its own implementation.
- **🎯 Single Responsibility Principle (SRP)**: Created a separate class for every drink to achieve SRP.
- **🔧 Dependency Inversion Principle (DIP)**: Created a DashboardService base class and a NormalDashboard class. Inside this class, I used Composition by depending on abstractions instead of concrete implementations.
- **🔄 Open-Closed Principle (OCP)**: When I want to add new drinks, I don't need to modify the existing code; I just create a new class that extends Drink and implements make(). The system is open for extension but closed for modification.

Every time I press on Add Order, I call the make() function from the Drink class, which behaves differently depending on which drink subclass is used (Polymorphism).

## 📧 Contact
- **💼 LinkedIn**: https://www.linkedin.com/in/abdelrahman-ezzeldean/
- **📫 Email**: abdelrahmanezzeldean@gmail.com
