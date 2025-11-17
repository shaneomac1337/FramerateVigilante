# Build Instructions

## ✨ Easiest Way: GitHub Actions (No local setup required!)

The project is configured to build automatically using GitHub Actions. You don't need to install Visual Studio or anything locally!

### How to use:

1. **Push your code to GitHub** (if you haven't already)
   ```bash
   git add .
   git commit -m "Fixed Proton crash and syntax errors"
   git push
   ```

2. **GitHub will automatically build** the mod for you
   - Go to your repository on GitHub
   - Click the "Actions" tab
   - You'll see the build running
   - Wait for it to complete (usually 5-10 minutes)

3. **Download the built files**
   - Click on the completed workflow run
   - Scroll down to "Artifacts"
   - Download "FramerateVigilante-Build"
   - Extract the zip file - it contains all three .asi files!

### Creating a Release:

To create an official release with a download link:

```bash
git tag v1.1
git push origin v1.1
```

This will automatically:
- Build all versions
- Create a GitHub Release
- Attach a zip file with all the .asi files
- Add release notes

## 🔨 Local Build (Requires Visual Studio)

If you prefer to build locally:

### Prerequisites:
1. **Visual Studio 2019/2022** with "Desktop development with C++"
2. **plugin-sdk** from https://github.com/DK22Pac/plugin-sdk
3. Set environment variable: `PLUGIN_SDK_DIR=C:\path\to\plugin-sdk`

### Build:
- **Easy way:** Run `build.bat`
- **Manual way:** Open `FramerateVigilante.sln` and press F7

## 📦 What Gets Built

- `FramerateVigilante.SA.asi` - For GTA San Andreas
- `FramerateVigilante.VC.asi` - For GTA Vice City
- `FramerateVigilante.III.asi` - For GTA III

## 🐧 For Linux/Proton Users

The siren fix has been rewritten for Proton compatibility. If you still experience crashes, set `EnableSirenFix = 0` in `FramerateVigilante.ini`.
