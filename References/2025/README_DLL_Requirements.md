# Navisworks 2025 DLL Requirements

## Required Files
Copy the following DLL files from your **Navisworks 2025 installation** to this folder:

### Core Navisworks API DLLs
- `Autodesk.Navisworks.Api.dll`
- `Autodesk.Navisworks.Automation.dll` 
- `Autodesk.Navisworks.Clash.dll`
- `navisworks.gui.roamer.dll`
- `AdWindows.dll`

### Typical Source Location
These files are typically found in:
```
C:\Program Files\Autodesk\Navisworks Manage 2025\
```

### Notes
- These DLLs are proprietary Autodesk files and must come from a legitimate Navisworks 2025 installation
- The exact version numbers may vary based on your specific Navisworks 2025 update/build
- Do not modify the `Private=False` settings in the project file - this ensures the DLLs are not copied to the output directory

### After Copying DLLs
Once you've copied these DLLs to this folder, the project should compile successfully for Navisworks 2025. 