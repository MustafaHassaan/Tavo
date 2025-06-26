# Tavo – Restaurant & Cafe Management System (Backend API)

Tavo is a full-stack system designed to manage restaurants and cafes with multi-zoned areas, tables, staff roles, and user permissions.  
This is the backend API developed using .NET 8 and MongoDB following clean architecture principles.

---

## 🧾 Overview

The system manages:
- Dining Areas (`Places`)
- Tables inside each area
- User roles and permissions
- Authentication & authorization via JWT
- Clean separation of concerns using Clean Architecture

---

## ⚙️ Tech Stack

- **Framework**: ASP.NET Core 8 Web API  
- **Database**: MongoDB  
- **Architecture**: Clean Architecture (Domain, Application, Infrastructure, API)  
- **Auth**: JWT-based Authentication with Role-based Authorization  
- **Validation**: FluentValidation  
- **Testing**: xUnit (planned)

---

## 📂 Main Modules

- 🔐 Auth (Register, Login, Google/Facebook login)  
- 🧑‍💼 Users with Roles & Claims  
- 🪑 Places (Dining areas like zones or sections)  
- 🍽️ Tables (Assigned to specific places)  
- 🧾 Basic CRUD for all entities  
- 🔄 API versioning + Swagger

---

## 🧠 Highlights

- Follows SOLID and Clean Code principles  
- MongoDB for flexible document-based storage  
- Unit of Work pattern applied for repositories  
- Ready for integration with frontend clients (e.g. .NET MAUI)

---

## 🧑‍💻 Developer

**Mostafa Hassan**  
- Full design and implementation  
- Real-world structure used in client-facing systems  
- Extensible and production-ready codebase

---

## 🚧 Next Plans

- POS System module  
- Staff shift tracking  
- Reservations & ordering  
- Dashboard with analytics and charts

