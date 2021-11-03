//
//  UpdateDetail.swift
//  Top8
//
//  Created by Antonio Rodriguez Cia on 29/06/2020.
//  Copyright © 2020 Goojoob. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    var update: Update
    
    var body: some View {
        List {
            VStack {
                Image(update.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(5)
            .navigationBarTitle(update.title)
        }
        .listStyle(GroupedListStyle())
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail(update: updateData[0])
    }
}
