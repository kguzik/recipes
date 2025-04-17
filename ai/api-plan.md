# REST API Plan

## 1. Resources
- **Users**: Corresponds to the `auth.users` table.
- **Ingredients**: Corresponds to the `ingredients` table.
- **List Items**: Corresponds to the `list_items` table.
- **Saved Recipes**: Corresponds to the `saved_recipes` table.

## 2. Endpoints

### Ingredients
- **GET /api/ingredients**
  - Description: Retrieve a list of ingredients.
  - Response JSON: `[ { "id": "UUID", "name": "string" } ]`
  - Success: `200 OK`
  - Errors: `500 Internal Server Error`

- **POST /api/ingredients**
  - Description: Add a new ingredient.
  - Request JSON: `{ "name": "string" }`
  - Response JSON: `{ "id": "UUID", "name": "string" }`
  - Success: `201 Created`
  - Errors: `400 Bad Request`, `409 Conflict`

- **POST /api/ingredients/validate**
  - Description: Validate an ingredient.
  - Request JSON: `{ "name": "string" }`
  - Response JSON: `{ "valid": "boolean" }`
  - Success: `200 OK`
  - Errors: `400 Bad Request`

### List Items
- **GET /api/list-items**
  - Description: Retrieve list items for a user.
  - Response JSON: `[ { "id": "UUID", "ingredient_id": "UUID", "quantity": "number", "unit": "string" } ]`
  - Success: `200 OK`
  - Errors: `401 Unauthorized`, `500 Internal Server Error`

- **POST /api/list-items**
  - Description: Add a new list item.
  - Request JSON: `{ "ingredient_id": "UUID", "quantity": "number", "unit": "string" }`
  - Response JSON: `{ "id": "UUID", "ingredient_id": "UUID", "quantity": "number", "unit": "string" }`
  - Success: `201 Created`
  - Errors: `400 Bad Request`, `401 Unauthorized`

### Saved Recipes
- **GET /api/recipes**
  - Description: Retrieve saved recipes for a user.
  - Response JSON: `[ { "id": "UUID", "title": "string", "content": "string" } ]`
  - Success: `200 OK`
  - Errors: `401 Unauthorized`, `500 Internal Server Error`

- **POST /api/recipes/save**
  - Description: Save a new recipe.
  - Request JSON: `{ "title": "string", "content": "string", "input_ingredients": "JSONB" }`
  - Response JSON: `{ "id": "UUID", "title": "string", "content": "string" }`
  - Success: `201 Created`
  - Errors: `400 Bad Request`, `401 Unauthorized`

- **POST /api/recipes/generate**
  - Description: Generate a recipe based on ingredients.
  - Request JSON: `{ "ingredients": "array of strings" }`
  - Response JSON: `{ "title": "string", "content": "string" }`
  - Success: `200 OK`
  - Errors: `400 Bad Request`

- **GET /api/recipes/suggestions**
  - Description: Get recipe suggestions based on saved ingredients.
  - Response JSON: `[ { "title": "string", "content": "string" } ]`
  - Success: `200 OK`
  - Errors: `401 Unauthorized`, `500 Internal Server Error`

## 3. Authentication and Authorization
- Use Supabase's built-in authentication for user management.

## 4. Validation and Business Logic
- **Users**: Ensure unique email and non-null password.
- **Ingredients**: Validate uniqueness of name.
- **List Items**: Validate `quantity > 0` and unique combination of `user_id` and `ingredient_id`.
- Implement business logic for recipe generation and suggestions using AI integration via Openrouter.ai. 