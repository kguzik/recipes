# Database Schema for Przepisy 2.0

## 1. Tables

### 1.1 auth.users
- **id** UUID PRIMARY KEY
- **email** TEXT UNIQUE NOT NULL
- **password** TEXT NOT NULL
- **created_at** TIMESTAMP WITH TIME ZONE DEFAULT now()

### 1.2 ingredients
- **id** UUID PRIMARY KEY
- **name** TEXT UNIQUE NOT NULL

### 1.3 list_items
- **id** UUID PRIMARY KEY
- **user_id** UUID REFERENCES auth.users(id) ON DELETE CASCADE
- **ingredient_id** UUID REFERENCES ingredients(id)
- **quantity** NUMERIC CHECK (quantity > 0) NOT NULL
- **unit** UNIT_ENUM NOT NULL
- UNIQUE (user_id, ingredient_id)

### 1.4 saved_recipes
- **id** UUID PRIMARY KEY
- **user_id** UUID REFERENCES auth.users(id) ON DELETE CASCADE
- **title** TEXT
- **content** TEXT NOT NULL
- **input_ingredients** JSONB

## 2. Relationships
- **auth.users** (1) ↔ **list_items** (N): One user can have many list items.
- **auth.users** (1) ↔ **saved_recipes** (N): One user can save many recipes.
- **ingredients** (1) ↔ **list_items** (N): One ingredient can be in many user lists.

## 3. Indexes
- Index on `list_items.user_id`
- Index on `list_items.ingredient_id`
- Index on `ingredients.name`

## 4. PostgreSQL Row Level Security (RLS)
- **list_items**: 
  - Policy: `SELECT`, `INSERT`, `UPDATE`, `DELETE` only for the owner (`auth.uid() = user_id`).
- **saved_recipes**: 
  - Policy: `SELECT`, `INSERT` for the owner, `UPDATE` is restricted (`auth.uid() = user_id`).

## 5. Additional Notes
- The `UNIT_ENUM` type should be defined as:
  ```sql
  CREATE TYPE UNIT_ENUM AS ENUM ('g', 'ml', 'szt.');
  ```
- Ensure that the validation process for ingredients through AI is implemented in the application logic before adding to the `ingredients` table.