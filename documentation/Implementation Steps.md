# Implementation Steps – Nutritics API Pagination in Power BI

This section outlines the exact steps taken to implement API pagination using native Power Query (M).

---

## Step 1 – Create the API Query in Power BI Desktop

1. Open **Power BI Desktop**
2. Go to **Home → Get Data → Blank Query**
3. Open **Advanced Editor**
4. Paste the pagination M script
5. Click **Done**
6. Verify data loads correctly in Preview
7. Click **Close & Apply**

---

## Step 2 – Validate Query Performance

1. Go to **View → Performance Analyzer**
2. Refresh visuals
3. Confirm query execution time is within acceptable limits
4. Ensure no errors occur during pagination

---

## Step 3 – Publish to Power BI Service

1. Click **Home → Publish**
2. Select target Workspace
3. Confirm successful upload

---

## Step 4 – Configure Data Source Credentials (Cloud Setup)

1. Open **Power BI Service**
2. Navigate to the published **Semantic Model**
3. Click **Settings**
4. Open **Data Source Credentials**
5. Select **Basic Authentication**
6. Enter Nutritics API credentials
7. Set Privacy Level to **Organizational**
8. Save

---

## Step 5 – Enable Scheduled Refresh

1. In Semantic Model Settings
2. Open **Scheduled Refresh**
3. Turn refresh **On**
4. Set refresh frequency
5. Save

---

## Step 6 – Validate Cloud Refresh

1. Trigger **Refresh Now**
2. Monitor refresh history
3. Confirm successful execution
4. Check row counts match expected totals

---

## Step 7 – (Optional) Version Control with GitHub

1. Save project as **Power BI Project (.pbip)**
2. Commit changes to Git repository
3. Track model and query changes
4. Push updates to main branch after validation

---

## Final Outcome

- API pagination works
- All records retrieved in batches of 100
- Scheduled refresh enabled
- No gateway required
- Cloud-native implementation complete


