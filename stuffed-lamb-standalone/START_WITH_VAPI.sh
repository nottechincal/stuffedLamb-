#!/bin/bash
# ===================================================================
# VAPI LAUNCHER - Starts server + ngrok tunnel
# ===================================================================
# This starts the FULL system with ngrok for VAPI integration
# Perfect for: Testing VAPI voice calls, production testing
# Requires: ngrok installed (https://ngrok.com/download)
# ===================================================================
cd "$(dirname "$0")"
exec ./scripts/start-complete.sh
