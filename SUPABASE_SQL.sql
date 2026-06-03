-- ─────────────────────────────────────────────────────────
--  JayyVisualls — Run this in Supabase SQL Editor
--  Supabase → SQL Editor → New Query → paste → Run
-- ─────────────────────────────────────────────────────────

-- 1. CLICKS TABLE (logs every link click)
create table if not exists clicks (
  id        bigserial primary key,
  link_id   text,
  client    text,
  platform  text,
  type      text,
  dest      text,
  referrer  text,
  ua        text,
  ts        timestamptz default now()
);

-- 2. LEADS TABLE (auto-populated from lead capture form)
create table if not exists leads (
  id        bigserial primary key,
  link_id   text,
  client    text,
  platform  text,
  name      text,
  phone     text,
  email     text,
  interest  text,
  dest      text,
  referrer  text,
  ts        timestamptz default now()
);

-- 3. Enable Row Level Security + public access policies
alter table clicks enable row level security;
alter table leads  enable row level security;

create policy "insert_clicks" on clicks for insert with check (true);
create policy "read_clicks"   on clicks for select using (true);
create policy "insert_leads"  on leads  for insert with check (true);
create policy "read_leads"    on leads  for select using (true);

-- Done! Your tables are ready.
