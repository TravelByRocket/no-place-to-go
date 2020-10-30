//
//  Artists.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/27/20.
//

import SwiftUI

enum Artists: String {
    case NicoleBanowetz
    case MoeGram
    case Chrissy_Grace
    case StevenFrost
    case Thomas_Koko_Chris
    case Renee_HayleyD
    case Emily_Michaela
    case Nolan
    case HayleyK
}

struct artistbio: Identifiable {
    let name: String
    let pronouns: String
    let bio: String
    let urls: [String]
    let images: [Image]
    
    var id: String {name}
    
    static let alldirectors = [
        frankie,
        serena,
        kate
    ]
    
    static let allartists = [
        nolan,
        emilymichaela,
        moe,
        nicole,
        hayleyk,
        hayleyrenee,
        gracechrissy,
        steven
    ]
    
    static let nolan = artistbio(
        name: "nolan tredway",
        pronouns: "He/Him",
        bio: "Found covered in moss near the Korvik River, Nolan was raised in the Great North by a mountain and a burning forest. He learned the art of storytelling from his time among the Volkos, before studying art at the University of Nebraska and Fundacion Ortega y Gasset in Toledo, Spain. He creates surreal and symbolic worlds in painting, sculpture, puppetry and interactive media.",
        urls: ["nolantredway.com"],
        images: [Image("NolanTredway")]
    )
    
    static let emilymichaela = artistbio(
        name: "Michaela Mujica-Steiner and Emily Marie Passos Duffy",
        pronouns: "she/her/hers for both performers",
        bio: "Hemmed: Embodying Liminality\n\nThis creator-performer duo is composed of Michaela Mujica-Steiner and Emily Marie Passos Duffy. With backgrounds in a variety of performance art modalities including poetry, narrative writing, burlesque, and immersive soundscapes, the two endeavor to explore adaptive strategies, spaces of be/longing, and cultural assimilation as daughters of Latinx immigrants. Some of their collaborative work to date has included designing and performing in interactive landscapes for Boulder Burlesque’s The Seven Undeadly Sins: An Erotic Haunted House Experience, creating and performing a polyphonic multimedium piece in Writers for Migrant Justice as part of a national protest reading and fundraiser for Immigrant Families Together, co-teaching a 5-week Conscious Burlesque workshop, and co-choreographing and performing a duet in Condom Couture, a benefit for Boulder Valley Women’s Health. Their devised productions interrogate liminal spaces and weave together the frayed ends of identity, inheritance, and unperceived societal shadows.",
        urls: ["www.duffylala.com/",
               "instagram.com/duffylala",
               "facebook.com/emily.duffy.3914",
               "instagram.com/michaelagisela",
               "facebook.com/michaela.steiner.509"],
        images: [Image("MichaelaEmily")]
    )
    
    static let moe = artistbio(
        name: "Moe Gram",
        pronouns: "She, her, hers",
        bio: "Moe Gram, is a Denver based designer, artist, educator, and community organizer.  In 2014 she graduated with a Bachelor of Arts degree with a special focus in Studio Fine Art and a minor in Cultural Studies from California State University Bakersfield.   While conceptual design is a great love for Gram, she is most commonly known for her brightly colored abstract murals, texture heavy collage, and her complex maximalist immersive installation works. Currently Gram is the visual arts educator at STRIVE Prep Green Valley Ranch Middle School and sitting board member of Birdseed Collective.",
        urls: ["instagram.com/mi_moegram",
               "www.moegram.com"],
        images: [Image("MoeGram")]
    )
    
    static let nicole = artistbio(
        name: "Nicole Anona Banowetz",
        pronouns: "she/her",
        bio: "Nicole Banowetz creates sewn inflatable sculptures.  Nicole’s work is inspired by the natural world. She addresses human qualities while using the imagery she finds in the animal, plant, mineral, and bacterial worlds. She has made made installations inspired by bacteria, parasitic fungus, viruses, radiolaria, rotifers, horses, and rhinos. All these forms she recreates in soft inflatable sculptures, which she designs and sews on her sewing machine.    Nicole has shown locally in the Denver Art Museum, The Museum of Outdoor Arts, and Pirate Contemporary, and internationally in the Amsterdam Light Festival, Open Art in Sweden, the Kreuzberg Pavillon in Germany, and Gray Contemporary and the Silos in Sawyer Yards in Houston, Texas.  ",
        urls: ["www.nicolebanowetz.com",
               "www.instagram.com/nicolebanowetz"],
        images: [Image("NicoleBanowetz")]
    )
    
