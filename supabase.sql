-- Run this once in Supabase: SQL Editor -> New query -> paste -> Run
create table if not exists messages (
  id          bigint generated always as identity primary key,
  name        text not null,
  email       text not null,
  service     text,
  message     text not null,
  created_at  timestamptz not null default now()
);

-- Block all public (browser) access. Only your server key can read/write.
alter table messages enable row level security;
