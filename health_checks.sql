-- ===============================================
-- CRM Database - Health Check Queries
-- Author: Petra
-- Description:
-- This file contains basic SQL queries to analyze
-- customers, subscriptions and support tickets.
-- ===============================================

-- 1. View all customers
SELECT * FROM customers;

-- 2. View active subscriptions
SELECT *
FROM subscriptions
WHERE status = 'active';

-- 3. Count of active customers
SELECT COUNT(*) AS active_customers
FROM subscriptions
WHERE status = 'active';

-- 4. Tickets that are still open
SELECT *
FROM tickets
WHERE status = 'open';

-- 5. Join: ticket + customer name
SELECT
  tickets.id AS ticket_id,
  customers.name AS customer_name,
  tickets.title,
  tickets.status,
  tickets.priority
FROM tickets
JOIN customers
  ON tickets.customer_id = customers.id;

-- 6. Count open tickets by priority
SELECT
  priority,
  COUNT(*) AS total
FROM tickets
WHERE status = 'open'
GROUP BY priority;

-- 7. Active customers + their plan
SELECT
  customers.name,
  subscriptions.plan,
  subscriptions.status
FROM customers
JOIN subscriptions
  ON customers.id = subscriptions.customer_id
WHERE subscriptions.status = 'active';

-- 8. Number of tickets per customer
SELECT
  customers.name,
  COUNT(tickets.id) AS ticket_count
FROM customers
LEFT JOIN tickets
  ON customers.id = tickets.customer_id
GROUP BY customers.id;

-- 9. Number of cancelled subscriptions (churn)
SELECT COUNT(*) AS churned_customers
FROM subscriptions
WHERE status = 'cancelled';

-- 10. Active customers that currently have open tickets
SELECT 
  customers.name,
  subscriptions.plan,
  tickets.title AS open_ticket
FROM customers
JOIN subscriptions
  ON customers.id = subscriptions.customer_id
LEFT JOIN tickets
  ON customers.id = tickets.customer_id
  AND tickets.status = 'open'
WHERE subscriptions.status = 'active';
