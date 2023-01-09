//
//  HomeScreen.swift
//  Bag_Shop
//
//  Created by Дарья Пивовар on 04.01.2023.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "Chanel", "Gucci", "Guess", "Marni", "PSWL"]
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        AppBarView()
                        
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count) { item in
                                    CategoryView(isActive: item == selectedIndex, text: categories[item])
                                        .onTapGesture {
                                            selectedIndex = item
                                        }
                                }
                            }
                            .padding()
                        }
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                   NavigationLink(destination: DetailScreen(), label: {
                                       ProductCardView(image: Image("\(index + 1)"), size: 210)
                                   })
                                   .navigationBarHidden(true)
                                   .foregroundColor(.black)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                    ProductCardView(image: Image("\(index + 1)"), size: 180)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                    }
                }
                
                HStack {
                    BottomNavBarItem(image: Image(systemName: "house.fill")) {}
                    BottomNavBarItem(image: Image(systemName: "heart.fill")) {}
                    BottomNavBarItem(image: Image(systemName: "bag.fill")) {}
                    BottomNavBarItem(image: Image(systemName: "person.fill")) {}
                }
                .padding()
                .foregroundColor(Color("Color1"))
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: {
                //
            }) {
                Image(systemName: "line.3.horizontal")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
            }
            .buttonStyle(.plain)
            
            Spacer()
            
            Button(action: {
                //
            }) {
                Image("avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45, height: 45)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Color1"))
        + Text("Bag!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Color1"))
    }
}

struct SearchAndScanView: View {
    
    @State private var search: String = ""
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.trailing, 8)
                    .foregroundColor(Color("Color2"))
                TextField("Search Bag", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing)
            
            Button(action: {
                //
            }) {
                Image(systemName: "barcode.viewfinder")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("Color1"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Color1") : Color.black.opacity(0.5))
            
            if isActive {
                Color("Color1")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: 200 * (size / 210))
                .cornerRadius(20.0)
            
            Text("Guess")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing: 2) {
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image(systemName: "star.fill")
                        .font(.footnote)
                        .foregroundColor(.yellow)
                }
                
                Spacer()
                
                Text("135.75$")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}

struct BottomNavBarItem: View {
    
    let image: Image
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            image
                .font(.title2)
                .frame(maxWidth: .infinity)
        }
    }
}

