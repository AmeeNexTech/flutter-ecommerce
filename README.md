# 🛍️ EcommerceShoporia

**EcommerceShoporia** is a modern e-commerce application developed using **Flutter**.  
The app aims to provide a complete online shopping experience, including order tracking, cart management, and electronic payment options.

---

## Current Progress

- ✅ **Completed the language selection screen**  
  ![Language Selection](assets/screenshots/language_selection.png)

- ✅ **Completed the onboarding screens (Supports Arabic and English)**  
  ![Onboarding](assets/screenshots/onboarding.png)

- 🔧 **Currently working on login and password recovery screens**

---

## 🎯 Planned Features

- 🛒 Browse product categories and items  
- ❤️ Manage favorite products  
- 🛍️ Shopping cart functionality  
- 📍 Order tracking via Google Maps  
- ⭐ Product ratings and customer reviews  
- 🎟️ Coupon system for discounts  
- 🔔 Push notifications for order updates and promotions  
- 💳 Electronic payment options  
- 🖥️ Web-based admin panel for full control over the application  

---

## 🧰 Tech Stack & Tools

| Layer                    | Technology / Tool               | Purpose / Usage                                                                 |
|--------------------------|----------------------------------|----------------------------------------------------------------------------------|
| **Frontend (Flutter)**   | **Flutter + Dart**               | Cross-platform mobile app development using Dart                                 |
|                          | **GetX**                         | Efficient state management, routing, and dependency injection                    |
|                          | **Dio + Interceptors**           | HTTP client with advanced logging, error handling, and token refresh             |
|                          | **flutter_secure_storage**       | Securely store sensitive data like tokens locally                                |
|                          | **shared_preferences**           | Store non-sensitive user settings locally                                        |
|                          | **Freezed + JsonSerializable**   | Define immutable models with auto JSON serialization                             |

| **Backend**              | **Laravel (PHP)**                | RESTful API backend framework                                                    |
|                          | **Laravel Sanctum**              | Lightweight API token authentication                                             |
|                          | **MySQL**                        | Relational database for persistent app data                                      |

| **Notifications**        | **Firebase Cloud Messaging**     | Push notification service                                                        |

| **Testing**              | **integration_test**             | End-to-end testing for core user flows                                           |

---


---

## 📄 Project Documentation

The documentation is written from my personal learning journey, aiming to explain each part of the app in a clear and simple way.  
I’ve tried to break down the logic, structure, and purpose behind every main feature to help myself — and hopefully others — better understand how things work.

🧭 [Onboarding Flow](https://github.com/AmeeNexTech/flutter-ecommerce/blob/main/docs/onboarding.md) — Full breakdown of the onboarding logic using GetX, MVC, and PageView  
🌐 [Localization System](https://github.com/AmeeNexTech/flutter-ecommerce/blob/main/docs/localization.md) — How language selection, translations, and persistent language settings are implemented

---
## 🛠️ Solved Issues

During development, I encountered several technical problems and documented how I solved them.  
These are now shared for others (and my future self!) to learn from and reference easily.

📁 [issues_solved/](https://github.com/AmeeNexTech/flutter-ecommerce/tree/main/issues_solved)

---

## 🚧 Project Status

The project is under **active development**, with regular updates made as progress continues.

---

## 💡 Notes

This is a **personal project** built by a passionate beginner developer focused on creating high-quality mobile apps.  
The goal of this project is to **learn, grow, and document** the journey of building a full-featured e-commerce app from scratch.  
By sharing this project, I aim to reflect on my progress and provide value to others who may be learning as well.

---

## 🙋‍♂️ How to Contribute

This is a learning project, but feel free to open issues, suggest improvements, or fork it to build your own version!

