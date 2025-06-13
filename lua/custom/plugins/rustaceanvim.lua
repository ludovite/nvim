-- rustaceanvim
return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended (to avoid breaking changes)
  lazy = false, -- This plugin is already lazy
  opt = {
    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
}
-- vim: ts=2 sts=2 sw=2 et
