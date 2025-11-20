# 📁 Stuffed Lamb Folder Structure

**Clear, organized structure for easy navigation**

---

## 🎯 Quick Start Files (In Root)

```
📄 HOW_TO_START.md          ← READ THIS FIRST! Complete startup guide
📄 START_SIMPLE.bat         ← Windows: Double-click for simple server
📄 START_SIMPLE.sh          ← Linux/Mac: Run for simple server
📄 START_WITH_VAPI.bat      ← Windows: Double-click for VAPI + ngrok
📄 START_WITH_VAPI.sh       ← Linux/Mac: Run for VAPI + ngrok
📄 README.md                ← Project overview and documentation
📄 run.py                   ← Direct Python entry point
```

---

## 📂 Main Folders

### 🔧 `/scripts/` - All Utility Scripts
```
scripts/
├── README.md                   ← Documentation for all scripts
├── start.sh                    ← Simple startup (Linux/Mac)
├── start.bat                   ← Simple startup (Windows)
├── start-complete.sh           ← Full startup with ngrok (Linux/Mac)
├── start-with-ngrok.bat        ← Full startup with ngrok (Windows)
├── stop.sh                     ← Stop all services (Linux/Mac)
├── stop.bat                    ← Stop all services (Windows)
├── verify_setup.sh             ← System configuration check
└── healthcheck.py              ← Health monitoring script
```

**Note:** All scripts work from ANY location (root or scripts folder)

---

### 📊 `/data/` - Business Data
```
data/
├── menu.json                   ← Menu items, prices, modifiers
├── business.json               ← Business details & contact info
├── hours.json                  ← Operating hours
├── rules.json                  ← Business rules & policies
├── pronunciations.json         ← Voice assistant pronunciations
└── orders.db                   ← SQLite database (auto-created)
```

---

### ⚙️ `/config/` - VAPI Configuration
```
config/
├── vapi-tools.json            ← 18 VAPI tool definitions
├── system-prompt.md           ← AI assistant system prompt
└── VAPI_SETUP.md              ← VAPI integration guide
```

---

### 💻 `/stuffed_lamb/` - Core Application
```
stuffed_lamb/
├── __init__.py                ← Package initialization
└── server.py                  ← Main Flask server (27,880 lines!)
```

---

### 🧪 `/tests/` - Test Suite
```
tests/
└── test_stuffed_lamb_system.py  ← 34 comprehensive tests
```

**Run tests:**
```bash
pytest tests/test_stuffed_lamb_system.py -v
```

---

### 📚 `/docs/` - Documentation
```
docs/
├── README.md                   ← Documentation index
├── QUICK_START.md              ← 10-minute setup guide
├── STARTUP_GUIDE.md            ← All startup options
├── PRODUCTION_DEPLOYMENT.md    ← Deploy to production
├── ENV_SETUP_GUIDE.md          ← Environment variables
├── SETUP_CHECKLIST.md          ← Complete setup checklist
├── SYSTEM_STATUS_REPORT.md     ← System overview
└── ACTION_REQUIRED.md          ← Setup action items
```

---

### 🚀 `/deployment/` - Deployment Files
```
deployment/
└── stuffed-lamb.service        ← Systemd service file (Linux)
```

---

### 📦 `/_archive/` - Archived Files
```
_archive/
├── README.md                   ← Explains archived files
├── examples/                   ← VAPI SDK examples (reference)
├── templates/                  ← Old templates (redundant)
├── test_reports/               ← Old test results
└── requirements-vapi.txt       ← Old requirements file
```

**Can be safely deleted** - not needed for operation

---

### 📝 `/logs/` - Log Files
```
logs/
└── stuffed_lamb.log           ← Application logs (auto-created)
```

**Ignored by git** - safe to delete anytime

---

## 🔑 Configuration Files (Root)

```
📄 .env                         ← YOUR CONFIGURATION (not in git!)
📄 .env.example                 ← Template for .env
📄 requirements.txt             ← Python dependencies
📄 Dockerfile                   ← Docker image definition
📄 docker-compose.yml           ← Docker Compose config
📄 .gitignore                   ← Git ignore rules
📄 .dockerignore                ← Docker ignore rules
```

**IMPORTANT:** `.env` contains your Twilio credentials - never commit to git!

---

## 📋 Report Files (Root)

```
📄 SYSTEM_AUDIT_REPORT.md       ← Complete system audit (Nov 20)
📄 PRODUCTION_READINESS_REPORT.md ← Production deployment status
📄 FOLDER_STRUCTURE.md          ← This file
```

---

## 🎯 Complete Structure Visual

