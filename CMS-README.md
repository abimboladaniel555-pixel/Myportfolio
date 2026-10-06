# Portfolio admin (content editor) — update

Replace / add these in your repo (keep the folders):
  index.html            (REPLACES your current one — it now loads your edits)
  api/admin.js          (REPLACES the old admin.js)
  api/content.js        (NEW — public, serves your edits to the site)
  admin/index.html      (REPLACES the old admin page)
  supabase-cms.sql      (run once in Supabase -> SQL Editor)
  vercel.json           (same as before)

Steps:
1. Supabase -> SQL Editor -> paste supabase-cms.sql -> Run.
2. Copy the files into the repo, then:  git add . && git commit -m "Add content editor" && git push
3. Open /admin -> log in -> Content / Projects / Media / Messages.

Env vars needed in Vercel (same as before): SUPABASE_URL, SUPABASE_SERVICE_KEY, ADMIN_PASSWORD
(+ RESEND_API_KEY, MY_EMAIL for the contact form).
Uploads go to a public Supabase Storage bucket named "portfolio" (created automatically on first upload).
