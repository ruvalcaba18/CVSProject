# iOS Developer Candidate Code Challenge

Introduction

Congratulations on advancing to the next phase of our interview process! This code challenge is designed to evaluate your skills as an iOS developer. We appreciate your commitment to spending no more than 3 hours on this task to demonstrate your abilities and compatibility with our iOS development team.

# Task

Your challenge is to create an iPhone application from scratch that enables users to search Flickr for images. 
The app should have a user-friendly interface with a search bar and a list or grid below to display thumbnail images.
Users should be able to enter text into the search bar and see images matching the search string. 
Utilize the [Flickr API](https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=porcupine), replacing "porcupine" with the user's search word(s).

# Acceptance Criteria

Search results should update after each keystroke or change to the search string.
Each item in the search results must display the image (or thumbnail).
Tapping on an image should reveal a detail view containing the image, title, width, height, and other information from the JSON response.
The user interface must remain responsive at all times, adhering to [Apple's Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/designing-for-ios).

# Rules
Write all code (excluding open-source libraries or auto-generated code) in Swift.
Objective-C experience is valued, but Swift is required.
UIKit or SwiftUI for the UI is acceptable.
Use any architectures, patterns, or techniques suitable for the task.
Internet usage for help is allowed.
Open-source libraries and dependency managers like Swift Package Manager, CocoaPods, or Carthage are permitted.

# Extra Credit

## Consider these additional features if time allows:
- Support landscape orientation
- Dynamic text support
- VoiceOver support
- Unit or UI tests
- Add a button in the detail view to share the image and metadata
- Animate the image transition from the list/grid view to the detail view


# What We're Looking For
## During the code review, we'll focus on:

- Excellent communication skills
- Safe Swift code practices
- Adherence to industry-standard patterns and techniques
- Well-formatted, clean, and consistent code with proper naming
- Proper use of SwiftUI or auto layout for various screen sizes
- API calls and routines that don't block the main thread
- Code without retain cycles or memory leaks
- Proper error handling
- [Understanding and implementation of Apple’s Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
- [Safe Swift Code](https://masterofcode.com/blog/4-ways-apples-new-programming-language-swift-enhances-safety)
- Smart decisions regarding cellular bandwidth, application memory, and battery use
- We expect you to fully comprehend every line of code in the app and explain its functionality and rationale during the review.



