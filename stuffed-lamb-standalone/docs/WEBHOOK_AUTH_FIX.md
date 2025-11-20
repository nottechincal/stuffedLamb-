# 🚨 WEBHOOK 401 UNAUTHORIZED - FIX GUIDE

**Problem:** All VAPI tool calls return 401 UNAUTHORIZED

**Root Cause:** VAPI is not sending the required authentication header

---

## 🔍 What's Happening

Your server code requires webhook authentication:

```python
# In server.py
@app.post("/webhook")
@require_webhook_auth  # ← This enforces authentication
def webhook():
    ...
```

The `require_webhook_auth` decorator checks for a header:
- `X-Stuffed-Lamb-Signature` OR `X-Webhook-Secret`
- Value must match: `WEBHOOK_SHARED_SECRET` from your `.env`

Your `.env` has:
```bash
WEBHOOK_SHARED_SECRET=Uqz3uU8vT38B0h9a7n5j
```

**But VAPI doesn't know about this!** It's not sending the header.

---

## ⚡ QUICK FIX (For Testing Only)

**Temporarily disable webhook authentication:**

### Option 1: Comment out the secret in .env

Edit your `.env` file:

```bash
# Comment out this line:
# WEBHOOK_SHARED_SECRET=Uqz3uU8vT38B0h9a7n5j

# OR set it to empty:
WEBHOOK_SHARED_SECRET=
```

**Restart your server** and VAPI tools will work!

⚠️ **WARNING:** This disables security. Use only for testing!

---

## 🔒 PROPER FIX (For Production)

VAPI supports custom headers in server configuration!

### Step 1: In VAPI Dashboard

1. Go to your VAPI Assistant settings
2. Find the **Server URL** configuration for your tools
3. Look for **"Headers"** or **"Custom Headers"** section
4. Add this header:

```
Header Name: X-Webhook-Secret
Header Value: Uqz3uU8vT38B0h9a7n5j
```

### Step 2: Configure Each Tool

In your `vapi-tools.json`, each tool's server section should look like:

```json
{
  "server": {
    "url": "https://your-domain.com/webhook",
    "headers": {
      "X-Webhook-Secret": "Uqz3uU8vT38B0h9a7n5j"
    }
  }
}
```

### Step 3: Update ALL 18 Tools

You need to add the headers section to all 18 tools in `vapi-tools.json`.

**Important:** Keep the secret in `.env` and sync it with VAPI configuration!

---

## 📋 VAPI Configuration Steps

### If VAPI Doesn't Support Custom Headers Yet:

Some VAPI versions might not support custom headers in the UI. In that case:

#### Option A: Use VAPI API to Configure

```bash
# Use VAPI's REST API to configure headers
curl -X PATCH https://api.vapi.ai/assistant/YOUR_ASSISTANT_ID \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -d '{
    "serverUrl": "https://your-domain.com/webhook",
    "serverHeaders": {
      "X-Webhook-Secret": "Uqz3uU8vT38B0h9a7n5j"
    }
  }'
```

#### Option B: Disable Auth (Development Only)

For development/testing, you can disable auth:

```bash
# In .env
WEBHOOK_SHARED_SECRET=
```

Then re-enable it for production.

---

## 🧪 Testing After Fix

### 1. Restart Your Server

```bash
cd scripts
./START_HERE.bat  # Windows
./START_HERE.sh   # Linux
```

### 2. Make a Test VAPI Call

Call your VAPI number and try:
- "What's on the menu?"
- "I'll have a chicken mandi"

### 3. Check Server Logs

Should see:
```
✓ POST /webhook   200 OK  (not 401!)
✓ Tool: quickAddItem executed successfully
```

### 4. Check VAPI Console

No more "Unauthorized" errors!

---

## 🔧 Troubleshooting

### Still Getting 401?

**Check 1: Is the header being sent?**
```bash
# Add logging to see headers
tail -f logs/stuffed_lamb.log
```

**Check 2: Header name correct?**
- Must be: `X-Webhook-Secret` OR `X-Stuffed-Lamb-Signature`
- Case sensitive!

**Check 3: Secret value matches?**
```bash
# Check .env
grep WEBHOOK_SHARED_SECRET .env

# Should output:
# WEBHOOK_SHARED_SECRET=Uqz3uU8vT38B0h9a7n5j
```

**Check 4: Server restarted?**
- Changes to `.env` require server restart!

---

## 📚 Related Files

- **Server Code:** `stuffed_lamb/server.py` (line 2659-2671)
- **Config:** `.env` (line 66)
- **VAPI Tools:** `config/vapi-tools.json`
- **Setup Guide:** `config/VAPI_SETUP.md`

---

## 🎯 Recommended Approach

**For Immediate Testing:**
1. Comment out `WEBHOOK_SHARED_SECRET` in `.env`
2. Restart server
3. Test VAPI calls
4. ✓ Everything works!

**For Production:**
1. Re-enable `WEBHOOK_SHARED_SECRET` in `.env`
2. Configure VAPI to send `X-Webhook-Secret` header
3. Test again
4. Deploy with security enabled

---

## ⚠️ Security Notes

- **Never** commit `.env` to git (already in `.gitignore`)
- **Change** the secret value before production
- **Use** a strong random string for production:
  ```bash
  # Generate a new secret:
  python3 -c "import secrets; print(secrets.token_urlsafe(32))"
  ```
- **Sync** the secret between `.env` and VAPI configuration

---

## 💡 Quick Reference

| Problem | Solution |
|---------|----------|
| 401 errors | Add `X-Webhook-Secret` header in VAPI |
| Testing only | Comment out `WEBHOOK_SHARED_SECRET` in `.env` |
| Production | Keep secret enabled, configure VAPI properly |
| Change secret | Update in BOTH `.env` AND VAPI |

---

**Need more help?** Check the logs at `logs/stuffed_lamb.log`