    static let hayleyk = artistbio(
        name: "Hayley Krichels",
        pronouns: "She/Her/Hers",
        bio: "Hayley Krichels is an artist and educator based in Denver, Colorado. After receiving her degree in Photography from Bard College, Krichels worked in art education programs at RedLine Contemporary Art Center, Clyfford Still Museum, and now Denver Public Schools. In her photography, she explores visual humor and the way artwork lives in our world. She also enjoys quilting her feelings and may someday share these creations with the world.",
        urls: ["instagram.com/halliekrickles",
               "www.hayleykrichels.com"],
        images: [Image("HayleyKrichels")]
    )
    
    static let mike = artistbio(
        name: "Mike Clark",
        pronouns: "He, him, his",
        bio: "Mike Clark is a Denver-based musician with more than 20 years of writing, perfoming, and recording. His earlier work reflects more singer-songwriter influenced music while his current material is largely instrumental and atmospheric music for film and performance art.",
        urls: ["newsjoe.bandcamp.com"],
        images: [Image("MikeClark")]
    )
    
    static let hayleyrenee = artistbio(
        name: "Hayley Dixon + Renee Marino",
        pronouns: "She/her & She/they",
        bio: "Hayley + Renee have been working together as creative collaborators since 2016, building creative spaces for people to celebrate life. Renee works in the realm of words, music, organizing, and publication. Hayley works in the medium of paper mache and absurd ideas, to bring joy and playfulness to spaces and events. Together, they have built immersive dance parties and have supported each other's creative endeavors along the way.\n\nBuilt with the desire to create, Hayley produces work that embodies nature and the vast unknowns of the imagination. Regarded as the AstroTurf Princess, she uses organic and artificial ingredients to transform spaces into strange worlds. Her mediums include: installation art, illustration, and event curation. Hayley co-produces a local Talent Show and builds installations for raves.\n\nWith a love for communication and connecting with other artists, Renee began making poetry and art zines. Her zinester spirit has since given way to Dirt Media, dirtmedia.org, an online platform, supporting artists and writers. She is on the Board of Directors for Street Wise Arts, a local non-profit, which advocates for and implements urban art, murals, and art education projects.",
        urls: ["hheyhhay.com","instagram.com/hheyhhay","dirtmedia.org","instagram.com/reneestee"],
        images: [Image("HayleyDixon"),Image("ReneeMarino")]
    )
    static let gracechrissy = artistbio(
        name: "Grace Cooper + Chrissy Espinoza",
        pronouns: "She/Her, She/Her",
        bio: """
        Grace Cooper is a self taught artist and musician from Oakland Ca. She started drawing at a young age and  is now known for her detailed and unsettling portraits of mainly female subjects. She works primarily with fine point pens and water color.  She is also a singer songwriter and has released multiple home recorded and studio albums, both solo under the name “Grace Sings Sludge” and with the San Francisco group “The Sandwitches”. For her solo project she creates her own music videos and incorporates many elements from her favorite genre of film Horror.
        
        Chrissy Espinoza grew up in Colorado and has lived throughout the American West. She attended Rocky Mountain College of Art & Design where she studied 2D Animation. She works primary with video, photography and animation. Her short animations have been in independent film and animation festivals in Colorado, the Bay Area and Amsterdam, including P.O.V Animation Festival, Filmhuis Cavia and the Titwrench Art & Music Festival. Espinoza creates surreal environments for her photography which are created from her concepts and imagination. She thoughtfully creates and thinks about every detail for her photoshoots. The act of creating the environment is just as important as taking the photos. Some of her inspiration spawns from installations, surrealism and films. She believes that a great story is key to intriguing the viewer and creating a successful piece of artwork.
        """,
        urls: ["www.youtube.com/playlist?list=PL1iJ3IvWHHbOR5lhM0W_Fvm6zB6uoa4hO",
               "instagram.com/sludgegraceriverperson",
               "chrissyespinoza.carbonmade.com"],
        images: [Image("GraceCooper"),Image("Chrissy")]
    )
    
