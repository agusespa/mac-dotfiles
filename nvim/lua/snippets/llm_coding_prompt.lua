local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s(
    "llmprompt",
    fmt(
      [[
<prompt_structure>
  <role_assignment>
    {}
  </role_assignment>

  <task_description>
    {}
  </task_description>

  <goal>
    {}
  </goal>

  <constraints>
    {}
  </constraints>

  <code_input>
    {}
  </code_input>

  <output_format>
    {}
  </output_format>
</prompt_structure>
]],
      {
        i(1, "You are an expert <role_type> who specializes in <area_of_expertise>."),
        i(2, "Your task is to <action> by <method>."),
        i(3, "The primary goal is to <achieve_what> to ensure <desired_outcome>."),
        i(4, "Constraints: <list_of_constraints_or_rules>"),
        i(5, "<code_snippet>"),
        i(6, "Provide the solution as <format_type>."),
      }
    ),
    {
      wordTrig = true,
      desc = "Generate an interactive LLM coding prompt structure with samples",
    }
  ),
}
