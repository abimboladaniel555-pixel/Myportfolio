# Portfolio + Contact Backend (Vercel + Supabase + Resend)

```
index.html            portfolio (form now posts to /api/contact)
brewnest/index.html   live BrewNest website
images/               project images
api/contact.js        the backend (serverless function)
supabase.sql          creates the messages table
.env.example          the 4 secret values you need
package.json  .gitignore
```

## 1. Create the database (Supabase)
1. supabase.com → New project (wait ~2 min).
2. SQL Editor → New query → paste everything in `supabase.sql` → Run.
3. Project Settings → API → copy **Project URL** and the **service_role** key (keep it secret).

## 2. Get an email key (Resend)
resend.com → API Keys → Create → copy the key.
Free test sender only emails the address you signed up to Resend with — use that as `MY_EMAIL`.

## 3. Add your secrets locally
Copy `.env.example` to `.env.local` and fill in the 4 values.

## 4. Run it on your computer
```bash
npm install
npm i -g vercel
vercel dev
```
Open the address it prints (http://localhost:3000), send a test message.
Check: a new row in Supabase → Table Editor → messages, and an email in your inbox.
(Opening index.html by double-click will NOT work for the form — it needs `vercel dev`.)

## 5. Deploy
1. Push this folder to GitHub (`.env.local` is ignored — keep it that way).
2. Vercel → Add New → Project → import the repo.
3. Settings → Environment Variables → add SUPABASE_URL, SUPABASE_SERVICE_KEY, RESEND_API_KEY, MY_EMAIL.
4. Deployments → Redeploy. Test the live form.

## What the API does
- Only accepts POST. Ignores bots that fill the hidden `website` field.
- Rate limit: 5 messages per IP per 10 minutes.
- Validates name, email, service (must be one of the dropdown options) and message (10+ chars).
- Saves to Supabase first, then emails you. If the email fails, the message is still saved.

## Reading your messages
Supabase → Table Editor → messages. (An admin page can be added later.)
