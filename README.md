# NewsList
NewsList repo is created for demo purpose only and its in progress as of now.

	App is using following API to get the news/sample data:
  https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=a8fabd9ff4234c82aad08eaaa4ea17a0&pageSize=5&page=1

# UI Layout - Screen Info:
	• Header Title: Todays News
	• Right navbar button: Title will be ‘French’ if content of the screen is in English, to change in French. And vice versa.
# UI Layout - Article cell:
	• Title: <title>
	• Author: <author> 
	• Description: <description>
	• <Image on the left>

# Tasks 
1. App should load the articles from the given endpoint in a table view where each cell represents an article.
2. The static text (Title, Author and Description) should be Localized on tap of right nav-bar button. For eg. ‘Title’ text, not the value.

# How to Install/Run App
	1. Clone the repo or download the code on to a mac system.
	2. Open a new terminal window and goto NewsList under NewsList directory.
	3. Run pod install command.
	4. now open NewsList.xcworkspace file in Xcode.
	5. Select device/simulator on which you want to run the app.
	6. You might have to change/configure App Signing Settings to run the app on a device.
	6. Tap on trinagle button on the top or press Command + R buttons on the keyboard.
	7. Wait till Xcode comiples and run the app on the selected device/simulator.

# Improvements Needed/Pendding:
	1. UI and Unit tests for all cases.
	2. Search City - Add Left-Right swappable cards for Cities added by user.
