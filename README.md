# Snake (Lua)

A terminal snake game written in Lua — auto-generated from [Temper](https://temperlang.dev) source code.

## How to Play

**Prerequisites:** Lua 5.1+

```bash
git clone https://github.com/notactuallytreyanastasio/snake-lua.git
cd snake-lua
lua snake-game/init.lua
```

Use **w/a/s/d** keys to steer the snake. No Enter key needed — input is raw mode.

## The Story

This code was not written by a human in Lua. It was written once in [Temper](https://github.com/temperlang/temper) — a programming language that compiles to 6 other languages — and then automatically compiled and published here by CI.

The same snake game exists in 6 languages, all generated from [one Temper source](https://github.com/notactuallytreyanastasio/temper_snake):

| Language | Repository |
|----------|------------|
| JavaScript | [snake-js](https://github.com/notactuallytreyanastasio/snake-js) |
| Python | [snake-python](https://github.com/notactuallytreyanastasio/snake-python) |
| **Lua** | **snake-lua** (you are here) |
| Rust | [snake-rust](https://github.com/notactuallytreyanastasio/snake-rust) |
| C# | [snake-csharp](https://github.com/notactuallytreyanastasio/snake-csharp) |
| Java | [snake-java](https://github.com/notactuallytreyanastasio/snake-java) |

## What We Had to Do to the Compiler

Temper had no way to pause execution or read user input. The only I/O primitive was `console.log()`. To write a game loop that ticks every 200ms and reads keyboard input, we added `sleep()` and `readLine()` to the language itself — across all six compilation backends.

The compiler changes live on the [`do-crimes-to-play-snake`](https://github.com/temperlang/temper/tree/do-crimes-to-play-snake) branch ([PR #376](https://github.com/temperlang/temper/pull/376)).

### The Temper Declaration

Two new `@connected` primitives were added to `std/io` in commit [`0f31c89`](https://github.com/temperlang/temper/commit/0f31c89fabc1c938c6a4d2e72c80af658034aa17):

```temper
@connected("stdSleep")
export let sleep(ms: Int): Promise<Empty> { panic() }

@connected("stdReadLine")
export let readLine(): Promise<String?> { panic() }
```

The `@connected` decorator tells the compiler to replace the `panic()` body with a backend-specific native implementation at compile time.

### What Changed for Lua

Lua is the most interesting backend. It has no Promises, no event loop, and no async/await. The Lua translator compiles `async { ... }` to `temper.TODO(generatorFactory)` and `await expr` to `expr:await()`. Previously, `temper.TODO` was undefined — it hit the `__index` metamethod fallback, which errored with `"bad connected key: TODO"`.

No Kotlin compiler changes were needed. The default `else` clause in `LuaSupportNetwork.translateConnectedReference` converts `"stdSleep"` to `"stdsleep"` via `.replace("::", "_").lowercase()`, which matches `temper.stdsleep()` automatically.

All changes were to a single file: **[`temper-core/init.lua`](https://github.com/temperlang/temper/blob/0f31c89fabc1c938c6a4d2e72c80af658034aa17/be-lua/src/commonMain/resources/lang/temper/be/lua/temper-core/init.lua)** (this file ships inside `temper-core/` in this repo).

**Async launcher stub** — makes `async { }` blocks actually execute:

```lua
function temper.TODO(generatorFactory)
    local gen = generatorFactory()
    local co = gen()
end
```

This creates the generator and steps it once via `coroutine.wrap()`, which runs the entire body synchronously — because all awaited operations in Lua complete immediately (they block).

**Sleep and readLine** — synchronous implementations returning tables with `:await()` methods so the compiled `await` translation works:

```lua
local function make_resolved(value)
    return { await = function(self) return value end }
end

function temper.stdsleep(ms)
    local sec = ms / 1000
    local ok, socket = pcall(require, "socket")
    if ok then
        socket.sleep(sec)
    else
        os.execute("sleep " .. string.format("%.3f", sec))
    end
    return make_resolved(nil)
end

function temper.stdreadline()
    local line = io.read("*l")
    return make_resolved(line)
end
```

`stdsleep` tries LuaSocket first for sub-second precision, falling back to `os.execute("sleep ...")` on systems without it. `stdreadline` reads from stdin via `io.read("*l")`. Both return a table whose `:await()` method returns the value immediately — the sleep already happened, the line was already read. Everything runs on one thread, blocking. It works.

## How It Works

1. The game logic lives in [`temper_snake`](https://github.com/notactuallytreyanastasio/temper_snake) as `.temper.md` files
2. A custom Temper compiler (branch [`do-crimes-to-play-snake`](https://github.com/temperlang/temper/tree/do-crimes-to-play-snake)) adds the `sleep()` and `readLine()` I/O primitives
3. GitHub Actions builds the compiler, compiles the game for all 6 backends, runs tests
4. If tests pass, the compiled output is automatically pushed to this repo

Every push to the source repo triggers a fresh build. This code is always in sync.

## Source

[notactuallytreyanastasio/temper_snake](https://github.com/notactuallytreyanastasio/temper_snake)
