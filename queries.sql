-- High Failed Logins
SELECT session_id, failed_logins
FROM cybersecurity_intrusion_data
WHERE failed_logins > 3;

-- Suspicious IP Reputation
SELECT session_id, ip_reputation_score
FROM cybersecurity_intrusion_data
WHERE ip_reputation_score < 0.3;

-- Unusual Time Access
SELECT session_id
FROM cybersecurity_intrusion_data
WHERE unusual_time_access = 1;

-- Combine All Suspicious Signals
SELECT session_id,
       failed_logins,
       ip_reputation_score,
       unusual_time_access
FROM cybersecurity_intrusion_data
WHERE failed_logins > 3
   OR ip_reputation_score < 0.3
   OR unusual_time_access = 1;
   
   -- Risk Score Calculation
   SELECT session_id,
       (failed_logins * 2 +
        (1 - ip_reputation_score) * 5 +
        unusual_time_access * 3) AS risk_score
FROM cybersecurity_intrusion_data
ORDER BY risk_score DESC
LIMIT 10;

SELECT protocol_type, COUNT(*) AS attacks
FROM cybersecurity_intrusion_data
WHERE attack_detected = 1
GROUP BY protocol_type
ORDER BY attacks DESC;

-- 1. Risk Categorization
SELECT session_id,
       (failed_logins * 2 +
        (1 - ip_reputation_score) * 5 +
        unusual_time_access * 3) AS risk_score,
       CASE
           WHEN (failed_logins * 2 + (1 - ip_reputation_score) * 5 + unusual_time_access * 3) > 8 THEN 'High Risk'
           WHEN (failed_logins * 2 + (1 - ip_reputation_score) * 5 + unusual_time_access * 3) > 4 THEN 'Medium Risk'
           ELSE 'Low Risk'
       END AS risk_level
FROM cybersecurity_intrusion_data
ORDER BY risk_score DESC
limit  20;

-- 2. window function
SELECT session_id,
       (failed_logins * 2 +
        (1 - ip_reputation_score) * 5 +
        unusual_time_access * 3) AS risk_score,
       RANK() OVER (ORDER BY 
           (failed_logins * 2 +
            (1 - ip_reputation_score) * 5 +
            unusual_time_access * 3) DESC
       ) AS risk_rank
FROM cybersecurity_intrusion_data;


-- 3. Attack Percentage by Protocol
SELECT protocol_type,
       COUNT(*) AS total,
       SUM(attack_detected) AS attacks,
       (SUM(attack_detected) * 100.0 / COUNT(*)) AS attack_percentage
FROM cybersecurity_intrusion_data
GROUP BY protocol_type
ORDER BY attack_percentage DESC;

-- 4. Aggregated Risk Summary
SELECT 
    CASE
        WHEN failed_logins > 3 THEN 'Brute Force Risk'
        WHEN ip_reputation_score < 0.3 THEN 'Malicious IP'
        WHEN unusual_time_access = 1 THEN 'Odd Timing'
        ELSE 'Normal'
    END AS risk_type,
    COUNT(*) AS total_sessions
FROM cybersecurity_intrusion_data
GROUP BY risk_type;