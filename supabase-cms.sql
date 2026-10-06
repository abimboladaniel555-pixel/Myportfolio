-- Run once in Supabase: SQL Editor -> New query -> paste -> Run
create table if not exists site_content (
  key         text primary key,
  value       jsonb not null,
  updated_at  timestamptz not null default now()
);
alter table site_content enable row level security;   -- no public access; only your server key
