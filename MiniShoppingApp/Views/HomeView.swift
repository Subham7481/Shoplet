//
//  HomeView.swift
//  MiniShoppingApp
//
//  Created by Subham Patel on 08/08/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                VStack{
                    HeaderView()
                    SearchView()
                        .padding()
                    OfferView()
                    OfferImageSlide()
                    ShopCategory()
                    PopularView()
                    PopularSections()
                        .padding(.top, 10)
                    Products()
                        .padding(.top, 10)
                }.frame(width: geometry.size.width)
            }
        }
    }
}

struct HeaderView: View {
    var body: some View {
        HStack{
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60, alignment: .leading)
        
            VStack(alignment: .leading){
                Text("Good morning 👋")
                    .font(.system(size: 16, weight: .light))
                    .foregroundColor(Color.black.opacity(0.5))
                
                Text("Subham")
                    .font(.system(size: 18, weight: .bold))
                    
            }.padding()
            Spacer()
            Image(systemName: "bell")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            
            Image(systemName: "heart")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding()
            
            Image(systemName: "cart.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
        }.padding(.horizontal, 10)
    }
}

struct SearchView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 375, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black.opacity(0.1), lineWidth: 1)
                )
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                
                Text("Search")
                    .foregroundColor(.gray)
                
                Spacer()

                Image(systemName: "line.3.horizontal.decrease.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                    .padding(.trailing, 10)
            }
            .frame(width: 375, height: 50)
        }
    }
}

struct OfferView: View {
    var body: some View {
        HStack{
            Text("Special Offers")
                .font(.system(size: 16, weight: .bold))
            
            Spacer()
            
            Text("See All")
        }.padding(.horizontal)
    }
}

struct OfferImageSlide: View {
    let offers: [Offer] = [
            Offer(imageName: "SlideImage1", title: "30%", subtitle: "Today's Special!"),
            Offer(imageName: "SlideImage2", title: "50%", subtitle: "Rakhi Special!"),
            Offer(imageName: "SlideImage3", title: "New Arrivals", subtitle: "Don't miss out")
    ]
    @State private var currentIndex = 0
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    var body: some View {
        TabView(selection: $currentIndex) {
                    ForEach(0..<offers.count, id: \.self) { index in
                        ZStack(alignment: .bottomLeading) {
                            Image(offers[index].imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 375, height: 200)
                                .clipped()
                                .cornerRadius(10)
                            
                            
                            LinearGradient(
                                gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                                startPoint: .bottom,
                                endPoint: .top
                            )
                            .frame(height: 100)
                            .cornerRadius(10)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(offers[index].title)
                                    .font(.system(size: 25, weight: .bold))
                                    .foregroundColor(.white)
                                Text(offers[index].subtitle)
                                    .font(.system(size: 25, weight: .bold))
                                    .foregroundColor(.white.opacity(0.8))
                            }
                            .padding()
                        }
                        .tag(index)
                        .padding(.horizontal)
                    }
                }
                .frame(height: 220)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .onReceive(timer) { _ in
                    withAnimation {
                        currentIndex = (currentIndex + 1) % offers.count
                    }
            }
    }
}

struct ShopCategory: View {
    let category: [CategoryModel] = [
        CategoryModel(image: "t-shirt", name: "Clothes"),
        CategoryModel(image: "Shoes", name: "Shoes"),
        CategoryModel(image: "bag", name: "Bags"),
        CategoryModel(image: "electronics", name: "Electronics"),
        CategoryModel(image: "hand-watch", name: "Watch"),
        CategoryModel(image: "Jewelary", name: "Jewelary"),
        CategoryModel(image: "Kitchen", name: "Kitchen"),
        CategoryModel(image: "Toys", name: "Toys")
    ]
    var body: some View {
        VStack(spacing: 20) {
                    // First Row
                    HStack(spacing: 40) {
                        ForEach(category.prefix(4), id: \.id) { data in
                            VStack {
                                Circle()
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(width: 60, height: 60)
                                    .overlay(
                                        Image(data.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                    )
                                Text(data.name)
                                    .font(.caption)
                            }
                        }
                    }

                    // Second Row
                    HStack(spacing: 40) {
                        ForEach(category.suffix(4), id: \.id) { data in
                            VStack {
                                Circle()
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(width: 60, height: 60)
                                    .overlay(
                                        Image(data.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 30, height: 30)
                                    )
                                Text(data.name)
                                    .font(.caption)
                            }
                        }
                    }
                }
                .padding()
    }
}

struct PopularView: View {
    var body: some View {
        HStack{
            Text("Most Popular")
                .font(.system(size: 16, weight: .bold))
            
            Spacer()
            
            Text("See All")
        }.padding(.horizontal)
    }
}

struct PopularSections: View {
    @State private var selectedTab: String = "All"
    let tabs = ["All", "Clothes", "Shoes", "Bags", "Electronics", "Watch", "Jewelary", "Kitchen", "Toys"]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(tabs, id: \.self) { tab in
                    SubButton(title: tab, selectedTab: $selectedTab)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct SubButton: View {
    var title: String
    @Binding var selectedTab: String
    
    var isSelected: Bool {
        selectedTab == title
    }
    
    var body: some View {
        Button(action: {
            selectedTab = title
        }) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(isSelected ? Color.white : Color.primary)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 1)
                )
                .cornerRadius(10)
        }
    }
}

struct Products: View {
    let products = [
        ProductsModel(image: "Camera", name: "Camera", rating: "4.2⭐️", price: "$240"),
        ProductsModel(image: "Headphone", name: "Headphone", rating: "4.3⭐️", price: "$24"),
        ProductsModel(image: "Formal", name: "Formal Shoes", rating: "4.1⭐️", price: "$150"),
        ProductsModel(image: "Wallet", name: "Leather Wallet", rating: "4.7⭐️", price: "$100"),
        ProductsModel(image: "Watch", name: "Watch", rating: "4⭐️", price: "$85"),
        ProductsModel(image: "Jakcet", name: "Leather Jacket", rating: "4.4⭐️", price: "$120")
    ]
    var body: some View {
        HStack(spacing: 40){
            VStack(spacing: 30) {
                ForEach(products.prefix(3), id: \.id) { data in
                    VStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 155, height: 155)
                            .overlay(
                                Image(data.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 130, height: 130)
                            )
                        Text(data.name)
                            .font(.system(size: 16, weight: .bold))
                        
                        HStack{
                            Text("\(data.rating)")
                                .font(.callout)
                            
                            Text(data.price)
                                .font(.system(size: 16, weight: .bold))
                        }
                        
                    }
                }
            }
            
            VStack(spacing: 30) {
                ForEach(products.suffix(3), id: \.id) { data in
                    VStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 155, height: 155)
                            .overlay(
                                Image(data.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 130, height: 130)
                            )
                        Text(data.name)
                            .font(.system(size: 16, weight: .bold))
                        
                        HStack{
                            Text("\(data.rating)")
                                .font(.callout)
                            
                            Text(data.price)
                                .font(.system(size: 16, weight: .bold))
                        }

                    }
                }
            }

        }
    }
}


#Preview {
    HomeView()
}
