# Nutritics API Pagination Documentation

## 1. Objective

Implement a native Power Query (M) pagination pattern to retrieve all records (100 per batch) from the Nutritics API, while ensuring full compatibility with Power BI Service scheduled refresh.

---

## 2. Implementation Approach

### Pagination Pattern

The Nutritics API returns a maximum of 100 records per request.

To retrieve all records:

- `List.Generate` is used to iterate through offsets.
- Each iteration fetches the next batch of 100 records.
- The loop stops when the API returns zero records.
- All batches are combined into a single table.

---

### Static Root URL Requirement

To prevent "Dynamic Data Source" errors in Power BI Service:

- The base API URL remains static.
- Query parameters (user, limit, offset) are passed using the `Query` option inside `Web.Contents`.

This ensures:
- Scheduled refresh remains enabled.
- Credentials can be configured in the Service.
- The solution works fully in the cloud.

---

### Source Control (GitHub Strategy)

The report should be saved as a **Power BI Project (.pbip)** instead of a .pbix file.

Benefits:

- Model is split into readable metadata files.
- Enables granular version control.
- Supports structured collaboration.
- Allows proper Git-based change tracking.

---

## 3. Power BI Service Configuration

### Authentication

After publishing:

- Go to **Semantic Model Settings**
- Open **Data Source Credentials**
- Select **Basic Authentication**
- Store Nutritics API credentials securely

Credentials are not stored inside the M code.

---

### Privacy Levels

Set Privacy Level to:

- **Organizational**

This allows the cloud engine to execute pagination logic successfully during refresh.

---

### Scheduled Refresh

- Enable scheduled refresh in Power BI Service.
- Be aware of the **4-minute timeout per query** enforced by the service.

If the dataset is large, refresh duration must stay within this limit.

---

## 4. Maintenance & Governance

### Incremental Refresh

For datasets exceeding 10,000 records:

- Implement `RangeStart` and `RangeEnd` parameters.
- Refresh only new or modified data.
- Reduce refresh time and resource consumption.

---

### Performance Validation

Before pushing changes to the production branch:

- Use **Performance Analyzer** in Power BI Desktop.
- Validate query execution time.
- Ensure refresh stability.

---

## Summary

This implementation:

- Uses native Power Query (M)
- Avoids gateway dependency
- Supports cloud scheduled refresh
- Handles API pagination
- Enables Git-based version control
- Follows scalable BI governance practices

