## Kogama Version Tracker
This repository stores old Kogama version information like size, uuid, il2cpp and binaries.

You can view this information in [version](version.md) or download the binaries in the release section.

## ⚠️ Kogama Server Shutdown - 2026-05-28

**On May 28, 2026, Kogama shut down its servers permanently.**
As a result, the automatic extraction pipeline stopped functioning at `2026-05-28T12:30:12Z`. No new versions will be tracked from this point forward.

## How we stored new updates

Every 10 minutes, an AWS Lambda function triggered a [Kogama Version Check Action](https://github.com/bustersky13/kogama-version-tracker/actions). This action checked if the current www, br, and friends versions were present in version.md. If not, the workflow automatically downloaded the versions, uploaded them to release, and updated version.md with the respective information.

## Planned Restructuring

The next step for this project is to reorganize and improve the repository structure:

- **Origin classification** - each version will indicate where it came from: official Kogama API, Wayback Machine, or community submission.
- **Per-version releases** - instead of a single release containing all binaries, releases will be organized by version to make management and navigation easier.
- **`versions.json`** - a structured JSON file containing all relevant metadata for each tracked version, including name, version number, origin, date, and other useful fields.

> **Note:** Applications using fixed/direct release asset links do not need to worry. This restructuring will **not** break existing links - asset URLs will remain valid.

## Regama - Reviving Kogama

[**Regama**](https://discord.gg/nFt9y2c2Rz) is a community project aiming to revive Kogama as it was back in its prime (~2015). If you're interested in helping or following the progress, join their discord server:

- [Discord](https://discord.gg/nFt9y2c2Rz)
- [Playregama](https://playregama.com/)
