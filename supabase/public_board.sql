-- Public status strip for the portfolio ("On the bench right now").
-- Returns only the type, status and date of recent requests: never the idea text, name or contact.
-- Run this once in the Supabase SQL editor for the project that holds build_requests.
create or replace function public.public_board()
returns json
language sql
stable
security definer
set search_path = public
as $$
  select coalesce(json_agg(t), '[]'::json)
  from (
    select kind, status, created_at
    from build_requests
    where status in ('new', 'looking', 'building', 'done')
    order by created_at desc
    limit 12
  ) t
$$;

revoke all on function public.public_board() from public;
grant execute on function public.public_board() to anon, authenticated;
