# NoLifeWzToNx
A C++ project to convert WZ files to NX files

# Building
1. Open **NoLifeWzToNx.sln** in Visual Studio 2019 CE
2. Make sure to use **Windows SDK Version: 8.1** and **Platform Toolset: v140** (If you don't have these, download them.)
   * [Windows 8.1 SDK]
3. Press **Build** > **Build Solution** or **Ctrl + Shift + B**
4. After a successful build, right-click the **NoLifeWzToNx** project.
5. Click **Properties**
6. Make sure under **Configuration** is set to **Debug** and **Platform** is set to **x64**
7. Click on the **Debugging** tab
8. Under **Command Argument** type in **$(OutDir)files -c**
9. You can now run the program by pressing **Debug** > **Start Debugging**, **F5**, or by running **launch.bat** within the root directory.
10. Make sure all WZ files are present in the files folder before debugging:
   - Navigate to **x64** > **Debug**
   - Create a new folder named **files**
   - Place your WZ files in the **files** folder

# Dependencies
- [libsquish](https://github.com/Cavewhere/squish)
- [LZ4](https://github.com/lz4/lz4/releases)
- [zlib](https://github.com/maxirmx/Dist_zlib)

[Windows 8.1 SDK]:   https://developer.microsoft.com/en-us/windows/downloads/sdk-archive