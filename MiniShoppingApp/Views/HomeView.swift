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
        GeometryReader { geometry in
            HStack(spacing: geometry.size.width * 0.02) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.15,
                           height: geometry.size.width * 0.15)
                
                VStack(alignment: .leading, spacing: geometry.size.height * 0.01) {
                    Text("Good morning👋")
                        .font(.system(size: geometry.size.width * 0.045, weight: .light))
                        .foregroundColor(Color.black.opacity(0.5))
                    
                    Text("Subham")
                        .font(.system(size: geometry.size.width * 0.05, weight: .bold))
                }
                .padding(.leading, geometry.size.width * 0.02)
                
                Spacer()
                
                HStack(spacing: geometry.size.width * 0.04) {
                    Image(systemName: "bell")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.08,
                               height: geometry.size.width * 0.08)
                    
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.08,
                               height: geometry.size.width * 0.08)
                    
                    Image(systemName: "cart.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.08,
                               height: geometry.size.width * 0.08)
                }
                .padding(.trailing, geometry.size.width * 0.02)
            }
            .padding(.horizontal, geometry.size.width * 0.03)
        }
        .frame(height: 80)
    }
}


struct SearchView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: geometry.size.height * 0.2)
                    .fill(Color.gray.opacity(0.2))
                    .overlay(
                        RoundedRectangle(cornerRadius: geometry.size.height * 0.2)
                            .stroke(Color.black.opacity(0.1), lineWidth: 1)
                    )
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(height: geometry.size.height * 0.5)
                        .foregroundColor(.gray)
                        .padding(.leading, geometry.size.width * 0.03)
                    
                    Text("Search")
                        .foregroundColor(.gray)
                        .font(.system(size: geometry.size.height * 0.35))
                    
                    Spacer()
                    
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: geometry.size.height * 0.5)
                        .foregroundColor(.gray)
                        .padding(.trailing, geometry.size.width * 0.03)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
        .frame(height: 50) // can scale up or down and still adapt
        .padding(.horizontal, 8)
    }
}



struct OfferView: View {
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Text("Special Offers")
                    .font(.system(size: geometry.size.width * 0.050, weight: .bold))
                
                Spacer()
                
                Text("See All")
                    .font(.system(size: geometry.size.width * 0.04))
            }
            .padding(.horizontal, geometry.size.width * 0.03)
        }
        .frame(height: 30)
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
