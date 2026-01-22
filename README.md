# 🍔 SnackPoint – Food Ordering System

A full‑stack **Food Ordering Web Application** built using **JSP, JDBC, AJAX, MVC, Bootstrap, HTML, CSS, and JavaScript**. The project supports **role‑based access (Admin & User)**, **wallet-based payments**, **AJAX-powered search**, and **session management**.

---

## 🚀 Key Features

### 👤 User Features
- User Registration & Login (Session-based authentication)
- Browse food items by **Category**
- Dynamic **Category-wise food filtering**
- **AJAX Search** (works even after category filter is applied)
- Add to Cart & Manage Cart
- Place Orders
- Wallet system for payments
- View Wallet Balance
- Order History & Transaction History
- Update Profile & Change Password
- Secure Logout

---

### 🛠️ Admin Features
- Admin Login (Session-based)
- Dashboard to manage application
- Add / Update / Delete Food Items
- Upload & Change Food Images
- Manage Food Categories
- Toggle Food Availability
- View & Manage Users
- Accept / Reject Orders
- Wallet Management (Add balance to users)
- View All Transactions
- Admin Profile & Password Update

---

## 💳 Payment System
- Wallet-based payment system
- Balance is deducted automatically on order placement
- Every wallet operation is recorded in **Transaction History**

---

## ⚡ AJAX Usage
- Live food search without page reload
- Search works **even when category-wise food is displayed**
- Improves performance and user experience

---

## 🧠 Architecture
- **MVC Architecture**
  - **Model** → Java Classes (Cart, Food, User, Order, Transaction, Category)
  - **View** → JSP Pages
  - **Controller** → JSP + JDBC handling
- **Session Management** for security and role separation

---

## 📂 Project Structure (Simplified)

```
SnackPoint-Food-Ordering-System/
│
├── admin/               # Admin JSP pages
├── user/                # User JSP pages
├── src/vgt/models/      # Java model classes
├── web/                 # Web resources
├── nbproject/           # NetBeans configuration
├── build.xml            # Ant build file
├── .gitignore
```

---

## 🧩 Technologies Used

- **Frontend**: HTML, CSS, Bootstrap, JavaScript
- **Backend**: JSP, JDBC
- **Database**: MySQL
- **Architecture**: MVC
- **IDE**: NetBeans
- **Version Control**: Git & GitHub

---

## 🔐 Security
- Session-based authentication
- Separate sessions for Admin and User
- Restricted access to protected pages

---

## 📸 Screens (Optional)
You can add screenshots here later to showcase UI.

---

## 🧑‍💻 Author
**Maitri Khandelwal**  
B.Tech IT Student | Aspiring Data Scientist

---

## ⭐ Future Enhancements
- Online payment gateway integration
- Order tracking (real-time)
- Email notifications
- Better UI animations

---

If you like this project, feel free to ⭐ star the repository!

