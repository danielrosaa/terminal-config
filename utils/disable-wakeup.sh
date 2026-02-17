#!/bin/bash
for dev in $(awk '/enabled/{print $1}' /proc/acpi/wakeup); do
  echo "$dev" > /proc/acpi/wakeup
done
