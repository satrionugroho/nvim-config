local language = {'elixir', 'golang', 'javascript'}

for _, lang in ipairs(language) do
  require('language-specific.' .. lang)
end
