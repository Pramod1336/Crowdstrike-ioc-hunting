# CrowdStrike Falcon IOC Hunting Guide

## 1. Purpose

This guide provides SOC analysts with a standard workflow for conducting Indicator of Compromise (IOC) hunts using CrowdStrike Falcon Advanced Event Search.

The objective is to identify potentially suspicious endpoint, DNS, network, and file activity associated with indicators obtained from authorized threat-intelligence sources.

## 2. Scope

This guide covers:

- IPv4 address hunting
- Domain and DNS request hunting
- File hash hunting
- Investigation and validation of matching events
- False-positive assessment
- Evidence collection and escalation

This repository contains generic query templates and instructions only. Analysts must obtain IOC values from their approved threat-intelligence sources.

## 3. Prerequisites

Before starting a hunt, ensure that you have:

- Authorized access to the CrowdStrike Falcon console.
- Permission to use Advanced Event Search.
- Access to the relevant endpoint telemetry and historical data.
- An approved threat-intelligence source containing the IOC.
- An appropriate investigation time range.
- Access to related telemetry sources, where available.

## 4. Standard Hunting Workflow

### Step 1: Review the Threat Intelligence

Review the original advisory or intelligence report before executing a query.

Identify:
- IOC type: IP address, domain, or file hash.
- Indicator value.
- Relevant observation period.
- Associated threat or campaign, if documented.
- Source confidence and sharing restrictions.

Do not copy restricted IOC lists or confidential advisory content into this repository.

### Step 2: Select the Appropriate Query

Choose the query based on the indicator type.

| IOC Type | Query File | Primary Objective |
|---|---|---|
| IPv4 address | `queries/ip-ioc-hunting.cql` | Search network connection telemetry |
| Domain | `queries/domain-ioc-hunting.cql` | Search DNS request telemetry |
| File hash | `queries/hash-ioc-hunting.cql` | Search supported file telemetry |

Replace the query placeholder with the approved indicator before execution.

### Step 3: Configure the Search Time Range

Select a time range appropriate to the intelligence report and investigation objective.

Consider:
- When the IOC was first reported.
- The suspected activity period.
- Available telemetry retention.
- The date and time of any reported incident.

If no matching event is returned, consider whether the endpoint was reporting and whether the relevant telemetry was available for the selected period.

### Step 4: Execute the Query

1. Open CrowdStrike Falcon Advanced Event Search.
2. Copy the relevant query template.
3. Replace the IOC placeholder.
4. Set the required time range.
5. Execute the query.
6. Review the returned events and available fields.

Validate the event type, field names, and query behavior in your Falcon environment.

## 5. Investigation and Validation

### A. IP Address Matches

Review the following details where available:

- Event timestamp.
- Hostname and agent ID.
- Local and remote IP addresses.
- Remote port.
- Associated process name and process ID.
- Related network connection events.
- Available firewall, proxy, or network security logs.

Determine whether the event is consistent with the suspected threat activity.

**Important:** A remote IP match alone does not establish whether traffic was inbound or outbound. Confirm direction using appropriate network telemetry and source/destination context.

### B. Domain Matches

Review the following details where available:

- DNS request timestamp.
- Requesting endpoint.
- Queried domain.
- Related process activity.
- Subsequent connections to resolved IP addresses.
- DNS response or resolution information, if available.
- Proxy, firewall, or DNS security logs.

A DNS request does not by itself prove that a connection succeeded or that the endpoint was compromised.

### C. File Hash Matches

Review the following details where available:

- File hash and hash algorithm.
- File name and file path.
- Hostname and agent ID.
- File creation or write events.
- Process execution activity.
- File reputation and supporting threat-intelligence context.
- Related detections and endpoint events.

Confirm that the query uses an event type and hash field supported by the relevant Falcon telemetry.

## 6. False-Positive Assessment

Before classifying a match as malicious, consider:

- Whether the indicator is still valid and relevant.
- Whether the activity is associated with approved business applications.
- Whether the process, user, and host context are expected.
- Whether the indicator is shared by legitimate infrastructure.
- Whether independent telemetry supports the suspected activity.
- Whether the observed behavior matches the threat-intelligence report.

Do not classify activity as benign or malicious based on an IOC match alone.

## 7. Investigation Outcomes

Record an appropriate outcome according to your organization's incident-handling process.

| Outcome | Meaning |
|---|---|
| No Match | No matching events were found within the searched telemetry and time range. |
| Requires Investigation | A match was found, but available evidence is insufficient for a conclusion. |
| False Positive | The activity was reviewed and determined to be legitimate or unrelated to the suspected threat. |
| Confirmed Malicious | Evidence supports that the activity is malicious. |
| Inconclusive | Available telemetry or evidence is insufficient to determine the outcome. |

A no-match result does not guarantee that the endpoint was not affected.

## 8. Evidence and Documentation

For each investigation, document:

- Case or ticket reference.
- Date and time of the hunt, including timezone.
- Threat-intelligence source reference.
- IOC type and value in the approved case-management system.
- Falcon query used.
- Search time range.
- Number of matching events.
- Affected hostnames and agent IDs.
- Relevant process and network details.
- Validation steps and supporting evidence.
- Investigation outcome.
- Analyst notes and escalation actions.

Do not commit customer telemetry, internal host details, credentials, or restricted indicators to this public-facing project.

## 9. Escalation Guidelines

Escalate according to your organization's incident-response procedures when:

- Multiple endpoints show related suspicious activity.
- A suspicious process communicates with a known malicious destination.
- File or process evidence supports suspected malware execution.
- There are indications of persistence, lateral movement, or credential theft.
- The activity affects critical systems or sensitive data.
- Additional containment or response actions may be required.

Preserve relevant evidence and follow the approved authorization process before isolating endpoints, blocking indicators, or deleting files.

## 10. Limitations

- Query results depend on telemetry availability and retention.
- Not all event types contain the same fields.
- A query may return no results if the relevant event was not collected.
- DNS requests, network connections, and file events represent different types of activity.
- A single IOC match is not definitive proof of compromise.
- Validate query syntax and field availability before operational use.

## 11. Security and Information Handling

- Use only authorized threat-intelligence sources.
- Follow applicable Traffic Light Protocol (TLP) and source-sharing restrictions.
- Do not publish restricted indicators or confidential advisory extracts without authorization.
- Keep operational queries free of embedded IOC values.
- Review changes before committing them to the repository.

## 12. Review and Maintenance

Review query templates periodically to ensure compatibility with the current Falcon event schema.

Update documentation when investigation procedures, available telemetry, or organizational response requirements change.
