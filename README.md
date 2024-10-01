

<div align='center'>

# Real-Time Speedometer for SA:MP
_Classic and Nostalgic, this is what you are looking for, Enjoy a cleaner, classic textdraw experience, but in real-time!_ <br>

![auto-tacho-1460905752f76](https://github.com/user-attachments/assets/77827fb6-5494-4c08-a925-831b4860e1c8)

![MoonLoader](https://img.shields.io/badge/MoonLoader-compatible-green.svg) ![Lua](https://img.shields.io/badge/lua-5.1-purple.svg)  ![Platform](https://img.shields.io/badge/platform-SAMP-darkgreen.svg)

</div> <br>

> Youtube Video: https://www.youtube.com/watch?v=GEejDGRz3rA

## Description
This Lua script replaces your server's textdraws with a real-time speedometer that updates smoothly as you drive in any vehicle. It dynamically detects and updates the speed textdraws, providing you with an accurate display of your vehicle's speed without any noticeable lag, If you're tired of laggy or delayed speed updates in your SA server, this mod is the perfect solution. Whether you're in a high-speed chase or just cruising around, the real-time speedometer delivers smooth and accurate speed readouts directly on your screen, giving you more control and enhancing your driving experience.

## Features
- The script detects textdraws such as "Speed: 0 Km/h", "Viteza: 0 Km/h", "0", and "KM/H", and updates them in real-time as you drive.
- Experience smooth and seamless updates to your speed display without any interruptions or delays.
- The script automatically finds and replaces the necessary textdraws with your current vehicle speed, allowing you to continue using your server's existing textdraws.

## How It Works
This script hooks into your existing SA:MP server's textdraws and replaces the static text (like "Speed: 0 Km/h") with dynamic values based on your vehicle's current speed. By monitoring the player's speed, the script keeps the textdraws updated in real-time, enhancing your gameplay experience.

- **Example Textdraws**: The speedometer updates formats such as "Speed: 0 Km/h" or "Viteza: 0 Km/h" to display the actual speed.
> ![gta_sa_nEAyWJfELN](https://github.com/user-attachments/assets/5b3e9218-fdb0-495b-bb6e-9989ec4b8186)

- **Speed Warnings**: When your speed exceeds certain thresholds (100 Km/h and 150 Km/h), the script changes the text color to yellow or red for better visibility.
> ![gta_sa_O8K7bcYi7z](https://github.com/user-attachments/assets/7a3d732a-bef9-44c5-b831-7681c2479363)


3. ## Installation
1. Download and install [MoonLoader](https://blast.hk/threads/13305/).
2. Place the Lua script file into the `moonloader` folder within your GTA SA directory.
3. Place the `.lua` file in your MoonLoader `scripts` folder.
4. Start your SA:MP server and enjoy the real-time speedometer!
