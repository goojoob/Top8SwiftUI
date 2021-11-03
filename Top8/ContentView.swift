//
//  ContentView.swift
//  Top8
//
//  Created by Antonio Rodriguez Cia on 27/06/2020.
//  Copyright © 2020 Goojoob. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false
    @State var bottomState = CGSize.zero
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 10 : 0)
                .opacity(showCard ? 0.4 : 1)
                .offset(y: showCard ? -200 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
            )
            
            BackCardView()
                .frame(width: showCard ? 300 : 340, height: 220)
                .background(Color("card4"))
                .cornerRadius(30)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(.degrees(showCard ? -10 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 10), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            BackCardView()
                .frame(width: showCard ? 345 : 340, height: 220)
                .background(Color("card3"))
                .cornerRadius(30)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -140 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(.degrees(showCard ? -5 : 0))
                .rotation3DEffect(.degrees(showCard ? 0 : 5), axis: (x: 10, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            CardView()
                .frame(width: showCard ? 375 : 340, height: 220)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .blendMode(.hardLight)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : 0)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showCard.toggle()
            }
            .gesture(
                DragGesture().onChanged { value in
                    self.viewState = value.translation
                    self.show = true
                }
                .onEnded { value in
                    self.viewState = CGSize.zero
                    self.show = false
                }
            )
            
            InfoCardView(show: $showCard)
                .offset(x: 0, y: showCard ? 300 : 2000)
                .offset(y: bottomState.height)
                .blur(radius: show ? 10 : 0)
                .animation(.spring())
                .gesture(
                    DragGesture().onChanged { value in
                        self.bottomState = value.translation
                        if (self.bottomState.height < -250) {
                            self.bottomState.height = -250
                        }
                    }
                    .onEnded { value in
                        if (self.bottomState.height > 50) {
                            self.showCard = false
                        }
                        if (self.bottomState.height < -100) {
                            self.bottomState.height = -250
                        } else {
                            self.bottomState = CGSize.zero
                        }
                    }
            )

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image("People")
                    .padding()
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Tournaments")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                    Text("in your community")
                        .font(.subheadline)
                        .foregroundColor(Color("accent"))
                        .foregroundColor(Color("card1"))
                }
                .padding()
            }
            .padding(.bottom, 0)
            .padding(.top, 20)
            .padding(.horizontal, 20)
            
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 320, height: 140, alignment: .top)
        }
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("TOP8")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct InfoCardView: View {
    @Binding var show: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 50, height: 6, alignment: .center)
                .cornerRadius(3)
                .opacity(0.1)
            Text("These are the tournaments you have created for your community")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
            
            HStack(spacing: 20) {
                RingView(color1: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), color2: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), size: 88, percent: 75, show: $show)
                    .animation(Animation.easeInOut.delay(0.5))
                
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("SwiftUI")
                        .fontWeight(.bold)
                    Text("12 of 12 sections completed\n10 hours")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)

            }
                
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