    static let steven = artistbio(
        name: "Steven Frost",
        pronouns: "He/Him/His",
        bio: "Textiles are a powerful medium -- their association with the body and garments evoke tactile memories. Using weaving, Steven Frost combines traditional materials like yarn and cotton with non-traditional weaving materials from a range of sources, exploring the ways history and time are embedded in materials. His materials evoke specific narratives and stories, referencing aspects of the artist’s personal and family history, the history of the LGBTQ rights movement, and queer pop icons, among other topics. In workshops and interactive performance events, the artist invites participants to learn about queer history while developing sewing and weaving techniques. By bringing together groups to weave collectively, Frost explores the ways weaving can act as a metaphor for communities working together. He holds an MFA in Fiber and Material Studies from the School of the Art Institute of Chicago and is an instructor in the Media Studies Department at the University of Colorado, Boulder. He also serves as Faculty Directory for the B2 Center for Media, Arts, and Performance part of CU Boulder’s Atlas Institute.",
        urls: ["www.stevenfrost.com",
               "instagram.com/harmonyinbadtaste",
               "twitter.com/stevenfrost"],
        images: [Image("StevenFrost")]
    )
    
    static let bryan = artistbio(
        name: "Bryan Costanza",
        pronouns: "he/him/his",
        bio: "Bryan Costanza is a Denver-based Creative Technologist specializing in \"wrangling technology\" for artistic and entrepreneurial projects, especially interactive art installations and mobile apps. He enjoys exploring projects that combine scientific, technological, and artistic elements and is always seeking opportunities to integrate these fields into new experiences. Bryan's background includes an MS in Creative Technologies & Design, a BS in Aerospace Engineering, and a minor in Psychology. He has also worked in education and at startups in a wide variety of roles. His recent interests are focused on user-centered design, information visualization, and generative art. Past projects include an interactive sculpture collaboration with Nicole Banowetz, a gesture-controlled arcade game, a software tool for designers, a science exhibit, and virtual reality research.",
        urls: ["bryancostanza.com",
               "instagram.com/bryancostanza"],
        images: [Image("BryanCostanza")]
    )
    static let frankie = artistbio(
        name: "Frankie Toan",
        pronouns: "they/them/theirs",
        bio: "Based in Denver, Frankie Toan is an artist working mostly with craft and DIY materials and techniques to create large plush sculptures, interactive works, and immersive installations. Frankie holds a BFA in Craft/Material studies from Virginia Commonwealth University, with a minor in Gender, Sexuality, and Women’s studies. Their current body of work consists of elongated or engorged body parts tied, arranged, and installed in conversation with each other, creating fantasy bodies. Frankie has participated in many group shows and collaborations nationwide. Recent projects include a commission for Meow Wolf’s Kaleidoscape immersive ride at Elitch Gardens and their public art installation “Public Bodies” for Between Us Alleys, a citywide art intervention. They have had residencies at RedLine (CO) and Arrowmont School of Arts and Crafts (TN). An avid mystery theatre fan, Frankie has written 3 mystery theatre plots, including the collaborative production [Colony 933]. ",
        urls: ["fetaon.com",
               "instagram.com/fetoan"],
        images: [Image("FrankieToan")]
    )
    
    static let serena = artistbio(
        name: "Serena Chopra",
        pronouns: "she/her/hers",
        bio: "Serena Chopra is a multidisciplinary artist. She has a PhD in Creative Writing from the University of Denver, an MFA from the University of Colorado at Boulder and was a 2011-2013 RedLine artist in Residence, a 2016-2017 Fulbright Scholar (Bangalore, India), and has received a month-long artist residency at Understudy Denver for September 2020. She has two books, This Human (Coconut Books 2013) and Ic (Horse Less Press 2017), as well as two films, Dogana/Chapti (2018, winner of ArtHyve’s Archives as Muse Film grant, Official Selection at Frameline43, Oregon Documentary Film Festival, Seattle Queer Film Festival, Nahia Film Festival and Cinema Diverse) and Mother Ghosting (2018). She is an 8-year company member with Evolving Doors Dance and was recently a featured artist in Harper’s Bazaar (India) as well as in the Denver Westword’s “100 Colorado Creatives.” She has forthcoming publications in Foglifter and Matters of Feminist Practice (Belladonna). Serena is Assistant Professor of Creative Writing at Seattle University. ",
        urls: ["serenachopra.com"],
        images: [Image("SerenaChopra")]
    )
    
