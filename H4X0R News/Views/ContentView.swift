//
//  ContentView.swift
//  H4X0R News
//
//  Created by Hiệp Nguyễn on 07/08/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            //for each post in array posts, create a text with its title
            List(networkManager.posts){ post in
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    })
            }
            .navigationBarTitle("h4x0r news")
        }
        .onAppear(perform: {
            networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 11 Pro Max")
    }
}


