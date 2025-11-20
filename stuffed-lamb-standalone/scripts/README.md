# Scripts Folder

This folder contains all the startup and utility scripts for the Stuffed Lamb system.

---

## 🚀 Startup Scripts

### **For Simple Testing:**

| Script | Platform | Description |
|--------|----------|-------------|
| `start.sh` | Linux/Mac | Simple server startup (no ngrok) |
| `start.bat` | Windows | Simple server startup (no ngrok) |

**What they do:**
- ✅ Check `.env` exists
- ✅ Check Python installed
- ✅ Install dependencies
- ✅ Start server on http://localhost:8000

**Run from project root or scripts folder** - they work from anywhere!

---

### **For VAPI Integration:**

| Script | Platform | Description |
|--------|----------|-------------|
| `start-complete.sh` | Linux/Mac | Full startup with ngrok |
| `start-with-ngrok.bat` | Windows | Full startup with ngrok |

**What they do:**
- ✅ Everything from simple startup
- ✅ Start Redis if available (optional)
- ✅ Launch ngrok tunnel
- ✅ Display public webhook URL
- ✅ Open ngrok dashboard

**Requires:** ngrok installed and in PATH

---

## 🛑 Stop Scripts

| Script | Platform | Description |
|--------|----------|-------------|
| `stop.sh` | Linux/Mac | Stop all services |
| `stop.bat` | Windows | Stop all services |

**What they do:**
- Kills the Python server
- Kills ngrok (if running)
- Kills Redis (if started by script)

---

## 🔧 Utility Scripts

| Script | Platform | Description |
|--------|----------|-------------|
| `verify_setup.sh` | Linux/Mac | Verify system configuration |
| `healthcheck.py` | All | Check server health |

### `verify_setup.sh`
Comprehensive system check:
- Checks Python version
- Verifies .env file
- Tests dependencies
- Validates menu data
- Checks Redis (optional)

### `healthcheck.py`
Quick health check:
- Tests http://localhost:8000/health
- Shows server status
- Can be used for monitoring

---

## 📝 Important Notes

### All scripts now work from ANY location!

**Before the fix:**
```bash
cd scripts
./start.bat   # ❌ Would fail - couldn't find .env
```

**After the fix:**
```bash
cd scripts
./start.bat   # ✅ Works! Changes to parent directory first
```

**Or from project root:**
```bash
./scripts/start.bat   # ✅ Also works!
```

### Path Resolution

All startup scripts now include:

**Windows (batch files):**
```batch
cd /d "%~dp0\.."
```

**Linux/Mac (shell scripts):**
```bash
cd "$(dirname "$0")/.."
```

This ensures they always run from the project root, regardless of where you execute them from.

---

## 🎯 Recommended Usage

### **New Users:**
1. Use the root launchers:
   - `START_SIMPLE.bat` / `START_SIMPLE.sh`
   - `START_WITH_VAPI.bat` / `START_WITH_VAPI.sh`

### **Advanced Users:**
1. Run scripts directly from this folder
2. Use `verify_setup.sh` to check configuration
3. Use `healthcheck.py` for monitoring

---

## 🐛 Debugging

If scripts fail:

1. **Check logs:**
   ```bash
   cat ../logs/stuffed_lamb.log
   ```

2. **Verify setup:**
   ```bash
   ./verify_setup.sh
   ```

3. **Test manually:**
   ```bash
   cd ..
   python run.py
   ```

4. **Check .env exists:**
   ```bash
   ls -la ../.env
   ```

---

## 📚 More Information

- **How to Start:** `../HOW_TO_START.md` (in parent folder)
- **Quick Start Guide:** `../docs/QUICK_START.md`
- **Main README:** `../README.md`
