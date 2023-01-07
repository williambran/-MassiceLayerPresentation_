//
//  PostView.swift
//  presentation
//
//  Created by wito on 22/12/22.
//

import SwiftUI

public struct PostView: View {
    
    @ObservedObject public var postVM: PostVM
    
    @State var detailsIsPresented: Bool = false
    
    public init( postVM: PostVM) {
        self.postVM = postVM
    }
    
    public var body: some View {
        
        NavigationView {
            List {
                
                ForEach(postVM.posts) { post in
                    VStack{
                        Text(post.title ?? "")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                        
                        Text(post.body )
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                }.onTapGesture {
                    self.detailsIsPresented = true
                }
            }
            .sheet(isPresented: $detailsIsPresented, content: {
            })
            .navigationBarTitle("Posts")
        }
            
        .onAppear {
            self.postVM.getPosts()
        }
    }
}
