#!/bin/bash
# ===================================================================
# SIMPLE LAUNCHER - Starts server only (no ngrok)
# ===================================================================
# This is the SIMPLEST way to start the Stuffed Lamb server
# Perfect for: Local testing, API development
# NOT for: VAPI integration (needs ngrok - use START_WITH_VAPI.sh)
# ===================================================================
cd "$(dirname "$0")"
exec ./scripts/start.sh
