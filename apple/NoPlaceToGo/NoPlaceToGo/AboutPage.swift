//
//  AboutPage.swift
//  NoPlaceToGo
//
//  Created by Bryan Costanza on 8/29/20.
//  Copyright © 2020 Bryan Costanza. All rights reserved.
//

import SwiftUI

struct AboutPage: View {
    var body: some View {
        ScrollView(.vertical) {
            Group {
                Text("Presented by RedLine in partnership with 40 West Arts and sponsored by Beston Homes Team, ") + Text("No Place to Go").italic() + Text(" is an artist-made haunted house where unrealized fears manifest in an immersive world driven desire, fear and the horror of systemic binaries. A collaborative project directed by Serena Chopra, Kate Speer and Frankie Toan, No Place to Go is a pandemic-safe, multi-site car tour in 40 West Arts District and Wheat Ridge. Each installation is a fantastical realm designed by some of the boldest, emerging, and mid-career artists in the seven county region: nolan tredway, Michaela Mujica-Steiner + Emily Marie Passos Duffy, Moe Gram, Nicole Anona Banowetz, Hayley Krichels, Hayley Dixon + Renee Marino, Chrissy Espinoza + Grace Cooper, Steven Frost, and BAGBAYSHA (Chris BAGley + Koko BAYer + Thomas ScHArfenberg).")
            }
            .padding()
            Group {
                Text("No Place to Go").italic() + Text(" merges the absurdist storytelling of dance-theatre with tactile, interactive visual art installations to create environments where the audience can examine and embrace the interaction between fear and desire within the constraint and violence of systemic binaries. In the shadow of the impending election, we are confronted with our fraught participation in the nation state and will necessitate radical, queer modes for re-imagining the relationship of our bodies to our haunted (national) home.")
            }
            .padding()
            Text("Acknowledgements")
                .font(.title)
                .padding()
            Group {
                Text("No Place to Go").italic() + Text(" is situated on the Traditional Territories of the Arapaho, Cheyenne, Sioux and Ute Nations.")
            }
            .padding()
            Group {
                Text("No Place to Go").italic() + Text(" was inspired by Killjoy’s Kastle: A Lesbian Feminist Haunted House, an immersive walk-through installation and performance artwork by Allyson Mitchell and Deirdre Logue. The exhibition has been staged in four cities so far – Toronto, London, Los Angeles, and Philadelphia – inviting visitors to interact with humorous and frightening manifestations of the spirits that haunt feminist and queer history. Whereas traditional hell houses set out to scare and convert, Killjoy’s Kastle cheekily aims to provoke and pervert. Co-Directors Frankie Toan and Kate Speer got to experience the Philadelphia version in 2019 at Icebox Project Space.")
            }
            .padding()
        }
        .navigationBarTitle("About NP2G")
    }
}

struct AboutPage_Previews: PreviewProvider {
    static var previews: some View {
        AboutPage()
    }
}
