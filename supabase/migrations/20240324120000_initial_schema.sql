-- Migration: Initial Schema Setup
-- Description: Creates the initial database schema for Przepisy 2.0
-- Tables: ingredients, list_items, saved_recipes
-- Author: AI Assistant
-- Date: 2024-03-24

-- create custom enum for units
create type unit_enum as enum ('g', 'ml', 'szt.');

-- create ingredients table
create table ingredients (
    id uuid primary key default gen_random_uuid(),
    name text unique not null,
    created_at timestamptz default now()
);

-- enable rls for ingredients
alter table ingredients enable row level security;

-- create rls policies for ingredients
create policy "Allow anonymous select access to ingredients" 
    on ingredients for select 
    to anon 
    using (true);

create policy "Allow authenticated select access to ingredients" 
    on ingredients for select 
    to authenticated 
    using (true);

create policy "Allow authenticated insert to ingredients" 
    on ingredients for insert 
    to authenticated 
    with check (true);

-- create list_items table
create table list_items (
    id uuid primary key default gen_random_uuid(),
    user_id uuid references auth.users(id) on delete cascade not null,
    ingredient_id uuid references ingredients(id) not null,
    quantity numeric not null check (quantity > 0),
    unit unit_enum not null,
    created_at timestamptz default now(),
    updated_at timestamptz default now(),
    unique(user_id, ingredient_id)
);

-- enable rls for list_items
alter table list_items enable row level security;

-- create rls policies for list_items
create policy "Users can view their own list items" 
    on list_items for select 
    to authenticated 
    using (auth.uid() = user_id);

create policy "Users can insert their own list items" 
    on list_items for insert 
    to authenticated 
    with check (auth.uid() = user_id);

create policy "Users can update their own list items" 
    on list_items for update 
    to authenticated 
    using (auth.uid() = user_id);

create policy "Users can delete their own list items" 
    on list_items for delete 
    to authenticated 
    using (auth.uid() = user_id);

-- create saved_recipes table
create table saved_recipes (
    id uuid primary key default gen_random_uuid(),
    user_id uuid references auth.users(id) on delete cascade not null,
    title text,
    content text not null,
    input_ingredients jsonb,
    created_at timestamptz default now(),
    updated_at timestamptz default now()
);

-- enable rls for saved_recipes
alter table saved_recipes enable row level security;

-- create rls policies for saved_recipes
create policy "Users can view their own saved recipes" 
    on saved_recipes for select 
    to authenticated 
    using (auth.uid() = user_id);

create policy "Users can insert their own saved recipes" 
    on saved_recipes for insert 
    to authenticated 
    with check (auth.uid() = user_id);

-- create indexes
create index idx_list_items_user_id on list_items(user_id);
create index idx_list_items_ingredient_id on list_items(ingredient_id);
create index idx_ingredients_name on ingredients(name);
create index idx_saved_recipes_user_id on saved_recipes(user_id);

-- create function to automatically update updated_at for list_items
create or replace function update_updated_at_column()
returns trigger as $$
begin
    new.updated_at = now();
    return new;
end;
$$ language plpgsql;

-- create trigger for list_items
create trigger set_list_items_updated_at
    before update on list_items
    for each row
    execute function update_updated_at_column(); 