```
stuffed-lamb-standalone/
│
├── 🚀 LAUNCHERS (Start here!)
│   ├── HOW_TO_START.md              ← ⭐ READ THIS FIRST
│   ├── START_SIMPLE.bat             ← Windows simple start
│   ├── START_SIMPLE.sh              ← Linux/Mac simple start
│   ├── START_WITH_VAPI.bat          ← Windows with VAPI
│   ├── START_WITH_VAPI.sh           ← Linux/Mac with VAPI
│   └── run.py                       ← Direct Python start
│
├── 📂 FOLDERS
│   ├── scripts/                     ← All utility scripts
│   ├── data/                        ← Business data (5 JSON files)
│   ├── config/                      ← VAPI configuration
│   ├── stuffed_lamb/                ← Core application code
│   ├── tests/                       ← Test suite (34 tests)
│   ├── docs/                        ← Documentation (8 guides)
│   ├── deployment/                  ← Deployment files
│   ├── logs/                        ← Log files (auto-created)
│   └── _archive/                    ← Archived files (optional)
│
├── ⚙️ CONFIGURATION
│   ├── .env                         ← Your secrets (not in git)
│   ├── .env.example                 ← Template
│   ├── requirements.txt             ← Dependencies
│   ├── Dockerfile                   ← Docker image
│   └── docker-compose.yml           ← Docker Compose
│
├── 📚 DOCUMENTATION
│   ├── README.md                    ← Project overview
│   ├── HOW_TO_START.md              ← Startup guide
│   ├── FOLDER_STRUCTURE.md          ← This file
│   ├── SYSTEM_AUDIT_REPORT.md       ← System audit
│   └── PRODUCTION_READINESS_REPORT.md ← Deployment status
│
└── 🔧 CONFIGURATION FILES
    ├── .gitignore                   ← Git ignore rules
    └── .dockerignore                ← Docker ignore rules
```

---

## 🎯 Where to Find Things

### **Need to start the system?**
→ Use `START_SIMPLE.bat` or `START_SIMPLE.sh`

### **Need VAPI integration?**
→ Use `START_WITH_VAPI.bat` or `START_WITH_VAPI.sh`

### **Need to configure settings?**
→ Edit `.env` file in root

### **Need to update menu/prices?**
→ Edit `data/menu.json`

### **Need to change hours?**
→ Edit `data/hours.json`

### **Need documentation?**
→ Check `docs/` folder or `README.md`

### **Need to run tests?**
→ `pytest tests/test_stuffed_lamb_system.py -v`

### **Need to check logs?**
→ `logs/stuffed_lamb.log`

### **Need deployment info?**
→ `docs/PRODUCTION_DEPLOYMENT.md`

---

## 📊 File Count Summary

| Category | Count | Examples |
|----------|-------|----------|
| **Launcher Scripts** | 5 | START_SIMPLE.bat, run.py |
| **Utility Scripts** | 8 | start.sh, stop.bat, verify_setup.sh |
| **Data Files** | 5 | menu.json, business.json, hours.json |
| **Config Files** | 3 | vapi-tools.json, system-prompt.md |
| **Python Code** | 4 | server.py, run.py, tests, healthcheck |
| **Documentation** | 12 | README.md, HOW_TO_START.md, docs/* |
| **Deployment** | 3 | Dockerfile, docker-compose.yml, .service |

**Total Production Files:** ~40 files
**Archive Files:** 7 files (can be deleted)

---

## 🧹 Organization Improvements (Nov 20, 2025)

### **What Changed:**

1. ✅ **Fixed Path Issues**
   - All scripts now change to project root first
   - Scripts work from ANY location (root or scripts/)
   - No more ".env not found" errors!

2. ✅ **Renamed Launchers**
   - `start.bat` → `START_SIMPLE.bat` (clearer purpose)
   - `start.sh` → `START_SIMPLE.sh`
   - Added `START_WITH_VAPI.*` for ngrok setup

3. ✅ **Added Documentation**
   - `HOW_TO_START.md` - Complete startup guide
   - `scripts/README.md` - Script documentation
   - `FOLDER_STRUCTURE.md` - This file

4. ✅ **Cleaned Archive**
   - Moved redundant files to `_archive/`
   - Documented what's archived and why
   - Safe to delete archive folder

### **Result:**
- ✅ Crystal clear structure
- ✅ Easy to navigate
- ✅ Scripts work from anywhere
- ✅ Well documented
- ✅ Production ready

---

## ✅ Best Practices

### **DON'T commit to git:**
- `.env` (contains secrets)
- `logs/*.log` (generated files)
- `data/orders.db` (database)
- `__pycache__/` (Python cache)

### **DO back up regularly:**
- `.env` (your configuration)
- `data/orders.db` (your orders)
- Custom changes to `data/*.json`

### **Keep updated:**
- `requirements.txt` (dependencies)
- `data/*.json` (menu, hours, prices)
- `.env` (credentials, settings)

---

**Questions?** Check `HOW_TO_START.md` or `README.md` for help!
