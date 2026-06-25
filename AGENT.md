# Agent Guidelines - Todo App

## Architectural Mandates

### 1. Controller Pattern: "Thin & RESTful Controllers"
- **Strict REST**: Adhere strictly to RESTful routing. Use standard resource actions (`index`, `show`, `new`, `create`, `edit`, `update`, `destroy`).
- **No Custom Actions**: Avoid creating custom controller actions. Use nested resources or separate controllers for complex entities.
- **Thin Logic**: Controllers must only handle request routing, parameter parsing, and response rendering.
- **No business logic** or **complex ActiveRecord queries** in controllers.

### 2. Security & Scoping
- **Prohibit Direct Lookups**: Never use direct model lookups (e.g., `Task.find(params[:id])`) for user-owned resources.
- **Scoped Access**: Always scope lookups through the authenticated user to prevent unauthorized access (e.g., `current_user.tasks.find(params[:id])` or `current_user.tasks.where(...)`).

### 3. Service Layer: `app/services`
- All "hard logic" for `create`, `update`, `patch`, and `destroy` operations must reside in Service objects.
- Services should be single-purpose (e.g., `Todos::CreateService`).
- Use services to encapsulate transactions and complex state changes.

### 3. Query Layer: `app/queries`
- Complex ActiveRecord queries (filters, joins, aggregations) must be moved to the `Queries` namespace.
- Example: `Todos::ActiveTasksQuery.call`.
- Keep models "flat" by removing complex scope logic and moving it here.

### 4. Model Pattern: "Flat Models"
- Models should primarily define associations, validations, and simple helper methods.
- Avoid "fat models" by delegating logic to Services and Queries.

## Development Workflow

1. **Feature Implementation**: Implement the requested feature.
2. **Refactor**:
   - Extract business logic $ightarrow$ `app/services`
   - Extract complex queries $ightarrow$ `app/queries`
3. **Validation**:
   - Run `bundle exec rubocop` to ensure style compliance.
   - Run `bundle exec rspec` to verify behavioral correctness.
   - Check test coverage (SimpleCov) to ensure no regressions.

## Quality Standards
- Strictly adhere to the project's `.rubocop.yml`.
- Maintain high test coverage for all Service and Query objects.
- Prefer explicit composition over complex inheritance.
