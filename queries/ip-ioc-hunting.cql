# Purpose: Hunt for network connections to an IP address identified in threat intelligence.
#
# Instructions:
# 1. Obtain the approved IOC IP from your threat-intelligence source.
# 2. Replace REPLACE_WITH_IOC_IP in the query.
# 3. Set the appropriate Falcon time range.
# 4. Review matching hosts, process details, destination ports, and timestamps.
# 5. Correlate results with related endpoint and network telemetry.

#event_simpleName=NetworkConnectIP4
| RemoteAddressIP4="REPLACE_WITH_IOC_IP"
| table([@timestamp, ComputerName, aid, LocalAddressIP4,
         RemoteAddressIP4, RemotePort, ContextBaseFileName,
         ContextProcessId])
