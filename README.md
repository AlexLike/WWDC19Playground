# Build your personal CARD
#### A Swift Playground by Alexander Zank realized during March 2019.

## Introduction
"Build your personal CARD" leverages plenty of exciting Apple technologies to provide its users with a fun, yet easy to understand, experience in which they build their fancy, digital and interactive personal card with a ton of crazy and entertaining interactions and easter eggs.
As they progress through this short playground, its users learn the basics of Foundation's data types, the use of DateFormatter objects and how to make use of image literals inside of their code.

## Used Technology
To realize my idea, I've utilized many of Apple's powerful features and frameworks:
- Firstly, Swift Playground's APIs have been used to their fullest potential, allowing the user to interact with his creation in real time while modifying the code on the left side thanks to the PlaygroundLiveViewable and PlaygroundRemoteLiveViewProxyDelegate protocols. Input information is transferred seamlessly to the LiveView and doesn't interrupt the experience. User assessment encourages viewers and aids them with hints to help make choices.
- Secondly, the LiveView itself uses Auto Layout to move around and scale its contents: Stack Views make the positioning of buttons easier, and Constraints gave me precise control over what specifically the user sees.
- Additionally, CardView's pan & snap interaction was built using UIKit Dynamics and gesture recognizers. The result is a delightful and fun, physics- and spring-based experience, especially once paired with the appearing message on the last page.
- Furthermore, Core Graphics and Core Animation were used to back CardView's gradient layer leading to sharp colors and efficient rendering.
- Since Accessibility shall always be a top-priority in tech, AVFoundation enables the "Read it out" button that creates a readable version of the card and its interactive elements, e.g., the birthdate ActionView and reads it out.
- Lastly, rounding up the experience, is the user's ability to preview his card in the real world using ARKit and SceneKit. "Build your personal CARD" uses ARKits plane anchors to continuously update its perception of the world and place the card plane onto real objects like tables, chairs or stairs. The new auto lighting feature is used to its fullest potential to simulate a real texture on the card.

All in all, my Swift playground demonstrates how one can use many Apple technologies to create a fun and interactive experience that can be shared by everyone and played with at your own pace.


## License

>Copyright (c) 2018 Alexander Zank
>
>Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
>
>This license is only valid for code snippets for which no extra license information can be
found in this directory or its subdirectories.
>The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
>
>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
