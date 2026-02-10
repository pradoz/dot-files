local ls = require('luasnip')

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local function rust_fn(trigger, prefix, return_type)
    prefix = prefix or ''
    local nodes = {
        t(prefix .. 'fn '),
        i(1, 'name'),
        t('('),
        i(2),
        t(') '),
    }

    if return_type then
        table.insert(nodes, t('-> '))
        table.insert(nodes, i(3, return_type))
        table.insert(nodes, t(' '))
    else
        table.insert(nodes, i(3))
    end

    table.insert(nodes, t({ '{', '\t' }))
    table.insert(nodes, i(0))
    table.insert(nodes, t({ '', '}' }))

    return s(trigger, nodes)
end

ls.add_snippets('rust', {
    rust_fn('pubfn', 'pub '),
    rust_fn('fnr', '', 'ReturnType'),
    rust_fn('pubfnr', 'pub ', 'ReturnType'),
    s('test', {
        t({ '#[test]', 'fn ' }),
        i(1, 'foo'),
        t({ '() {', '\t' }),
        i(2, 'todo!();'),
        t({ '', '}' }),
    }),
})
