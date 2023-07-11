//
//  ContentView.swift
//  happy-play
//
//  Created by Roy Cuenca on 11/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var videoManager = VideoManager()
    var columnsGrid = [
        GridItem(.adaptive(minimum: 160), spacing: 20),
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach(Query.allCases, id: \.self) { searchQuery in
                        QueryTag(query: searchQuery, isSelected: videoManager.selectedQuery == searchQuery).onTapGesture {
                            videoManager.selectedQuery = searchQuery
                        }
                    }
                }
                
                ScrollView{
                    if videoManager.videos.isEmpty {
                        ProgressView()
                    } else {
                        LazyVGrid(columns: columnsGrid, spacing: 20) {
                            ForEach(videoManager.videos, id: \.id) {video in
                                NavigationLink{
                                    VideoView(video: video)
                                } label: {
                                    VideoCard(video: video )
                                }
                            }
                        }.padding(20)
                    }
                    
                }.frame(maxWidth: .infinity)
                
            }
                .background(Color("AccentColor"))
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
