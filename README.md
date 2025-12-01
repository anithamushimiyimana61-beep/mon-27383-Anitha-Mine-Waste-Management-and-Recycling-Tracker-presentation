#PHASE II
# BPMN
![alt text](<Screenshot 2025-12-01 141521-1.png>)
# Stone Mine Waste Management and Recycling Tracker System

## Overview
The Stone Mine Waste Management and Recycling Tracker System models the process of recording and managing waste generated during stone mining operations. 

## Process Flow

1. **Waste Production**
   - Waste is produced at the mining site.
   - The Mine Site Manager records:
     - Waste type
     - Quantity
     - Proposed disposal method

2. **Decision Point**
   - The system determines whether the waste is recyclable.

3. **If Recyclable**
   - Recycling Supervisor records:
     - Recycled quantity
     - Recycling date

4. **If Not Recyclable**
   - Environmental Officer validates the final disposal method.

5. **System Validation and Logging**
   - All actions are validated by the system.
   - All entries are stored in the database with audit logs for:
     - Accountability
     - Environmental compliance

6. **Reporting**
   - Management and auditors can access reports to:
     - Analyze waste trends
     - Evaluate recycling efficiency
     - Monitor compliance status

## Benefits
- Supports effective decision-making
- Ensures regulatory compliance
- Promotes sustainable stone mining practices
- Provides accurate data collection and analytics

- -----------------
# ER DIAGRAM SCREENSHOT
![alt text](<Screenshot 2025-12-01 135611.png>)
#  Data Dictionary
## Mine Waste Management and Recycling Tracker System

---

## Table: MINE_SITE_MANAGER

| Column Name | Data Type | Constraints | Description |
|------------|----------|------------|-------------|
| MANAGER_ID | NUMBER(10) | PK, NOT NULL | Unique identifier for mine site manager |
| NAME | VARCHAR2(100) | NOT NULL | Full name of the manager |
| CONTACT | VARCHAR2(50) | UNIQUE | Contact information |
| CREATED_AT | DATE | DEFAULT SYSDATE | Record creation date |

---

## Table: MINE_SITE

| Column Name | Data Type | Constraints | Description |
|------------|----------|------------|-------------|
| SITE_ID | NUMBER(10) | PK, NOT NULL | Unique identifier for mine site |
| SITE_NAME | VARCHAR2(100) | NOT NULL | Mining site name |
| LOCATION | VARCHAR2(150) | NOT NULL | Location of mine site |
| MANAGER_ID | NUMBER(10) | FK → MINE_SITE_MANAGER | Assigned manager |
| CREATED_AT | DATE | DEFAULT SYSDATE | Record creation date |

---

## Table: WASTE

| Column Name | Data Type | Constraints | Description |
|------------|----------|------------|-------------|
| WASTE_ID | NUMBER(10) | PK, NOT NULL | Unique waste identifier |
| SITE_ID | NUMBER(10) | FK → MINE_SITE | Mine site producing waste |
| WASTE_TYPE | VARCHAR2(50) | NOT NULL | Type of waste |
| QUANTITY | NUMBER(10,2) | CHECK (>0) | Quantity generated |
| DATE_RECORDED | DATE | NOT NULL | Date waste recorded |
| IS_RECYCLABLE | CHAR(1) | CHECK (Y,N) | Recyclable indicator |
| CREATED_AT | DATE | DEFAULT SYSDATE | Record creation date |

---

## Table: RECYCLING_SUPERVISOR

| Column Name | Data Type | Constraints | Description |
|------------|----------|------------|-------------|
| SUPERVISOR_ID | NUMBER(10) | PK, NOT NULL | Supervisor identifier |
| NAME | VARCHAR2(100) | NOT NULL | Supervisor name |
| CONTACT | VARCHAR2(50) | UNIQUE | Contact information |
| CREATED_AT | DATE | DEFAULT SYSDATE | Record creation date |

---

## Table: RECYCLING

| Column Name | Data Type | Constraints | Description |
|------------|----------|------------|-------------|
| RECYCLING_ID | NUMBER(10) | PK, NOT NULL | Recycling record ID |
| WASTE_ID | NUMBER(10) | FK → WASTE, UNIQUE | Waste being recycled |
| SUPERVISOR_ID | NUMBER(10) | FK → RECYCLING_SUPERVISOR | Responsible supervisor |
| RECYCLED_QUANTITY | NUMBER(10,2) | CHECK (>0) | Quantity recycled |
| RECYCLE_DATE | DATE | NOT NULL | Recycling date |
| CREATED_AT | DATE | DEFAULT SYSDATE | Record creation date |

---

## Table: ENVIRONMENTAL_OFFICER

| Column Name | Data Type | Constraints | Description |
|------------|----------|------------|-------------|
| OFFICER_ID | NUMBER(10) | PK, NOT NULL | Officer identifier |
| NAME | VARCHAR2(100) | NOT NULL | Officer name |
| CONTACT | VARCHAR2(50) | UNIQUE | Contact details |
| DEPARTMENT | VARCHAR2(100) | NOT NULL | Department |
| CREATED_AT | DATE | DEFAULT SYSDATE | Record creation date |

