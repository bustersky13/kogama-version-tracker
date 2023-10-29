## Kogama Version Tracker
This repository store old kogama versions information like size, uuid, il2cpp and binaries

you can view this informations in [version](version.md) or download the binaries in release section

## How we store new updates

Every 10 minutes, an AWS Lambda function triggers a [Kogama Version Check Action](https://github.com/bustersky13/kogama-version-tracker/actions), this action checks if the current www, br, and friends versions are present in version.md. If not, the workflow automatically downloads the versions, uploads them to release, and updates version.md with the respective information
