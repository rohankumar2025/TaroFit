# TaroFit.ai
The version of TaroFit in this respository is not the same version as the TaroFit that is on the App Store. The goals of this new-and-improved version of TaroFit are as follows:
1. Provide a better overall user experience (more tabs, more features, more functionality)
2. Provide better authentication (Forgot My Password, Log In With Google, etc.)
3. Implement various AI tools to help users, particularly beginners, with exercise and nutrition
   (Examples: Give a list of tips/cues for form for any exercise, Estimate a user's body fat percentage based on a progress photo, etc.)
4. Start process of converting TaroFit into a social media-like platform allowing users to connect with friends and hold each other accountable

Currently, most of this repo is front-end focused. Features that are added/implemented will be shown in the Changelog below.

# Changelog
July 18, 2023: Created entire front-end for main Dashboard view and set up Footer for entire app.

July 19, 2023: Began creating front-end for Charts/Nutrition view and set up json with GPT responses for exercise form of > 350 unique exercises.

# TaroFit (original)
![Simulator Screenshot - iPhone 14 Pro - 2023-07-19 at 01 09 17](https://github.com/rohankumar2025/TaroFit/assets/91754197/8ad970ba-617b-4810-852d-a8926fef02ea)
The main Dashboard page of TaroFit displays the user's calorie goal as well as the number of calories they have eaten using a custom circular bar. Users can input their daily calories using either the plus at the bottom of the screen or using the quicklinks provided in the Dashboard page.

![Simulator Screenshot - iPhone 14 Pro - 2023-07-19 at 01 08 31](https://github.com/rohankumar2025/TaroFit/assets/91754197/e22e2369-0e94-4b16-8a4a-3011f14a43e5)
![Simulator Screenshot - iPhone 14 Pro - 2023-07-19 at 01 08 39](https://github.com/rohankumar2025/TaroFit/assets/91754197/e417c799-0825-492c-b9a6-a5bc97816c87)
Users also have access to a variety of graphs ranging from 1 week to All Time for both their daily Calorie Intake and their daily Weigh-ins.

![Simulator Screenshot - iPhone 14 Pro - 2023-07-19 at 01 08 43](https://github.com/rohankumar2025/TaroFit/assets/91754197/2dac5c83-fbd3-4818-a378-263d60642f4c)
![Simulator Screenshot - iPhone 14 Pro - 2023-07-19 at 01 08 55](https://github.com/rohankumar2025/TaroFit/assets/91754197/690da94f-646d-4e74-803b-399240a5022c)
Users also have access to virtually infinite core circuit workouts. They can change the difficulty using the slider on the bottom of the screen and can shuffle the exercises used using the shuffle button. For each exercise in the circuit, there is a video demonstration, showing the user how to properly perform the exercise. There is also a live timer with sound effects giving live feedback to the user. 

The workout difficulty ranges from Novice which is essentially 30 seconds on 30 seconds off to Expert, which I can not even perform without taking long breaks.

![Simulator Screenshot - iPhone 14 Pro - 2023-07-19 at 01 09 13](https://github.com/rohankumar2025/TaroFit/assets/91754197/cc085ab9-4dc7-4d49-9f46-f86b38684057)
Lastly, the user is able to view a calendar showcasing how often they have been logging in to the app and properly using it. They get a purple ribbon next to the date if they logged in that day and performed any task. There is also a golden star given on days in which the user successfully performed all three of the following:
1. Logged calories for the day and remained under the corresponding calorie goal
2. Logged their weight for the day
3. Performed any core circuit for the day

Overall, this original version of the app is usable and extremely simple hence user-friendly. There are many improvements that can be made and overall, I found that starting from scratch was the best way to approach this project long-term.
