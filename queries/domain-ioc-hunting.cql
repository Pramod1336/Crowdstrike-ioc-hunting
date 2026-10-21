# Purpose: Hunt for DNS requests associated with a suspicious domain.
#
# Instructions:
# 1. Obtain the approved domain IOC from your threat-intelligence source.
# 2. Replace REPLACE_WITH_IOC_DOMAIN in the query.
# 3. Set the appropriate Falcon time range.
# 4. Review the requesting host and related activity.
# 5. Correlate DNS events with network connections and process telemetry.

#event_simpleName=DnsRequest
| DomainName="REPLACE_WITH_IOC_DOMAIN"
| table([@timestamp, ComputerName, aid, DomainName])
