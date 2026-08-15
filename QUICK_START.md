# Quick Start Guide - Food Delivery System

## What Was Fixed

### 🔧 Main Issues Resolved:
1. **Orders not in Firebase** → ✅ Now saves to both MySQL AND Firebase
2. **Reviews not in Firebase** → ✅ Now saves to both MySQL AND Firebase  
3. **No star rating UI** → ✅ Added interactive 5-star rating system
4. **No restaurant reviews display** → ✅ Shows reviews on menu page

---

## How to Use

### 1️⃣ Place an Order
```
Home → Select Restaurant → View Menu → Select Item → Click "Order Now" → Confirm
```
✓ Order appears in MySQL: `SELECT * FROM Orders;`
✓ Order appears in Firestore: Check "Orders" collection

### 2️⃣ Write a Review
```
Reviews Page → Select Restaurant → Click Stars to Rate (1-5) → Write Comment → Submit
```
✓ Review appears in MySQL: `SELECT * FROM Reviews;`
✓ Review appears in Firestore: Check "Reviews" collection

### 3️⃣ View Reviews
```
Menu Page → See average rating at top → View all reviews → Click "Write a Review"
OR
Reviews Page → See all reviews from all restaurants
```

---

## Star Rating System

**How it works:**
- 🟡 Hover over stars to preview rating
- 🟡 Click star to select rating (1-5)
- 🟡 Selected rating shows as "X / 5 Stars"
- 🟡 Filled stars (★) = selected, Empty stars (☆) = unselected

**Example:**
```
Click on 4th star → Shows 4★☆ (4/5 Stars selected)
```

---

## Database Check Commands

### MySQL:
```sql
-- Check Orders
SELECT * FROM Orders;

-- Check Reviews  
SELECT * FROM Reviews;

-- See all orders with details
SELECT o.order_id, u.name, r.name as restaurant, o.total_amount, o.created_at 
FROM Orders o
JOIN Users u ON o.user_id = u.user_id
JOIN Restaurants r ON o.restaurant_id = r.restaurant_id;

-- See all reviews with details
SELECT r.id, u.name as user, rst.name as restaurant, r.rating, r.review_text, r.created_at
FROM Reviews r
JOIN Users u ON r.user_id = u.user_id
JOIN Restaurants rst ON r.restaurant_id = rst.restaurant_id;
```

### Firebase Firestore:
1. Open Firebase Console
2. Go to "Firestore Database"
3. Check these collections:
   - **Orders** → All orders with full details
   - **Order_Activity_Log** → Order activity log
   - **Reviews** → All reviews with ratings

---

## Backend Routes

### Orders:
- `POST /order` → Place new order (saved to MySQL + Firestore)

### Reviews:
- `POST /reviews/add` → Add new review (saved to MySQL + Firestore)
- `GET /reviews/all` → Get all reviews from all restaurants
- `GET /reviews/restaurant/:restaurant_id` → Get reviews for specific restaurant

---

## Files Changed

### Backend:
✓ `backend/routes/orders.js` - Now saves to Firestore
✓ `backend/routes/reviews.js` - Now saves to Firestore + added restaurant filter

### Frontend:
✓ `frontend/reviews.html` - Complete redesign with star ratings
✓ `frontend/menu.html` - Added restaurant info and reviews summary
✓ `frontend/style.css` - Enhanced styling

---

## Troubleshooting

### Orders not in Firestore?
```
1. Check Firebase credentials in backend/nosql/serviceAccountKey.json
2. Restart backend server
3. Check browser console for errors
4. Check backend console logs for "Order saved to Firestore"
```

### Reviews not in Firestore?
```
1. Same as above - check credentials and restart
2. Ensure rating is selected (1-5 stars)
3. Ensure review text is not empty
4. Check backend console for "Review saved to Firestore"
```

### Stars not showing on reviews page?
```
1. Clear browser cache (Ctrl+Shift+Delete)
2. Hard refresh page (Ctrl+F5)
3. Restart browser
```

### Menu page not showing restaurant info?
```
1. Ensure you're accessing menu.html with ?restaurant_id= parameter
2. Check browser console for errors
3. Verify /reviews/restaurant/:id endpoint is working
```

---

## Testing Checklist

- [ ] Create new order and see it in MySQL Orders table
- [ ] Create new order and see it in Firestore Orders collection
- [ ] Write a review with 5-star rating
- [ ] See review in MySQL Reviews table
- [ ] See review in Firestore Reviews collection
- [ ] Check menu page shows restaurant rating
- [ ] Click on restaurants and see review summaries
- [ ] Submit multiple reviews and see average rating update
- [ ] Verify form validation works (can't submit without rating/review)

---

## Architecture

```
┌─────────────┐
│   Frontend  │ (HTML/CSS/JS)
├─────────────┤
    │
    ├─→ Reviews.html (Star Rating UI) ──→ POST /reviews/add
    ├─→ Menu.html (Restaurant Info) ────→ GET /reviews/restaurant/:id
    └─→ Order.html ─────────────────────→ POST /order
    
┌─────────────────────────────────────┐
│      Backend (Express.js)           │
├─────────────────────────────────────┤
│  routes/orders.js                   │
│  routes/reviews.js                  │
├─────────────────────────────────────┤
    │
    ├─→ MySQL Database ──→ Orders, Reviews tables
    └─→ Firebase Firestore ──→ Orders, Reviews collections
```

---

## Next Steps (Optional Enhancements)

1. Add user review editing/deletion
2. Add review moderation/approval
3. Implement review sorting (newest, highest rated, etc.)
4. Add photos to reviews
5. Add email notifications for orders
6. Add order tracking status updates
7. Add admin dashboard to view all orders/reviews
8. Add rating filters on menu page

---

**All fixes are live and ready to test!** 🚀
