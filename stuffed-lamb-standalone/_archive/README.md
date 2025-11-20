# Archive Folder

This folder contains files that have been archived during the system cleanup process.

## Contents

### `/examples/vapi_examples/`
VAPI SDK example files showing different integration patterns:
- `basic_example.py` - Basic VAPI Python SDK usage
- `flask_example.py` - Flask integration example
- `fastapi_example.py` - FastAPI integration example

**Why archived:** These are example/reference files not needed for production. The actual implementation is in `stuffed_lamb/server.py`.

### `/templates/`
Alternative environment configuration templates:
- `.env.CORRECTED` - Alternative .env template

**Why archived:** Redundant with `.env.example` in the root directory. The root `.env.example` is the canonical template.

### `/test_reports/`
Archived test report files:
- `test_comprehensive_report.json` - Previous test run results

**Why archived:** Test reports can be regenerated on-demand by running `pytest tests/ -v`. Historical reports are not needed for system operation.

### `requirements-vapi.txt`
Python dependencies specific to VAPI SDK integration examples.

**Why archived:** The main `requirements.txt` contains all necessary dependencies for the production system. This file was only needed for the example files.

## Restoration

If you need any of these files, you can restore them by:
1. Copying the file(s) back to their original location
2. For example files, reference them as documentation but they're not needed for operation

## Clean Up

This folder can be safely deleted if you don't need these reference files. The system will continue to function normally without them.

---

**Archive Date:** 2025-11-20
**Archived By:** System audit and cleanup process
