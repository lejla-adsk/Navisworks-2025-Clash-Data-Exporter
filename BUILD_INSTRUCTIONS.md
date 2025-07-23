# Build Instructions for Navisworks 2025 Clash Data Exporter

## For Mac Users

Since this project targets .NET Framework 4.8 (Windows-only), Mac users have several options:

### Option 1: Use GitHub Actions (Automated Build)
If you have this project in a GitHub repository, I can set up automated building using GitHub Actions that will build on Windows servers and provide you with the compiled DLL.

### Option 2: Docker with Windows Container
Use Docker Desktop with Windows containers to build the project.

### Option 3: Use a Windows Machine
- **Local Windows machine**
- **Windows VM** (Parallels, VMware, VirtualBox)
- **Remote Windows machine** or cloud instance

### Option 4: Ask Someone with Windows
Since you only need the compiled `ClashData.dll` file, someone with Windows can build it and share the output with you.

## For Windows Users

### Prerequisites
- **Navisworks Manage 2025** (for the DLL references)
- **Visual Studio 2019+** OR **Visual Studio Build Tools**
- **.NET Framework 4.8 Developer Pack**

### Method 1: Visual Studio (GUI)
1. Open `ClashData.sln`
2. Build → Build Solution
3. Find output in `ClashData/bin/Release/`

### Method 2: Command Line (MSBuild)
```cmd
# Open Developer Command Prompt for Visual Studio
msbuild ClashData.sln /p:Configuration=Release /p:Platform="Any CPU"
```

### Method 3: Build Tools Only
Install Visual Studio Build Tools (smaller download):
```cmd
# Download from: https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022
# Then run:
msbuild ClashData.sln /p:Configuration=Release
```

## Output Files Needed for Deployment

After building, you need these files from the output directory:
```
ClashData.dll                 # Main plugin
en-US/AddinRibbon.xaml        # UI resources
Images/Data-Export-16.png     # Icons
Images/Data-Export-32.png
Resources/Project_Disciplines.txt
```

## Alternative: Pre-built Release

If building is not feasible, the compiled plugin can be shared as a release package containing just the necessary files for deployment to Navisworks 2025. 