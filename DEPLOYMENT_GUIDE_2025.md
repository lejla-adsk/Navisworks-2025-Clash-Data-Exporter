# Navisworks 2025 Clash Data Exporter - Deployment Guide

This guide provides step-by-step instructions for deploying the Clash Data Exporter add-in to Navisworks 2025.

## Quick Deployment Checklist

- [ ] Navisworks Manage 2025 is installed
- [ ] You have the 5 required DLL files from Navisworks 2025
- [ ] Project compiles without errors
- [ ] Plugin folder created in Navisworks 2025 installation
- [ ] Files copied to plugin folder
- [ ] Navisworks restarted and plugin appears in ribbon

## Option 1: Full Development Setup

### Prerequisites
- Visual Studio 2019 or later
- Navisworks Manage 2025
- .NET Framework 4.8

### Steps
1. **Get Required DLLs**
   ```
   Source: C:\Program Files\Autodesk\Navisworks Manage 2025\
   Files needed:
   - Autodesk.Navisworks.Api.dll
   - Autodesk.Navisworks.Automation.dll  
   - Autodesk.Navisworks.Clash.dll
   - navisworks.gui.roamer.dll
   - AdWindows.dll
   
   Destination: References/2025/
   ```

2. **Build Project**
   - Open `ClashData.sln` in Visual Studio
   - Build → Build Solution (or Ctrl+Shift+B)
   - Check for any compilation errors

3. **Deploy to Navisworks**
   - Navigate to build output: `ClashData/bin/Debug/` or `ClashData/bin/Release/`
   - Copy these items:
     - `ClashData.dll`
     - `en-US/` folder
     - `Images/` folder
     - `Resources/` folder

4. **Install Plugin**
   - Create folder: `C:\Program Files\Autodesk\Navisworks Manage 2025\Plugins\ClashData\`
   - Paste copied files into this folder
   - Restart Navisworks Manage 2025

## Option 2: Manual Installation (Pre-compiled)

If someone else has compiled the plugin for you:

### Files You Need
```
ClashData.dll
en-US/
  └── AddinRibbon.xaml
Images/
  ├── Data-Export-16.png
  └── Data-Export-32.png
Resources/
  └── Project_Disciplines.txt
```

### Installation Steps
1. Create plugin directory:
   ```
   C:\Program Files\Autodesk\Navisworks Manage 2025\Plugins\ClashData\
   ```

2. Copy all files to this directory

3. Restart Navisworks Manage 2025

4. Look for "Export Clash Data" in the VDC Add-ins ribbon tab

## Verification

### Check Plugin Loaded
1. Open Navisworks Manage 2025
2. Look for the **VDC Add-ins** tab in the ribbon
3. You should see an **Export Clash Data** button with the data export icon

### Test Functionality
1. Load a Navisworks file with clash data
2. Click **Export Clash Data**
3. The user interface should appear allowing you to:
   - Select focus zone
   - Choose project disciplines
   - Specify export location

## Troubleshooting

### Plugin Not Appearing
- **Check folder structure**: Ensure files are in the correct plugin directory
- **Restart Navisworks**: Always restart after copying files
- **Check .NET Framework**: Ensure .NET Framework 4.8 is installed

### Compilation Errors
- **Missing references**: Verify all 5 DLL files are in `References/2025/`
- **Wrong .NET version**: Project targets .NET Framework 4.8
- **Assembly conflicts**: Clean and rebuild the solution

### Runtime Errors
- **Access denied**: Run Navisworks as administrator if needed
- **DLL conflicts**: Ensure you're using 2025 DLLs, not older versions
- **Missing dependencies**: Check that all supporting files (Images, Resources) are copied

## Advanced Configuration

### Custom Installation Path
If Navisworks is installed in a different location, adjust the plugin path accordingly:
```
[Navisworks Installation Path]\Plugins\ClashData\
```

### Multiple Navisworks Versions
You can install this plugin alongside other versions. Each version should have its own plugin folder:
- `Navisworks Manage 2023\Plugins\ClashData\`
- `Navisworks Manage 2024\Plugins\ClashData\`
- `Navisworks Manage 2025\Plugins\ClashData\`

## Support

### Version Information
- **Plugin Version**: 2.0.0.0
- **Target Framework**: .NET Framework 4.8
- **Compatible with**: Navisworks Manage 2025

### Common Issues
1. **"Could not load file or assembly"** - Missing or incorrect DLL references
2. **"Access to the path is denied"** - Insufficient permissions for plugin directory
3. **Plugin not visible** - Incorrect folder structure or missing manifest files

For additional support, check the original project documentation or create an issue in the project repository. 