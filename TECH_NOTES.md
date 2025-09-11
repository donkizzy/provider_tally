## Architecture

The application follows a simplified MVVM architecture designed for separation of concerns, making it easier to maintain, scale, and test.


### MVVM (Model-View-ViewModel)

**Model**: `BusinessModel, EntityType`

**View**: `HomePage, BusinessList, GenericCard`

**ViewModel**: `BusinessProvider ` (manages state + business logic)

### Key Architectural Decisions

1. Generic Design For Widget

Using `EntityType ` interface with `GenericCard<T extends EntityType>`
makes GenericCard highly reusable, type-safe, follows composition over inheritance


2. Provider State Management

`BusinessProvider ` with `ViewState ` enum allows for Predictable state transitions and easy testing,

3. Repository Pattern

`BusinessRepository ` with `StorageManager ` abstraction
follows clear seperations concerns like data sources, testable, follows single responsibility

4. Dependency Injection

Constructor injection with optional parameters for testing highly testable, flexible, follows SOLID principles

Trade-off: Manual DI vs auto-injection frameworks, but keeps it simple will migrate to a DI library like get_it as app scales


## Key Trade-offs Made


1. Manual DI vs Framework

Constructor injection with optional parameters
Trade-off: Simplicity vs advanced DI features
Impact: same performance with out extra dependency 


2. Using Share Preference over Hive or SQlite 

Simple data model and usecase ,shared preference works great with no need to setup a schema or box
Trade-off: easy setup compared to othors which require more code and setup


## Further Improvements


1. Improved Accessibility Support like adding semantic labels
2. Add Pagination for longer datasets
3. Add Remote error tracking tools like Crashlytics or Sentry
4. Migrate to a more robust caching solution if data scales pas curent implementation