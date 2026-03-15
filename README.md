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

## What Is This?

This code was not written by a human in Lua. It was written once in [Temper](https://temperlang.dev) — a programming language that compiles to JavaScript, Python, Lua, Rust, Java, and C# — and then automatically compiled to Lua and published here by CI.

Temper had no way to pause execution or read input. The only I/O was `console.log()`. To play snake, we had to add `sleep(ms)` and `readLine()` to the language itself — modifying the Temper compiler across all six backends.

## What Changed in the Temper Compiler for Lua

Lua was the hardest backend. It has no Promises, no event loop, and no threads. The initial implementation compiled `async {}` to `temper.TODO()` — a stub that created a coroutine but never ran it.

**Compiler changes:**
- `LuaSupportNetwork.kt`: `BuiltinOperatorId.Async` mapped from `"TODO"` to `"async_launch"`
- `LuaTranslator.kt`: emits `temper.run_scheduler()` after all top-level code to drive the cooperative loop

**Runtime** (`temper-core/init.lua`): A full cooperative coroutine scheduler. Three promise types (`PROMISE_SLEEP`, `PROMISE_READLINE`, `PROMISE_RESOLVED`) where `:await()` calls `coroutine.yield(self)` to hand control back to the scheduler. `stdsleep(ms)` returns a deadline-based promise instead of blocking. `stdreadline()` returns a readline promise. `run_scheduler()` runs round-robin: checks sleep deadlines against wall-clock time, polls for non-blocking input via `stty min 0 time 0`, and resumes ready coroutines. When only readline tasks remain (game over), it exits. A 10ms sleep prevents busy-spinning.

This is ~120 lines of Lua implementing what other languages get from their runtime for free.

## All 6 Backends

The same snake game exists in 6 languages, all generated from [one Temper source](https://github.com/notactuallytreyanastasio/temper_snake):

| Language | Repository |
|----------|------------|
| JavaScript | [snake-js](https://github.com/notactuallytreyanastasio/snake-js) |
| Python | [snake-python](https://github.com/notactuallytreyanastasio/snake-python) |
| Lua | [snake-lua](https://github.com/notactuallytreyanastasio/snake-lua) |
| Rust | [snake-rust](https://github.com/notactuallytreyanastasio/snake-rust) |
| C# | [snake-csharp](https://github.com/notactuallytreyanastasio/snake-csharp) |
| Java | [snake-java](https://github.com/notactuallytreyanastasio/snake-java) |

## Source

- Game source: [notactuallytreyanastasio/temper_snake](https://github.com/notactuallytreyanastasio/temper_snake)
- Compiler branch: [`do-crimes-to-play-snake`](https://github.com/temperlang/temper/tree/do-crimes-to-play-snake) ([PR #376](https://github.com/temperlang/temper/pull/376))

---

*Auto-generated from commit [`bc2e9fd57ff0765930c54c5a8c0b6c14ad2c46a1`](https://github.com/notactuallytreyanastasio/temper_snake/commit/bc2e9fd57ff0765930c54c5a8c0b6c14ad2c46a1)*
