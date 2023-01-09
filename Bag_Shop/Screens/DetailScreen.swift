//
//  DetailScreen.swift
//  Bag_Shop
//
//  Created by Дарья Пивовар on 09.01.2023.
//

import SwiftUI

struct DetailScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color("Bg")
                .edgesIgnoringSafeArea(.all)

            ScrollView {
                
                Spacer()
                
                Image("1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                 
                DescriptionView()
                    .offset(y: -40)
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack {
                Text("135.75$")
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    //
                }) {
                    Text("Add to Cart")
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10.0)
                        .foregroundColor(Color("Color1"))
                }
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Color1"))
            .cornerRadius(50, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                CustomBackButtonView(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image(systemName: "ellipsis")
                            
        )
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Guess")
                .font(.title)
                .fontWeight(.bold)
            
            HStack(spacing: 4) {
                ForEach(0 ..< 5) { item in
                    Image(systemName: "star.fill")
                        .font(.footnote)
                        .foregroundColor(.yellow)
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text("""
Composition: 100% polyurethane
Size: 18.5x10x5.5 cm
""")
            .lineSpacing(8.0)
            .opacity(0.6)
            
            Spacer()
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 3) {
                    Text("Colors")
                        .fontWeight(.semibold)
                    
                    HStack {
                        ColorDotView(color: Color("Color3"))
                        ColorDotView(color: Color("Color4"))
                        ColorDotView(color: .white)
                    }
                    .padding(.horizontal, 2)
                }
                
                Spacer()
                
                VStack(alignment: .center) {
                    Text("Quantity")
                        .fontWeight(.semibold)
                        .offset(y: 10)
                    
                    HStack {
                        Button(action: {
                            //
                        }) {
                            Image(systemName: "minus")
                                .padding(.all, 8)
                        }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                        
                        Button(action: {
                            //
                        }) {
                            Image(systemName: "plus")
                                .padding(.all, 8)
                        }
                        .frame(width: 30, height: 30)
                        .background(Color("Color2"))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    }
                }
            }
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(40.0)
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}


struct CustomBackButtonView: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
                .foregroundColor(.black)
        }
    }
}
