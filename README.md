# GRAPHY

A sample [RoR](https://rubyonrails.org), [GraphQL](https://graphql.org) project used to explore best practices.

## DOCUMENTATION

Generate and serve the GraphQL Schema:

```
%> bundle exec rails graphql:schema:json
%> npx graphdoc -s doc/graphql/schema.json -o doc/graphql/schema --force
%> npx serve doc/graphql/schema
```

Generate a [Typescript](https://www.typescriptlang.org) [React Query](https://react-query.tanstack.com) client:

```
%> bundle exec rails graphql:schema:dump
%> npx graphql-docs-generator --schema doc/graphql/schema.json --output doc/graphql/operations.graphql --language graphql
%> npx graphql-codegen
```

## RUN

```
%> bundle exec rails s
%> npx parcel src/index.html
```

## PATTERNS

We want to consistently apply patterns across the API.

### NAMING

The tendency in GraphQL is to err on the side of many methods.
We follow the pattern of `nounQualifiers` for user readability.
Use the same structure throughout.

* `noun(id:)` get a Noun by id. e.g., challenge(id: 1)
* `nounByField(value:)` get a Noun by the Field with a value. e.g., userByEmail(value: 'foo@internet.com')
* `nounByFieldAndField(values:)` get a Noun by two Fields with two values. e.g., userByFirstNameAndLastName(values: ['Anthony', 'Shull'])
* `nouns` get a list of Noun. e.g., users
* `nounsSortedByField(direction:)` get a list of Nouns sorted by Field in order of direction. e.g., spacesSortedByCreatedAt(direction: 'DESC')
* `nounsFilteredByField(filter:)` get a list of Nouns filtered by Field with a filter. e.g., activitiesFilteredByUpdatedAt(filter: '>= Time.now') 

For mutations, we want to follow the pattern of `verbNoun`.
This is more readable and also helps distinguish queries from mutations.
Again, reuse the same words and structure.

* `createNoun()` creates a Noun
* `deleteNoun(id:)` deletes a Noun
* `updateNoun(id: , values:)`

### PAGINATION

We use [cursor-based pagination](https://graphql-ruby.org/pagination/cursors.html).

```graphql
query {
  users(first: 10) {
    nodes {
      id
      name
    }
    pageInfo {
      endCursor
      hasNextPage
    }
  }
}
```

### ERRORS

This is the standard GraphQL implementation of errors.

```json
{
  "data": "...",
  "errors" : [
    {
      "message": "",
      "locations": [ {} ],
      "path": [],
      "extensions": {
        "code": ""
      }
    }
  ]
}
```
