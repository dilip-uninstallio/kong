local typedefs = require "kong.db.schema.typedefs"


return {
  name = "key-auth",
  fields = {
    { consumer = typedefs.no_consumer },
    { config = {
        type = "record",
        nullable = false,
        fields = {
          { key_names = {
              type = "array",
              required = true,
              elements = typedefs.header_name,
              default = { "apikey" },
          }, },
          { hide_credentials = { type = "boolean", default = false }, },
          { anonymous = { type = "string", uuid = true, len_min = 0 }, },
          { key_in_body = { type = "boolean", default = false }, },
          { run_on_preflight = { type = "boolean", default = true }, },
        },
    }, },
  },
}
