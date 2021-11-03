//
//  UpdateStore.swift
//  Top8
//
//  Created by Antonio Rodriguez Cia on 30/06/2020.
//  Copyright © 2020 Goojoob. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}


struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Card1", title: "SwiftUI", text: "Swift 5.2 es lksdalkslk lsdkl dsak dlsakdl sakd lsakd laskdl saklre rmnr emw,n rme,wn r,we er dasjkdj kasdj ksajd ksaj dkas", date: "4 Enero"),
    Update(image: "Card2", title: "Vapor", text: "Vapor 4 sa ,n3 4n  nsdahkhjhjh n  ,dfnshf sdlkkaf lkjafkl jdskl jfkadsj fkl f djfklaj fk,mn re mnmndfm,n m,f ndm,f n,s ", date: "10 Abril")
]
