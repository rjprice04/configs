print("settting java lsp")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '~/motus/projects/' .. project_name
local config = {

  cmd = {
      'java',
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xms1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

      '-jar', '~/.jdtl/jdt-language-server-latest/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
      '-configuration' '~/.jdtl/jdt-language-server-latest/config_mac'
      '-data', workspace_dir
  },

  root_dir = require('jdtls.setup').find_root({'.git', '.mvnw', 'gradlew'}),

  settings = {
    java = {}
  },

  init_options = {
    bundles = {}
  },
}

require('jdtls').start_or_attach(confg)