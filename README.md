# 🔐 Cybersecurity Intrusion Detection using SQL

## 📌 Project Overview

This project focuses on detecting cybersecurity threats using SQL-based data analysis. It identifies suspicious login activities, high-risk sessions, and attack patterns using structured queries and risk scoring techniques.

---

## 🎯 Objectives

* Detect anomaly patterns in login sessions
* Identify high-risk users based on behavior
* Analyze attack distribution and protocol vulnerabilities
* Develop a SQL-based risk scoring system

---

## 🗂️ Dataset Description

The dataset contains network session data with features such as:

* Failed login attempts
* IP reputation score
* Protocol type
* Session duration
* Unusual access time
* Attack detection label

---

## ⚙️ Methodology

1. Data imported and cleaned using SQL
2. Performed exploratory analysis using aggregation queries
3. Developed a risk scoring model using SQL expressions
4. Applied advanced SQL techniques:

   * CASE statements
   * Window functions (RANK)
   * Conditional filtering

---

## 🔥 Key SQL Features Used

* JOIN (if applicable)
* GROUP BY & HAVING
* CASE WHEN (risk categorization)
* Window functions (RANK)
* Aggregate functions (COUNT, AVG)

---

## 📊 Key Insights

* High failed login attempts indicate brute-force attacks
* Low IP reputation scores are linked to malicious activity
* Unusual login times correlate with suspicious behavior
* Certain protocols show higher attack frequency

---

## 📈 Visualizations

* Attack Distribution (Pie Chart)
* Risk Score Ranking (Bar Chart)
* Protocol Analysis (Column Chart)

---

## 🧠 Risk Scoring Model

Risk score was calculated using:

(failed_logins * 2 + (1 - ip_reputation_score) * 5 + unusual_time_access * 3)

---

## ⚠️ Limitations

* Static thresholds used for detection
* No real-time monitoring
* No machine learning integration

---

## 🚀 Future Improvements

* Integrate machine learning models
* Build real-time dashboard (Streamlit)
* Implement alert system for high-risk sessions

---

## 🛠️ Tools Used

* MySQL
* Excel (for visualization)

---

## 👩‍💻 Author

Twinkle chauhan

---
