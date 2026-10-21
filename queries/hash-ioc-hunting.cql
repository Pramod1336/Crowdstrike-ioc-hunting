# Purpose: Search supported Falcon file telemetry for a known SHA256 hash.
#
# Instructions:
# 1. Obtain the approved SHA256 IOC from your threat-intelligence source.
# 2. Replace REPLACE_WITH_SHA256 in the query.
# 3. Confirm the selected event type contains the required hash field.
# 4. Review matching hosts, file details, and associated process activity.

#event_simpleName=NewExecutableWritten
| SHA256HashData="REPLACE_WITH_SHA256"
| table([@timestamp, ComputerName, aid, SHA256HashData])
