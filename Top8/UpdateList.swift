//
//  UpdateList.swift
//  Top8
//
//  Created by Antonio Rodriguez Cia on 29/06/2020.
//  Copyright © 2020 Goojoob. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    @ObservedObject var store = UpdateStore()
    
    func addUpdate() {
        store.updates.append(Update(image: "Card3", title: "Combine", text: "Combine es presioso miralo usa obervableobject y observedobject sobre una clase con un array Published", date: "2 Julio"))
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { updateItem in
                    NavigationLink(destination: UpdateDetail(update: updateItem)) {
                        HStack {
                            Image(updateItem.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color.black)
                                .cornerRadius(20)
                                .padding(.trailing, 4)
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text(updateItem.title)
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                Text(updateItem.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                                Text(updateItem.date)
                                    .font(.system(.caption, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 10)
                    }
                }
                .onDelete { index in
                    self.store.updates.remove(at: index.first!)
                }
                .onMove { (source, destination) in
                    self.store.updates.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationBarTitle(Text("Updates"))
            .navigationBarItems(leading: Button(action: addUpdate) {
                Text("Add Update")
            }, trailing: EditButton())
            
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