---

## Table: WASTE_DISPOSAL

| Column Name | Data Type | Constraints | Description |
|------------|----------|------------|-------------|
| DISPOSAL_ID | NUMBER(10) | PK, NOT NULL | Disposal record ID |
| WASTE_ID | NUMBER(10) | FK → WASTE, UNIQUE | Waste disposed |
| OFFICER_ID | NUMBER(10) | FK → ENVIRONMENTAL_OFFICER | Validating officer |
| DISPOSAL_METHOD | VARCHAR2(100) | NOT NULL | Disposal method |
| DISPOSAL_DATE | DATE | NOT NULL | Disposal date |
| CREATED_AT | DATE | DEFAULT SYSDATE | Record creation date |

---

## Table: AUDIT_LOG
> Logical relationship only (no foreign key constraints)

| Column Name | Data Type | Constraints | Description |
|------------|----------|------------|-------------|
| AUDIT_ID | NUMBER(10) | PK, NOT NULL | Audit entry ID |
| USER_ID | NUMBER(10) | NOT NULL | User who performed action |
| USER_ROLE | VARCHAR2(50) | NOT NULL | User role |
| ACTION_TYPE | VARCHAR2(10) | CHECK (INSERT, UPDATE, DELETE) | Action type |
| TABLE_NAME | VARCHAR2(50) | NOT NULL | Target table |
| ACTION_DATE | DATE | DEFAULT SYSDATE | Action timestamp |
| STATUS | VARCHAR2(20) | CHECK (SUCCESS, DENIED) | Action status |
| ERROR_MESSAGE | VARCHAR2(255) | NULL | Error information |


## Normalization

The database design follows Third Normal Form (3NF):

### First Normal Form (1NF)
- All attributes contain atomic values.
- No repeating groups exist.

### Second Normal Form (2NF)
- All non-key attributes depend fully on the primary key.
- No partial dependencies present.

### Third Normal Form (3NF)
- No transitive dependencies.
- Each non-key attribute depends only on the primary key.

This ensures minimal redundancy and data integrity.

## Assumptions

1. Each waste record belongs to exactly one mine site.
2. Waste can be either recyclable or non-recyclable.
3. Recyclable waste is processed only once.
4. Non-recyclable waste has one disposal record.
5. Each mine site has one assigned manager.
6. Audit logs maintain historical data and do not enforce foreign key constraints.
7. Users are identified by role and ID during auditing.

# Business Intelligence (BI) Considerations
## Mine Waste Management and Recycling Tracker System

---

## 1. BI Objective
The Business Intelligence component of the Mine Waste Management and Recycling Tracker
aims to support management decision-making by providing analytical insights on waste
generation, recycling efficiency, environmental compliance, and user activity.

---

## 2. Fact and Dimension Tables

### Fact Table
- **WASTE**
  - Stores measurable quantities of waste.
  - Contains time-based and site-based metrics.
  - Supports aggregation and trend analysis.

### Dimension Tables
- **MINE_SITE**
  - Enables analysis by mining location.
- **WASTE_TYPE** (derived from WASTE)
  - Enables categorization of waste types.
- **TIME** (derived from DATE_RECORDED, RECYCLE_DATE, DISPOSAL_DATE)
  - Supports daily, monthly, and yearly trends.
- **USER_ROLE**
  - Supports analysis of system activity by role.
- **RECYCLING_SUPERVISOR**
- **ENVIRONMENTAL_OFFICER**

---

## 3. Key Performance Indicators (KPIs)

- Total waste generated per mine site
- Percentage of recyclable vs non-recyclable waste
- Recycling rate per period (monthly, quarterly)
- Disposal methods distribution
- Average time between waste generation and recycling
- Number of rejected transactions due to business rules
- User activity frequency by role

---

## 4. Analytics Opportunities

- Trend analysis of waste generation over time
- Comparison of recycling performance between mine sites
- Monitoring environmental compliance
- Identification of high-risk sites with low recycling rates
- Audit-based analysis of denied vs successful transactions

---

## 5. Aggregation & Reporting Levels

- Daily, monthly, and yearly waste summaries
- Site-level and organization-level reports
- Role-based performance reports
- Compliance and audit reports

---

## 6. Audit & Compliance Analytics

The AUDIT_LOG table enables:
- Monitoring of forbidden operations
- Detection of policy violations
- Tracking of user behavior trends
- Compliance reporting for environmental authorities

Logical relationships are used to preserve historical audit data.

---

## 7. BI Readiness
The logical database design supports BI implementation through:
- Clear separation of fact and dimension data
- Time-based analysis support
- Scalable aggregation structures
- Compatibility with Oracle analytics and dashboard tools

