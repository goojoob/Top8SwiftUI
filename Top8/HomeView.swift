//
//  HomeView.swift
//  Top8
//
//  Created by Antonio Rodriguez Cia on 28/06/2020.
//  Copyright © 2020 Goojoob. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    @Binding var showContent: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Watching")
                        .modifier(CustomFontModifier(size: 40))
                    Spacer()
                    AvatarView(showProfile: $showProfile)
                    Button(action: {
                        self.showUpdate.toggle()
                    }) {
                        Image(systemName: "bell")
                            .renderingMode(.original)
                            .font(.system(size: 20, weight: .medium, design: .rounded))
                            .frame(width: 36, height: 36)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                        
                    }
                    .sheet(isPresented: $showUpdate) {
                        UpdateList()
                    }
                }
                .padding(.horizontal)
                .padding(.leading, 15)
                .padding(.top, 30)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    WatchRingsView()
                        .padding(.horizontal, 30)
                        .padding(.bottom, 30)
                        .onTapGesture {
                            self.showContent = true
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(sectionData) { sectionItem in
                            GeometryReader { geometry in
                                SectionView(section: sectionItem)
                                    .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX / -10)), axis: (x: 10, y: 0, z: 0))
                            }
                            .frame(width: 275, height: 275)
                        }
                    }
                    .padding(30)
                    .padding(.bottom, 60)
                }
                .offset(y: -20)
                .frame(maxWidth: .infinity)
                
                
                HStack {
                    Text("Lucy gati")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding(.leading, 30)
                .offset(y: -60)
                
                
                SectionView(section: sectionData[2], width: screen.width - 60, height: 275)
                    .offset(y: -60)
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(true))
    }
}

struct SectionView: View {
    let section: Section
    var width: CGFloat = 275
    var height: CGFloat = 275

    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                section.logo
                Spacer()
                Text(section.title)
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .trailing)
            }
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            section.card
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
        .background(section.color)
        .cornerRadius(20)
        .shadow(color: section.color.opacity(0.4), radius: 20, x: 0, y: 20)
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: Image
    var card: Image
    var color: Color
}

let sectionData: [Section] = [
    Section(title: "Marta la preciosa", text: "Mi novia", logo: Image("Logo1"), card: Image("Card1"), color: Color("card1")),
    Section(title: "Lucy la hermosura", text: "Mi gata", logo: Image("Logo2"), card: Image("Card2"), color: Color("card2")),
    Section(title: "Royal Assassin", text: "Mono Black", logo: Image("Logo3"), card: Image("Card3"), color: Color("card3"))
]

struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 30) {
            HStack(spacing: 20.0) {
                RingView(color1: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), color2: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), size: 44, percent: 75, show: .constant(true))
                    .animation(Animation.easeInOut.delay(0.5))
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("6 minutes left")
                        .bold()
                        .modifier(FontModifier(style: .body))
                    Text("watched 10 minutes today")
                        .modifier(FontModifier(style: .subheadline))
                }
                
            }
            .padding(10)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 20.0) {
                RingView(color1: Color(#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)), color2: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), size: 32, percent: 23, show: .constant(true))
                    .animation(Animation.easeInOut.delay(0.5))
            }
            .padding(10)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            HStack(spacing: 20.0) {
                RingView(color1: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), color2: Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)), size: 32, percent: 45, show: .constant(true))
                    .animation(Animation.easeInOut.delay(0.5))
            }
            .padding(10)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
        }
    }
}
