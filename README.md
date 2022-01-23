# No Place to Go (NP2G)

[No Place to Go](https://www.no-place-to-go.com) was a socially distanced haunted house running in October 2020. I was commisioned to develop the iOS app to incorporate installation-specific content and coordinate the motion of single-car groups rotating through five sites. I worked with the project directors and all 15 artists (and artist groups) to realize their visions for a unique immersive experience.

I vividly remember calling every artist group early on in the project. Almost everyone was initially unsure, even intimidated, by the idea of the app and the tech involved but I quickly broke through the ice and we had rich discussions about the project that made me say to myself, "I am so glad that this is my job."

The app targeted iOS 13.6 and was written exclusively in Swift and SwiftUI. Some of the main technical considerations were:

- Playing audio tracks while traveling between locations that would pause if controled by the user or if leaving the app to get directions. Utilizes `AVAudioPlayer` from `AVFoundation`.
- Working with an artist to quickly upload photos via FTP to a server that would ultimately be shown to the corresponding group after an in-app trigger. Utilizes `URLSession`.
- Using a matrix of "passwords" for each night of the event to unlock the app and start each group in the appropriate pre-planned location.  

## In Others' Words

> [T]ech master Bryan Costanza came on board to design an **app** to help audience members navigate their vehicles through the interactive elements of the individual installations. -- [Westword](https://www.westword.com/arts/no-place-to-go-is-a-queer-immersive-drive-through-haunted-house-11825848)


...

> There they’ll unlock a smartphone **app** (to be downloaded in advance) that guides their staggered, overlapping journeys through the otherworldly installations. [The Know, Denver Post](https://theknow-old.denverpost.com/2020/10/22/no-place-to-go-rainbow-militia-deaths-unraveling/247376/)

...

> We’d downloaded the NP2G **app**-designed by Bryan Costanza ahead of the event. An organizer walked up to the driver-seat window and gave us a secret code to enter into the **app**, which gave us directions to each stop on the route: five abandoned storefronts, shops and window displays through which we could watch performances safely through a barrier, all within a two-mile area within Wheat Ridge and the 40 West Arts District.
>
>The **app** also played narration voiced by James Brunt, whose voice guided us through the “no place,” weaving together the artists’ disjointed ideas and fears into a cohesive — if absurdist — narrative. A spooky score by Mike Clark provided the soundtrack to our journey as we drove from installation to installation, and at each stop, the **app** offered contactless, choice-based interactions with the installations. -- [Denverite](https://denverite.com/2020/10/20/no-zombies-or-jump-scares-this-artist-designed-haunted-house-gives-you-a-safe-way-to-process-day-to-day-fears/)

...

> The No Place to Go **App** designed by Bryan Costanza provides each car with a unique show route as well as a sound score designed by Mike Clark to accompany the audience as they drive between sites. The **App** also provides additional show information and custom-made interactions with the installations to create a contactless experience. -- [NP2G Press Release](https://www.no-place-to-go.com/2020/09/18/press-release-no-place-to-go-in-fearful-times/)



Intro
	What the project is
	Who the team members are
	Your role and contribution on the team
Situation
	How/why the problem exists
	Why the problem matters
Action
	The process you and your team took to get there
	UX Deliverables/activities done to help solve problem.
		Personas
		user research
		wireframes, etc
Results
	Stats, analytics
	User testing feedback
	Survey scores
	What you learned from the project