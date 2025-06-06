local ls = require("luasnip")

ls.add_snippets("all", require("snippets.llm_coding_prompt"))

vim.keymap.set({"i", "s"}, "<M-j>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, {silent = true})
