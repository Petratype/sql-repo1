# SQL Health Checks — Mini CRM Dataset

This project is a simple, beginner-friendly SQL practice repo built to simulate a tiny CRM used by SaaS companies.  
It contains a database with **customers**, **subscriptions**, and **support tickets**, plus a few analytical queries.

The goal is to practice:
- basic SQL syntax  
- JOINs  
- filtering  
- understanding CRM/SaaS data models  
- thinking like Tech Support / Implementation roles  

---

## 📁 Files
### `health_checks.sql`
- Creates 3 tables: `customers`, `subscriptions`, `tickets`
- Inserts sample data for practice
- Includes example queries such as:
  - active subscriptions
  - customers with open tickets
  - subscription/ticket cross-referencing (support analytics)
  - churn signals (`inactive` customers)

---

## 🧩 Tables Overview

### `customers`
| column        | type     | description                   |
|---------------|----------|-------------------------------|
| id            | INTEGER  | primary key                   |
| full_name     | TEXT     | customer name                 |
| email         | TEXT     | email address                 |
| signup_date   | TEXT     | ISO date                      |
| status        | TEXT     | active / inactive             |

### `subscriptions`
| column        | type     | description                        |
|---------------|----------|------------------------------------|
| id            | INTEGER  | primary key                        |
| customer_id   | INTEGER  | FK → customers.id                  |
| plan          | TEXT     | basic / pro / enterprise           |
| start_date    | TEXT     | subscription start date            |
| status        | TEXT     | active / cancelled / paused        |

### `tickets`
| column        | type     | description                               |
|---------------|----------|-------------------------------------------|
| id            | INTEGER  | PK                                        |
| customer_id   | INTEGER  | FK → customers.id                         |
| title         | TEXT     | issue title                               |
| status        | TEXT     | open / closed                             |
| created_at    | TEXT     | ticket creation date                      |

---

## 📊 Example Query: Customers With Active Subscriptions & Open Tickets

```sql
SELECT 
    customers.full_name,
    customers.email,
    subscriptions.plan,
    tickets.title AS open_ticket
FROM customers
JOIN subscriptions
    ON customers.id = subscriptions.customer_id
LEFT JOIN tickets
    ON customers.id = tickets.customer_id 
    AND tickets.status = 'open'
WHERE subscriptions.status = 'active';
```

---

## 💡 Purpose of This Project

This repo gives recruiters a concrete example that you:
- know SQL  
- understand basic SaaS data structures  
- can think like someone in Tech Support / RevOps / Implementation  
- can organize a repo in a professional way  

It’s intentionally simple — this is your **first technical step** toward an employable portfolio.
