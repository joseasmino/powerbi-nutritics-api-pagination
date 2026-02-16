# Architecture Notes – Nutritics API Integration

## Overview

This project connects the Nutritics API to Power BI using native Power Query (M) logic.

The solution is fully cloud-compatible and does not require:

- Python scripts
- Local execution
- On-premises gateway

All API calls are executed directly by Power BI Service during scheduled refresh.

---

## High-Level Flow

Nutritics API  
→ Power Query (M)  
→ Power BI Desktop  
→ Power BI Service  
→ Scheduled Refresh  

---

## Key Design Decisions

### 1. Native Power Query Instead of Python

Python works locally but requires a gateway in Power BI Service.

Using Power Query (M):

- Removes gateway dependency
- Allows direct cloud refresh
- Keeps implementation fully native to Power BI

---

### 2. Static Base URL

Power BI Service blocks scheduled refresh if the URL is dynamically constructed.

To avoid this:

- The base API URL remains fixed.
- Query parameters (user, limit, offset) are passed separately using the `Query` option in `Web.Contents`.

This ensures:

- Scheduled refresh remains enabled
- Credentials can be configured in Service
- No dynamic data source errors

---

### 3. Pagination Logic

The Nutritics API returns a maximum of 100 records per request.

To retrieve all records:

1. Request first 100 records
2. Increase offset by 100
3. Request next 100 records
4. Continue until the API returns no data
5. Combine all results into one table

This is implemented using `List.Generate`.

---

### 4. Data Transformation

The API returns data in JSON format.

The process:

- Convert JSON to table
- Keep only valid data records
- Expand nested fields into columns
- Combine all batches into a final structured table

The final output is ready for reporting.

---

## Cloud Configuration

After publishing to Power BI Service:

1. Configure **Basic Authentication** under Data Source Credentials.
2. Set Privacy Level to **Organizational**.
3. Enable Scheduled Refresh.

No gateway is required.

---

## Limitations

- API limit: 100 records per request
- Power BI Service timeout: 4 minutes per query
- Very large datasets may require incremental refresh

---

## Future Improvements

- Implement incremental refresh using RangeStart / RangeEnd
- Add monitoring for refresh performance
- Convert to .pbip for better Git version control

---

## Summary

This architecture:

- Is fully cloud-native
- Avoids gateway dependency
- Supports API pagination
- Enables scheduled refresh
- Follows scalable Power BI best practices
