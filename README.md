# ICE GitHub Remote Lua Demo

Standalone static Lua download demonstration. This does not connect to PUBG, modify game packages, or provide a POST service.

## Public files

- Lua: https://raw.githubusercontent.com/woxICEx69/ice-remote-lua-demo/main/2.lua
- Health status: https://raw.githubusercontent.com/woxICEx69/ice-remote-lua-demo/main/health.json
- SHA-256 manifest: https://raw.githubusercontent.com/woxICEx69/ice-remote-lua-demo/main/manifest.json

Download the repository ZIP from GitHub, extract it, then run `TEST_WINDOWS.bat` on Windows to download and verify `2.lua` without executing it.

GitHub raw URLs support static GET downloads, not Cloudflare-style POST handlers or authentication. A SHA-256 hash stored alongside the file checks consistency but does not authenticate the publisher. Never store secret keys or confidential code in a public repository.
