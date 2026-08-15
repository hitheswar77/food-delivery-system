# Food Delivery System 🍔🍕

<div align="center">
  <h3>A Full-Stack Food Delivery Application with Real-time Order Tracking and Redundant Data Storage</h3>
</div>

---

## 📖 Overview

The **Food Delivery System** is a modern, responsive web application that bridges the gap between food lovers and their favorite local restaurants. It provides a seamless ordering experience with dual-database architecture for enterprise-grade redundancy (MySQL for structured ACID transactions and Firebase Firestore for real-time document storage).

---

## ✨ Features

- **Dual-Database Syncing**: Orders and reviews are committed synchronously to both MySQL and Firebase Firestore to ensure fault tolerance.
- **Location-based Discovery**: Filter and explore restaurants based on real-time location mapping.
- **Interactive Menu & Ordering**: Dynamic cart and instant order placement with automatic order ID generation.
- **5-Star Review System**: Optimistic UI updates with an intuitive star-rating component for restaurant feedback.
- **Secure Authentication**: Encrypted user credentials and token-based session management.
- **Responsive UI/UX**: Mobile-first design crafted with vanilla CSS grids and smooth transition animations.

---

## 🏗️ Architecture

The system utilizes an N-tier architecture featuring an Express.js REST API layer that interfaces concurrently with SQL and NoSQL persistence tiers. The frontend operates via vanilla JavaScript DOM manipulation and asynchronous API fetching.

![Architecture Diagram](https://via.placeholder.com/800x400/1e1e2d/ffffff?text=System+Architecture+Diagram)

### 🔄 Flow Diagram
![Flow Diagram](https://via.placeholder.com/800x400/1e1e2d/ffffff?text=Data+Flow+Diagram)

---

## 🛠️ Tech Stack

- **Frontend**: HTML5, CSS3, Vanilla JavaScript, Fetch API
- **Backend**: Node.js, Express.js, CORS
- **Database (Relational)**: MySQL
- **Database (NoSQL)**: Google Firebase Firestore
- **Deployment**: Vercel (Serverless Functions & Edge Routing)

---

## ⚙️ Installation

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/hitheswar77/food-delivery-system.git
   cd food-delivery-system
   ```

2. **Install Backend Dependencies**
   ```bash
   cd backend
   npm install
   ```

3. **Configure the Database**
   - Import `backend/sql/setup.sql` into your MySQL server.
   - Place your Firebase `serviceAccountKey.json` inside the `backend/nosql/` directory.
   - Configure your `.env` variables or update `backend/sql/db.js` with your MySQL credentials.

4. **Run the Application**
   ```bash
   node server.js
   ```
   Open `frontend/index.html` in your web browser.

---

## 📁 Project Structure

```text
food-delivery-system/
├── backend/
│   ├── nosql/               # Firebase configuration & queries
│   ├── routes/              # Express API endpoints
│   ├── sql/                 # MySQL connection & SQL scripts
│   ├── package.json         # Node.js dependencies
│   └── server.js            # Express server entry point
├── frontend/
│   ├── index.html           # Location selection & Home
│   ├── menu.html            # Restaurant menu view
│   ├── order.html           # Order confirmation & cart
│   ├── reviews.html         # Review submission & listing
│   ├── login.html           # User authentication (login)
│   ├── signup.html          # User registration
│   └── style.css            # Global stylesheet
├── vercel.json              # Vercel deployment configuration
└── README.md                # Project documentation
```

---

## 📸 Screenshots

### 🏠 Home Page
![Home Page](https://via.placeholder.com/800x400/f5f5f5/333333?text=Home+Page+Screenshot)

### 📈 Output / Dashboard
![Output](https://via.placeholder.com/800x400/f5f5f5/333333?text=Output+Dashboard)

### 🗄️ Database View
![Database](https://via.placeholder.com/800x400/f5f5f5/333333?text=Database+Table+View)

### 📊 Analytics / Charts
![Charts](https://via.placeholder.com/800x400/f5f5f5/333333?text=Analytics+Charts)

### ✅ Results
![Results](https://via.placeholder.com/800x400/f5f5f5/333333?text=Order+Results)

---

## 🚀 Future Scope

- **Real-time Order Tracking**: Integrate Socket.io for live delivery partner tracking on a map.
- **Payment Gateway Integration**: Add Stripe/Razorpay for processing online transactions securely.
- **Admin Dashboard**: Build a React-based admin panel to manage restaurants, users, and oversee orders.
- **AI Recommendations**: Recommend dishes based on past user order history utilizing machine learning models.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## ✍️ Author

**Hitheswar**
- GitHub: [@hitheswar77](https://github.com/hitheswar77)
