# Food Delivery System - Setup Guide

## Database Setup

### MySQL Setup
1. Open MySQL Command Line or MySQL Workbench
2. Run the SQL setup script:
```bash
mysql -u root -p < backend/sql/setup.sql
```

Or paste the contents of `backend/sql/setup.sql` into MySQL Workbench and execute.

### Firestore Setup
1. Download your Firebase service account key
2. Place it in `backend/nosql/serviceAccountKey.json`

## Running the Application

### Backend
```bash
cd backend
npm install
node server.js
```

### Frontend
Open `frontend/index.html` in a web browser

## API Endpoints

### Authentication
- `POST /auth/signup` - Register new user
- `POST /auth/login` - Login user

### Restaurants
- `GET /restaurants` - Get all restaurants

### Menu
- `GET /menu?restaurant_id=1` - Get menu items for a restaurant

### Orders
- `POST /order` - Place a new order

### Reviews
- `POST /reviews/add` - Add a review (saves to both MySQL and Firestore)
- `GET /reviews/all` - Get all reviews

## Data Storage

All data is now stored in **both** MySQL (SQL) and Firebase Firestore (NoSQL) for redundancy:

- **Orders**: Stored in `Orders` table (MySQL) and `Order_Activity_Log` collection (Firestore)
- **Reviews**: Stored in `Reviews` table (MySQL) and `Reviews` collection (Firestore)
