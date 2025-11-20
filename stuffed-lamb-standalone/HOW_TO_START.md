# 🚀 How to Start the Stuffed Lamb System

**Quick answer: Just double-click one of these files based on what you need!**

---

## ⚡ For Windows Users

### **Option 1: Simple Testing (Recommended First)**
📁 **Double-click:** `START_SIMPLE.bat`

**What it does:**
- ✅ Starts the server on http://localhost:8000
- ✅ Perfect for local testing and API development
- ✅ No ngrok needed

**Use when:** You just want to test the system locally

---

### **Option 2: VAPI Integration**
📁 **Double-click:** `START_WITH_VAPI.bat`

**What it does:**
- ✅ Starts the server
- ✅ Launches ngrok tunnel (public URL)
- ✅ Shows you the webhook URL for VAPI
- ⚠️ Requires ngrok installed

**Use when:** You want to test VAPI voice calls

**Requires:** ngrok - Download from https://ngrok.com/download

---

## 🐧 For Linux/Mac Users

### **Option 1: Simple Testing (Recommended First)**
📁 **Run:** `./START_SIMPLE.sh`

```bash
cd stuffed-lamb-standalone
./START_SIMPLE.sh
```

**What it does:**
- ✅ Starts the server on http://localhost:8000
- ✅ Perfect for local testing

**Use when:** You just want to test the system locally

---

### **Option 2: VAPI Integration**
📁 **Run:** `./START_WITH_VAPI.sh`

```bash
cd stuffed-lamb-standalone
./START_WITH_VAPI.sh
```

**What it does:**
- ✅ Starts the server
- ✅ Launches ngrok tunnel
- ✅ Shows webhook URL for VAPI
- ⚠️ Requires ngrok installed

**Requires:** ngrok - Download from https://ngrok.com/download

---

## 📊 Quick Comparison

| Launcher | Purpose | ngrok Needed | VAPI Ready |
|----------|---------|--------------|------------|
| `START_SIMPLE.*` | Local testing | ❌ No | ❌ No |
| `START_WITH_VAPI.*` | VAPI integration | ✅ Yes | ✅ Yes |

---

## ✅ After Starting

### Verify it's working:
1. Wait 5-10 seconds for startup
2. Open browser to: http://localhost:8000/health
3. You should see: `{"status": "healthy", ...}`

### Test with VAPI (if using START_WITH_VAPI):
1. Check the command window for your ngrok URL
2. It will look like: `https://abc123.ngrok-free.app`
3. Use in VAPI webhook settings: `https://abc123.ngrok-free.app/vapi/webhook`
4. Access ngrok dashboard: http://localhost:4040

---

## 🛑 How to Stop

### Windows:
- Press `Ctrl+C` in the command window
- Or close the window

### Linux/Mac:
- Press `Ctrl+C` in the terminal
- Or run: `./scripts/stop.sh`

---

## 🔧 Advanced Options

If you need more control, you can run scripts directly from the `scripts/` folder:

### Windows:
```cmd
cd scripts
start.bat              # Simple server
start-with-ngrok.bat   # Full system with ngrok
stop.bat               # Stop all services
```

### Linux/Mac:
```bash
cd scripts
./start.sh             # Simple server
./start-complete.sh    # Full system with ngrok
./stop.sh              # Stop all services
./verify_setup.sh      # Check configuration
```

---

## 🐍 Direct Python (Most Basic)

If you prefer running Python directly:

```bash
# Windows
python run.py

# Linux/Mac
python3 run.py
```

This starts just the server on http://localhost:8000 (no ngrok)

---

## ❓ Troubleshooting

### "Python not found"
- Install Python 3.8+ from https://python.org
- Make sure it's in your PATH

### ".env file not found"
- Copy `.env.example` to `.env`
- Edit `.env` with your Twilio credentials
- See `docs/ENV_SETUP_GUIDE.md` for help

### "ngrok not found"
- Download from https://ngrok.com/download
- Add to your PATH
- Or use `START_SIMPLE` instead (no ngrok needed)

### Port 8000 already in use
- Stop any other servers using port 8000
- Or edit `.env` to change PORT=8000 to another port

---

## 📚 More Help

- **Quick Start Guide:** `docs/QUICK_START.md`
- **Production Deployment:** `docs/PRODUCTION_DEPLOYMENT.md`
- **Environment Setup:** `docs/ENV_SETUP_GUIDE.md`
- **Main README:** `README.md`

---

**Need help?** Check the docs folder or review the logs in `logs/stuffed_lamb.log`
