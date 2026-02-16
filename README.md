# Power BI – Nutritics API Pagination (Cloud Compatible)

This project demonstrates how to connect the Nutritics API to Power BI using native Power Query (M) with pagination, fully compatible with Power BI Service scheduled refresh.

---

## 🎯 Objective

Retrieve all records from the Nutritics API (100 per batch) using a cloud-compatible pagination pattern, while enabling automatic refresh in Power BI Service.

---

## 🚀 What This Project Solves

The Nutritics API:

- Returns only 100 records per request
- Requires pagination to retrieve full datasets

Common Issues:

- Python scripts require a gateway in Power BI Service
- Dynamic URLs break scheduled refresh
- Large datasets risk timeout failures

This implementation solves those problems using a fully cloud-native M Query approach.

---

## 🛠 Implementation Highlights

- Uses `List.Generate` for pagination
- Maintains a static base URL to avoid dynamic data source errors
- Separates query parameters using `Web.Contents` with the `Query` option
- Combines all API batches into a single semantic model table
- Enables scheduled refresh in Power BI Service

---

## ☁ Power BI Service Compatibility

After publishing:

- Configure **Basic Authentication** in Data Source Credentials
- Set Privacy Level to **Organizational**
- Enable Scheduled Refresh

No gateway required.

---

## ⚠ Limitations

- 100 records per API request (API constraint)
- 4-minute timeout per query in Power BI Service
- Large datasets may require incremental refresh

---


