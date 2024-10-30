<h1 align="center">
    Laboratory Work 5
</h1>

<h2 style="border-bottom: none;">Instructions for Windows:</h2>

- Download <a href="https://visualstudio.microsoft.com/downloads/">Visual Studio</a> to run the project on Windows.
- Download <a href="https://www.postman.com/downloads/">Cmake</a> to compile the program.

1. **Open Visual Studio.**

2. **Clone the Repository:**

   Open the terminal and run the following command:

   ```bash
   git clone https://github.com/DaniilKalts/iitu-labs/
   ```

3. **Compile the Project with CMake:**

   In the terminal, navigate to the project location and run the following commands to build the project:

   ```bash
   cmake -Bbuild
   cmake --build build
   ```

4. **Open the Solution:**

   Navigate to the `build` folder, and double-click on the `AlgoProgLab.sln` file to open it in Visual Studio.

5. **Run the Program:**

   In Visual Studio, right-click on `AlgoProgLab` in the Solution Explorer, and select **Debug -> Start Without Debugging** to run the program.

<h2 style="border-bottom: none;">Instructions for proud Arch Users (btw):</h2>

1. Install the necessery packages:

   ```
   sudo pacman -S cmake base-devel
   ```

2. **Clone the Repository:**

   Open the terminal and run the following command:

   ```bash
   git clone https://github.com/DaniilKalts/iitu-labs/
   ```

3. **Compile the Project with CMake:**

   In the terminal, navigate to the project location and run the following commands to build the project:

   ```bash
   mkdir build
   cd build
   cmake ..
   make
   ```

4. **Run the Program:**

   In the terminal inside of build folder, run the following command to run the project:

   ```bash
   ./AlgoProgLab
   ```
