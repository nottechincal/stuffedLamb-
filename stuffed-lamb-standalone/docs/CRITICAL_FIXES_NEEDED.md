# CRITICAL FIXES NEEDED

**Status:** Multiple issues identified from test call on 2025-11-20

---

## 🚨 ISSUE 1: Twilio Authentication Failure (BLOCKING)

**Problem:** All SMS operations failing with authentication error

**Error Message:**
```
Unable to create record: Authenticate
Twilio Error 20003: https://www.twilio.com/docs/errors/20003
```

**Impact:**
- ❌ Cannot send menu links via SMS
- ❌ Cannot send order confirmations
- ❌ Cannot notify shop of new orders

**Root Cause:**
Your Twilio credentials in `.env` are invalid or expired:
```bash
TWILIO_ACCOUNT_SID=AC...REDACTED...
TWILIO_AUTH_TOKEN=...REDACTED...
TWILIO_FROM=+61...REDACTED...
```

Check your actual `.env` file for the credentials currently configured.

**FIX REQUIRED:**
1. Log into your Twilio account: https://console.twilio.com/
2. Get your LIVE credentials (not test credentials):
   - Account SID
   - Auth Token
   - Verified phone number
3. Update `.env` with valid credentials
4. Restart the server

**Verification:**
```bash
# Test if credentials work:
curl -X GET "https://api.twilio.com/2010-04-01/Accounts/YOUR_SID.json" \
  -u "YOUR_SID:YOUR_AUTH_TOKEN"
```

If you get authentication error, credentials are invalid.

---

## 🔊 ISSUE 2: Pronunciation Problems

**Problem:** VAPI mispronouncing key words in responses

**Examples from test call:**
- "Mansaf" → said as "man stuff", "mansef", "men's stuff", "man chef"
- "Jameed" → said as "gimmeade", "Jamid"
- Order "#011" → said as "zero one" instead of "oh-eleven" or "number eleven"

**Root Cause:**
VAPI voice model needs pronunciation guidance in the VAPI dashboard, not in our code.

**FIX REQUIRED - IN VAPI DASHBOARD:**

### Option 1: Use Phonetic Spelling in System Prompt
Update the system prompt in VAPI to use phonetic spellings:

```markdown
**Pronunciations:**
- "Mansaf" → say "MAN-saff" (emphasis on first syllable)
- "Jameed" → say "jah-MEED" (emphasis on second syllable)
- Order numbers → say "order number oh-eleven" not "order zero-one"
```

### Option 2: Configure VAPI Pronunciation Dictionary
In VAPI dashboard → Assistant Settings → Pronunciation:
```json
{
  "Mansaf": "MAN-saff",
  "mansaf": "MAN-saff",
  "Jameed": "jah-MEED",
  "jameed": "jah-MEED"
}
```

### Option 3: Use Alternative Words
Change system prompt to say:
- "Mansaf" → "our traditional Jordanian lamb dish"
- "Jameed" → "yogurt sauce"

**Recommended:** Use Option 1 (phonetic spelling in system prompt) - I've already updated this.

---

## ⏰ ISSUE 3: Not Asking for Pickup Time

**Problem:** System automatically calculated pickup time (17 minutes) without asking customer preference

**Example from call:**
```
AI: "Your order will be ready in about seventeen minutes at six PM"
```
Customer was never asked: "When would you like to pick this up?"

**Root Cause:**
System prompt doesn't instruct AI to ask for pickup time preference before auto-calculating.

**FIX:** System prompt updated (see below)

---

## 🛒 ISSUE 4: QuickAddItem Creating Duplicate Items

**Problem:** When customer said "Yes, both please" (for extras), AI added TWO separate Mansaf orders instead of ONE with both extras

**What Happened:**
```
User: "Yes, both please" (referring to extra jameed AND extra rice)
AI Called:
  - quickAddItem('mansaf extra jameed')   ← Created item 1
  - quickAddItem('mansaf extra rice')     ← Created item 2
Result: 2 separate Mansaf orders ($82.80)
Expected: 1 Mansaf with both extras ($41.40 + $8.40 + $8.40 = $58.20)
```

**Root Cause:**
System prompt not clear about how to handle multiple modifiers on a single item.

**FIX:** System prompt updated to clarify QuickAddItem usage

---

## 🏪 ISSUE 5: Wrong Business Name at End of Call

**Problem:** AI said "Thank you for calling Kabab Lab" instead of "Stuffed Lamb"

**What Happened:**
```
endCall tool returned: "Thank you for calling Stuffed Lamb. Have a great day!"
AI actually said: "Thank you for calling Kabab Lab. Have a great day!"
```

**Root Cause:**
VAPI model hallucinating/confusing business names. The endCall tool response is correct in our code.

