//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Guilherme Peppi on 28/07/22.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                  }
                }
            }
                .navigationTitle("Apple Frameworks")
                .sheet(isPresented: $viewModel.isShowingDeatilView) {
                    FrameworkDetailView(framework: viewModel.selectedFramework!, isShowingDeailView: $viewModel.isShowingDeatilView)
                }
       }
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
            .preferredColorScheme(.dark)
            
    }
}

struct FrameworkTitleView: View {
    let framework: Framework
    
    var body: some View {
    
    VStack {
        Image(framework.imageName)
            .resizable()
            .frame(width: 90, height: 90)
        Text(framework.name)
            .font(.title2)
            .fontWeight(.semibold)
            .scaledToFit()
            .minimumScaleFactor(0.6)
        }
    .padding()
    }
}