    static let kate = artistbio(
        name: "Kate Speer",
        pronouns: "she/her/hers",
        bio: "Kate Speer is a dancer, choreographer, and organizer based in Denver, CO. She has had residencies at RedLine (CO), PlatteForum (CO), Middlebury College (VT), Swarthmore College (PA), and Mascher Space Cooperative (PA), all of which emphasize community engagement that is inherent in her dancemaking. Often self-producing in DIY spaces, her own choreography has been supported by National Performance Network Creation Fund, Colorado Creative Industries Career Advancement Grant, and the Puffin Foundation, and has been presented at Performatica (Cholula, Mexico), Boulder International Fringe Festival (CO), Philly Fringe (PA), ETC Performance Series (PA), and FAB Dance Showcase (ME). Always seeking collaborative performance projects, she directed [Colony 933], an immersive mystery dance-theatre conceived of and created collectively with 20 different artists in visual, performance, and music. She has had the pleasure to perform in work by Gesel Mason Performance Projects, Ondine Geary, Raja Feather Kelly, Tania Isaac, and Claudia Lavista. ",
        urls: ["katespeerdance.org",
               "vimeo.com/katespeer"],
        images: [Image("KateSpeer")]
    )
    
    static let bagbaysha = artistbio(
        name: "BAGBAYSHA",
        pronouns: "\"They\" for us as a group, \"He/His\" for Chris and Thomas, \"She/Hers\" for KoKo Bayer",
        bio: "Denver Locals “BAGBAYSHA” that is:\nChris BAGley, photographer/videographer/documentarian, interactive projectionist, and collector of discarded/unappreciated items.\nKoko BAYer, photographer/videographer/documentarian and mega-scale printmaker/wheat-paster.\nThomas ScHArfenberg, color, pattern, found-material enthusiast, multi-surface+object texture-painter, photographer and flower greenhouse worker. ",
        urls: ["instagram.com/rocknrollranch",
               "instagram.com/kokonofilter",
               "instagram.com/sharp_mountain",
               "instagram.com/diamond_skys"],
        images: [Image("ChrisKokoThomas")]
    )
    
    static let james = artistbio(
        name: "James Brunt",
        pronouns: "he him his",
        bio: """
        James Brunt is an actor born and raised in Denver, Colorado most known for pushing the boundaries of what we know about theater with immersive productions in obscure settings and hard hitting concepts that make his audience truly reflect on their views of the world. Playing roles from a cleaver wielding beet butcher, to a zany detective on the hunt for answers, he loves to create anything that will make his heart beat faster and blood boil up. He recently received the 2019 True West award for breakout actors for his challenging portrayal of taxi driver, Bobby, in Mosque with The Black Actors Guild. Other works recognized were his productions with The Band of Toughs and Control Group Productions. When Brunt isn't taking the stage, he still finds ways to enlighten his audiences by performing original slam poetry or creating magical moments as the beloved Santa Claus. He is also an educator of the arts, teaching improv to the youth of Denver with the Black Actors Guild.
        """,
        urls: ["facebook.com/jbrunt2","facebook.com/ActorBrunt","instagram.com/exjames"],
        images: [Image("james")]
    )
    
    static let max = artistbio(
        name: "Max Bernstein",
        pronouns: "They/Them",
        bio: """
        Max Bernstein was born in Buffalo, NY where they received a BA in Media Study concentrating in film and video production, from SUNY Buffalo. Bernstein received an MFA in Film Production and Studio Art from CU Boulder. They have worked and toured as a technical artist with the Wooster Group, and as a video and sound designer with Michelle Ellsworth, Kaki King, Cindy Kleine, Aynsley Vandenbroucke, Sam Kim, and Morgan Gould. In addition, they are one half of the piano harp duo Outlier, a member of media performance group Flinching Eye Collective, member of Friends Of The Tank, drummer and video designer for the band Eupana, a multi-instrumentalist, and a Scuba Diver. Bernstein taught film history and production at CU Boulder, and video art at the RMCAD. They are currently a Lecturer for the New American Film School, and The School of Music, Dance, and Theatre at Arizona State University.
        """,
        urls: ["instagram.com/visiblemax","maxbernsteinworks.com"],
        images: [Image("max")]
    )
    
}

