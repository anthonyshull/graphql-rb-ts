require 'graphql/rake_task'

GraphQL::RakeTask.new(schema_name: 'GraphySchema',
                      idl_outfile: 'doc/graphql/schema.graphql',
                      json_outfile: 'doc/graphql/schema.json')
