## IOC Handling

This repository contains generic CrowdStrike Falcon hunting queries and investigation instructions. It does not store threat-intelligence IOC values.

Analysts must obtain approved indicators from their authorized threat-intelligence sources and insert them into the relevant query when performing a hunt.

### Standard Hunting Workflow

1. Review the threat-intelligence advisory and identify relevant indicators.
2. Select the appropriate query based on the indicator type.
3. Insert the indicator into the query placeholder.
4. Select the appropriate time range and execute the query.
5. Validate matches using endpoint, process, DNS, and network telemetry.
6. Record findings and escalate suspicious activity according to SOC procedures.

### Data Handling

- Do not commit restricted IOC lists, confidential advisories, credentials, or customer data.
- Follow the source's information-sharing and TLP restrictions.
- Review all files before committing changes.
- Treat matches as investigation leads; validate before taking response actions.