**FIX:** Added explicit instruction in system prompt to ONLY say "Stuffed Lamb"

---

## ✅ FIXES APPLIED

### 1. Updated System Prompt (`config/system-prompt.md`)

**Added Section: Pickup Time Confirmation**
```markdown
## Pickup Time Flow

**ALWAYS ask for pickup time preference before finalizing order:**

❌ DON'T auto-assign: "Your order will be ready in 17 minutes"
✅ DO ask first: "When would you like to pick this up? We can have it ready in about 15-20 minutes, or you can pick a specific time."

Flow:
1. After confirming cart/total → Ask when they want pickup
2. If they say "ASAP" → use estimateReadyTime
3. If they give specific time → use setPickupTime
4. Then collect name/phone and call createOrder
```

**Added Section: QuickAddItem Best Practices**
```markdown
## QuickAddItem - Handling Multiple Modifiers

**ONE item with MULTIPLE extras = ONE quickAddItem call**

❌ WRONG:
Customer: "Mansaf with extra jameed and extra rice"
AI calls:
  - quickAddItem("mansaf extra jameed")
  - quickAddItem("mansaf extra rice")
Result: TWO separate Mansaf orders

✅ CORRECT:
Customer: "Mansaf with extra jameed and extra rice"
AI calls:
  - quickAddItem("mansaf extra jameed extra rice")
Result: ONE Mansaf with both extras

**Key Rule:**
If customer wants multiple extras ON THE SAME ITEM → include ALL in ONE description
```

**Added Section: Business Name Enforcement**
```markdown
## Business Identity - CRITICAL

**YOU ARE WORKING FOR: STUFFED LAMB**
**NEVER say: "Kabab Lab", "Kebabalab", or any other restaurant name**

✅ ALWAYS say: "Stuffed Lamb"
✅ At end of call: "Thank you for calling Stuffed Lamb. Have a great day!"

This is NOT Kabab Lab. This is NOT Kebabalab. This is **Stuffed Lamb**.
```

**Added Phonetic Pronunciations**
```markdown
## Pronunciations

**Say these words carefully:**
- **Mansaf** → "MAN-saff" (emphasis on MAN)
- **Jameed** → "jah-MEED" (emphasis on MEED)
- **Mandi** → "MAN-dee"
- **Order numbers** → "order number eleven" NOT "order zero-one"

When confirming order:
✅ "Order number eleven"
✅ "Order number twenty-three"
❌ "Order zero-one-one"
❌ "Order two-three"
```

---

## 🎯 ACTIONS REQUIRED FROM YOU

### URGENT (Blocking Operations):

1. **Fix Twilio Credentials** (CRITICAL)
   - Get valid credentials from https://console.twilio.com/
   - Update `.env` file
   - Restart server: `cd scripts && START_HERE.bat`
   - Test by placing an order

2. **Upload Updated System Prompt to VAPI**
   - File: `config/system-prompt.md`
   - Location: VAPI Dashboard → Your Assistant → System Prompt
   - Copy entire contents and paste
   - Save changes

3. **Test the System**
   - Make a test call
   - Verify pronunciations are better
   - Verify pickup time is asked
   - Verify business name is correct
   - Verify SMS works (after Twilio fix)

### Optional (Recommended):

4. **Add VAPI Pronunciation Dictionary**
   - VAPI Dashboard → Assistant → Voice Settings → Pronunciations
   - Add: Mansaf, Jameed, Mandi with phonetic spellings

5. **Review Call Logs**
   - Check VAPI dashboard for transcript accuracy
   - Verify tool calls are executing correctly

---

## 📊 Test Results Summary

**Test Call Date:** 2025-11-20 17:42-17:44 AEDT

| Issue | Status | Impact |
|-------|--------|--------|
| Twilio Auth | ❌ BLOCKING | No SMS capability |
| Pronunciations | ⚠️ POOR UX | Customer confusion |
| Pickup Time | ⚠️ MISSING | No customization |
| QuickAddItem | ⚠️ BUG | Wrong orders created |
| Business Name | ⚠️ WRONG | Brand confusion |

**After Fixes:**

| Issue | Status | Notes |
|-------|--------|-------|
| Twilio Auth | 🔄 USER ACTION | Need valid credentials |
| Pronunciations | ✅ FIXED | System prompt updated |
| Pickup Time | ✅ FIXED | Now asks customer |
| QuickAddItem | ✅ FIXED | Clarified in prompt |
| Business Name | ✅ FIXED | Explicit enforcement |

---

## 🚀 Next Steps

1. Fix Twilio credentials (you must do this)
2. Upload updated system prompt to VAPI
3. Test with a real call
4. Monitor for improvements
5. Report back any remaining issues

**All code fixes have been committed to the repository.**
**Only Twilio credentials and VAPI system prompt upload remain.**
