# 🚀 How to Start Stuffed Lamb - SIMPLE GUIDE

**For Windows: Just go to the `scripts` folder and double-click a file!**

---

## ⚡ Quick Start (3 Steps)

### **Step 1:** Open File Explorer
Navigate to: `stuffed-lamb-standalone\scripts\`

### **Step 2:** Choose what you need:

| File | What it does | When to use |
|------|--------------|-------------|
| **START_HERE.bat** | Simple server only | ⭐ Local testing (recommended first!) |
| **START_WITH_VAPI.bat** | Server + ngrok tunnel | 🚀 VAPI voice calls (needs ngrok) |
| **STOP.bat** | Stop all services | 🛑 When you're done |

### **Step 3:** Double-click the file you want!

---

## 📋 For First-Time Users

**Recommended:** Start with `START_HERE.bat`

1. Go to `scripts` folder
2. Double-click `START_HERE.bat`
3. Wait 5-10 seconds
4. Open browser: http://localhost:8000/health
5. You should see: `{"status": "healthy"}`

✅ **Done!** Your server is running!

---

## 🚀 For VAPI Integration

**Need to test voice calls?** Use `START_WITH_VAPI.bat`

**Requirements:**
- ngrok installed (download: https://ngrok.com/download)
- Internet connection

**Steps:**
1. Go to `scripts` folder
2. Double-click `START_WITH_VAPI.bat`
3. Multiple windows will open (server, ngrok)
4. Check the window for your public URL: `https://abc123.ngrok-free.app`
5. Use in VAPI webhook: `https://your-url/vapi/webhook`

---

## 🐧 For Linux/Mac Users

Same files, just `.sh` instead of `.bat`:

```bash
cd stuffed-lamb-standalone/scripts

# Simple server
./START_HERE.sh

# With VAPI/ngrok
./START_WITH_VAPI.sh

# Stop services
./STOP.sh
```

---

## 🛑 How to Stop

### Windows:
- Press `Ctrl+C` in the command window
- OR double-click `scripts\STOP.bat`
- OR close the window

### Linux/Mac:
- Press `Ctrl+C` in terminal
- OR run `./scripts/STOP.sh`

---

## ❓ Troubleshooting

### "Python not found"
- Install Python 3.8+ from https://python.org
- Make sure it's in your PATH

### ".env file not found"
- Copy `.env.example` to `.env`
- Edit `.env` with your credentials
- See `docs/ENV_SETUP_GUIDE.md`

### "ngrok not found"
- Download: https://ngrok.com/download
- Add to PATH
- OR use `START_HERE.bat` instead (no ngrok needed)

### Port 8000 already in use
- Stop other servers
- OR edit `.env` file: change `PORT=8000` to another port

---

## 📚 More Help

- **Environment Setup:** `docs/ENV_SETUP_GUIDE.md`
- **Production Deploy:** `docs/PRODUCTION_DEPLOYMENT.md`
- **Full Structure:** `FOLDER_STRUCTURE.md`
- **Main README:** `README.md`

---

## 🎯 File Locations

```
stuffed-lamb-standalone/
├── scripts/                  ← ALL STARTUP FILES HERE!
│   ├── START_HERE.bat        ← Windows: Simple start
│   ├── START_WITH_VAPI.bat   ← Windows: With ngrok
│   ├── STOP.bat              ← Windows: Stop
│   ├── START_HERE.sh         ← Linux: Simple start
│   ├── START_WITH_VAPI.sh    ← Linux: With ngrok
│   ├── STOP.sh               ← Linux: Stop
│   ├── verify_setup.sh       ← Check configuration
│   └── healthcheck.py        ← Health monitoring
│
├── run.py                    ← Direct Python start (advanced)
├── .env                      ← Your configuration
├── HOW_TO_START.md           ← This file
└── README.md                 ← Project overview
```

---

**That's it! Just go to `scripts\` and double-click `START_HERE.bat`!** 🎉
