# NoLifeWzToNx

A command-line tool written in C++ that converts MapleStory **WZ** (and **IMG**) files into the more efficient **[NX format](https://nxformat.github.io/)**. Part of the [NoLifeStory](https://github.com/NoLifeStory) project.

---

## Prerequisites

| Requirement | Details |
|---|---|
| **Visual Studio 2019** (Community or higher) | [Download](https://visualstudio.microsoft.com/) |
| **Windows SDK 8.1** | [Download](https://developer.microsoft.com/en-us/windows/downloads/sdk-archive) |
| **Platform Toolset v140** | Installed via the Visual Studio Installer ("C++ Windows XP Support for VS 2017 (v141) tools" workload or the v140 build tools) |

> **Note:** This project has also been successfully built and tested with **Visual Studio 2026 Community (v18.2.1)**.

> All third-party libraries (libsquish, LZ4, zlib) are already included in the `includes/` directory — no extra downloads needed.

---

## Building

1. Open **NoLifeWzToNx.sln** in Visual Studio.
2. Verify the project is configured for **Windows SDK 8.1** and **Platform Toolset v140**:
   - Right-click the **NoLifeWzToNx** project → **Properties**
   - Confirm **Platform: x64**
3. Build the solution in **Release** mode for best performance: **Build → Build Solution** (or <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>B</kbd>).

The compiled binary will be placed in `x64/Release/`.

> **Tip:** Release mode is **significantly** faster than Debug — file conversions that take minutes in Debug finish in seconds in Release.

---

## Usage

### 1. Prepare your WZ files

Place your `.wz` files inside the `files/` folder in the project root (create it if it doesn't exist).

> **⚠ Warning:** Do **not** include `Data.wz` in the conversion. It is not a standard WZ file and will cause errors.

### 2. Convert WZ to NX

**Option A — Using the batch file (recommended)**

Double-click **convert.bat** in the project root. It runs:

```
x64\Release\NoLifeWzToNx files -c
```

**Option B — From the command line**

```
NoLifeWzToNx <path> [options]
```

`<path>` can be a single `.wz`/`.img` file **or** a directory (all files within it will be converted recursively).

**Convert a single file:**
```
x64\Release\NoLifeWzToNx files\Base.wz -c
```

**Convert all files in a folder:**
```
x64\Release\NoLifeWzToNx files -c
```

### 3. View WZ file information

To check the format and version of your WZ files without converting them:

**Option A — Using the batch file**

Double-click **info.bat** in the project root.

**Option B — From the command line**

```
NoLifeWzToNx <path> -i
```

Example output:
```
File: files\Base.wz
Description: Package file v1.0 Copyright 2002 Wizet, ZMS
Data offset: 0x3c
Format: New (64-bit, no version hash)
Version: Cannot be determined from file
         (New format WZ files do not store the patch version.)
         Likely v170+ / v200+ era client.
```

For legacy WZ files (pre-v170), the tool will brute-force the encrypted version hash and report candidate version numbers.

### Command-line options

| Flag | Description |
|---|---|
| `-c`, `--client` | Convert in **client** mode (includes image/sound data) |
| `-s`, `--server` | Convert in **server** mode (skips image/sound data) |
| `-h`, `--lz4hc` | Use **LZ4 HC** (high-compression) for smaller output files at the cost of slower conversion |
| `-i`, `--info` | Display WZ file information (format, version) without converting |

### Output

Each `.wz` file produces a corresponding `.nx` file in the same directory. Conversion time is printed to the console when complete.

### WZ format compatibility

| Format | Versions | Status |
|---|---|---|
| Legacy (with version hash) | Pre-v170 (e.g. v83, v112) | Supported |
| New 64-bit (no version hash) | v170+ / v200+ era | Supported |

Files have been successfully converted and tested using **MapleStory v229.2**.

---

## Dependencies

All dependencies are bundled in the repository under `includes/`.

| Library | Purpose | Source |
|---|---|---|
| **libsquish** | DXT texture decompression | [GitHub](https://github.com/Cavewhere/squish) |
| **LZ4** | Fast lossless compression | [GitHub](https://github.com/lz4/lz4/releases) |
| **zlib** | General-purpose compression | [GitHub](https://github.com/maxirmx/Dist_zlib) |

---

## NX Format Specification

Full documentation for the NX binary format is available at **[nxformat.github.io](https://nxformat.github.io/)**.

---

## License

This project is licensed under the **GNU Affero General Public License v3.0** — see the source file headers for details.

Copyright &copy; 2014-2020 Peter Atashian, Ryan Payton