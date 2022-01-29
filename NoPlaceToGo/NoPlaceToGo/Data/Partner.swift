//
//  Partners.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 9/28/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//
// swiftlint:disable line_length

import SwiftUI

struct Partner: Identifiable {
    let name: String
    let url: String
    let bio: String
    let image: Image

    var id: String {name}

    static let redline = Partner(
        name: "RedLine",
        url: "redlineart.com",
        bio: """
        Located in Denver, Colorado, RedLine Contemporary Art Center fosters education and engagement between artists and communities to create positive social change. Viewing art and arts education through a lens of social issues, the organization ensures equitable access to the arts for under-resourced populations by working to fulfill a vision of empowering everyone to create social change through art. Founded in 2008, RedLine has launched more than 120 resident artists, engaged more than 9,800 students at under-resourced schools, provided space and resources for dozens of artists experiencing homelessness or hardship, and responded to the needs of residents in the neighborhoods surrounding RedLine. Operating with an “open door policy for ideas,” RedLine has created space, financial resources and administrative infrastructure for artist-driven ideas and community collaborations to become realities.
        """,
        image: Image("redline")
    )

    static let fortywest = Partner(
        name: "40 West Arts",
        url: "40westarts.org",
        bio: """
        40 West Arts is a non-profit, state-certified creative district along Lakewood’s historic West Colfax Avenue with the mission of energizing West Colfax through arts experiences, exhibitions, and events that engage the whole family. 40 West Arts is home to an ever-growing number of creative venues, from live performances at Benchmark Theatre to cutting-edge contemporary art at Edge Gallery, Next Gallery, Pirate: Contemporary Art and others. The district includes the campus of Rocky Mountain College of Art + Design and the popular Mexican-themed entertainment restaurant Casa Bonita, a national top-ten roadside destination. A new amenity in the district is the 40 West ArtLine (40WestArtLine.org), a four-mile walkable, bikeable outdoor arts experience funded in part by the National Endowment for the Art and the Lakewood-W. Colfax BID. The ArtLine intersects three parks and comprises 70+ art installations including sculptures, murals, fence art, interactive games and more. Visit 40 West Arts during its monthly First Friday opening receptions, quarterly Colfax Art Crawl events and Colfax ArtFest, a two-day festival featuring live music, art happenings, creative vendors, food trucks, craft beer and more. Whether for its arts experiences, creative venues and public art, eclectic eateries or micro brews, 40 West Arts is a top westside destination.
        """,
        image: Image("fortywest")
    )

    static let bestonhomes = Partner(
        name: "Beston Homes Team",
        url: "bestonhomesteam.kw.com",
        bio: """
        As a Colorado native, Brandon Beston has been able to use his knowledge of the Rocky Mountain state to help clients on their hunt for the ideal home. He was awarded the Keller Williams Colorado Region Cultural Ambassador Award for his commitment to serving his clients, fellow Brokers, and the community. He serves on the Colorado Region Social Equity Task Force working to create Diversity, Equity, and Inclusion in the real estate industry and in homeownership.

        Beston Homes Team has been successful in listing and selling multiple homes each and every month. Our goal is to help homebuyers, regardless of whether it’s their first or fifth property. Our mission is to not only find the home of your dreams, and to find the home that will allow all of your dreams to come true! We are passionate about working with first-time homebuyers, move up and move down sellers and buyers, investors and developers. Our team is also able to assist with any of your commercial real estate needs. We are also experienced in helping clients during the purchasing and customizing of new builds.
        """,
        image: Image("bestonhomes")
    )

    static let mintserif = Partner(
        name: "Mint & Serif",
        url: "mintandserif.com",
        bio: """
        Mint & Serif Coffee House offers coffee, beer, wine, and light fare. The vision was to, as a family, build an inclusive, warm, welcoming and safe space. A space to create, write, read or socialize in. We’re passionate about our community, the arts and supporting local businesses. Thank you for checking us out and we hope to see you soon.
        """,
        image: Image("mintserif")
    )

    static let scfd = Partner(
        name: "Scientific and Cultural Facilities District",
        url: "scfd.org",
        bio: """
        No Place to Go is supported in part by the Scientific and Cultural Facilities District (SCFD)-Jefferson County Cultural Council. The SCFD is a seven-county tax district created within Colorado law, approved by Colorado’s General Assembly and renewed by voters multiple times over more than 30 years. SCFD is the only cultural funding model in the nation that serves a region of seven counties. The seven-county Denver metro area including Adams, Arapahoe, Boulder, Broomfield, Denver, Douglas and Jefferson counties participate, with the exception of Castle Rock and Larkspur in Douglas County. This broad base has allowed SCFD to grow into the second largest cultural funding mechanism in the United States. SCFD funds nearly 300 organizations across the front range urban corridor, distributing more than $60 million annually. These tax dollars provide critical operational support for small, medium, and large organizations. SCFD is proof that we are stronger together. Culture is not just available in the epicenter of our cities, but surrounds us throughout the metro area.
        """,
        image: Image("scfd_hor")
    )

    static let npn = Partner(
        name: "National Performance Network",
        url: "npnweb.org",
        bio: """
        No Place to Go is supported in part by the National Performance Network (NPN) Artist Engagement Fund. RedLine is a partner of NPN, a vibrant network of artists and organizations committed to advancing racial and cultural justice through the arts. NPN contributes to a more just and equitable world by building artists’ power; advancing racial and cultural justice in the arts; fostering relationship-building and reciprocity between individuals, institutions and communities; and working towards systems change in arts and philanthropy.
        """,
        image: Image("npn")
    )

    static let musicrange = Partner(
        name: "The Music Range",
        url: "themusicrange.com",
        bio: """
        The Music Range offers 7 fully equipped rehearsal studios available for hourly rental 24/7, 365 days a year. Book a studio for use at any time, regardless of the hour or this crazy Colorado weather. Our studios are designed to make you feel comfortable and inspired. There’s ample off-street parking (private lot), free wifi, and we’re conveniently located off of West Colfax Ave.
        """,
        image: Image("musicrange")
    )

    static let tootsies = Partner(
        name: "Tootsies the Nail Shoppe",
        url: "tootsiesnailshoppe.com",
        bio: "Tootsies the Nail Shoppe is a salon for extremely sanitary, manicures, pedicures, and waxing.",
        image: Image("tootsies")
    )

    static let allpartners: [Partner] = [
        redline,
        fortywest,
        bestonhomes,
        mintserif,
        scfd,
        npn,
        musicrange,
        tootsies
    ]
}
