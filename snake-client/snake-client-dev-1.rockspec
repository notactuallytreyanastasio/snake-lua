package = 'snake-client'
version = 'dev-1'
rockspec_format = '3.0'
description = {
}
build = {
    type = 'builtin',
    copy_directories = {'.'},
    modules = {},
}
dependencies = {
    'lua >= 5.1',
    'temper-core == 0.6.0',
    'std == 0.6.0',
}
source = {
    url = 'file:///home/runner/work/temper_snake/temper_snake/temper.out/lua/snake-client/snake-client.zip',
}
