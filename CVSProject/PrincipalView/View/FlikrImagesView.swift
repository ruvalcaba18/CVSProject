//
//  ContentView.swift
//  CVSProject
//
//  Created by Jael Ruvalcaba on 31/01/24.
//

import SwiftUI

struct FlikrImagesView: View {
    
    @StateObject private var viewModel = FlikrImagesViewModel()
    private var columns = [GridItem(.fixed(170),spacing: 15) , GridItem(.fixed(170),spacing: 10)]
    
    private var placeHolderImage: some View {
        Image("placeholder")
            .resizable()
            .frame(width: 100, height: 100)
            .padding(.leading, 5)
            .accessibilityIdentifier("PlaceHolder_Image")
        
    }
    
    @ViewBuilder private func rederGridImages() -> some View {
        ScrollView {
            LazyVGrid(columns: columns, content: {
                ForEach(viewModel.imagesModel) { images in
                    CacheAsyncImage(url: URL(string: images.media?.m ?? "") ?? URL(fileURLWithPath: "")) { phase in
                        switch phase{
                        case .success(let image):
                            image
                                .resizable()
                                .accessibilityIdentifier("coinImage_\(images.title ?? "")")
                                .onTapGesture {
                                    viewModel.isMoveToImageDetails = true
                                }
                                .background(
                                    NavigationLink(isActive: $viewModel.isMoveToImageDetails) {
                                        DetailViewUI(coinSelected: $viewModel.coinSelected)
                                        
                                    } label: {
                                        EmptyView()
                                    }
                                    
                                )
                        case .failure(_):
                            placeHolderImage
                        case .empty:
                            ProgressView()
                        @unknown default:
                            placeHolderImage
                        }
                    }
                }
            })
            
        }
        .task {
            await viewModel.retrieveImagesOf(tag: "porcupine")
        }
        .navigationTitle("CVS Test")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                rederGridImages()
            }
        }
        .searchable(text: $viewModel.searchText)
    }
}

#Preview {
    FlikrImagesView()
}
