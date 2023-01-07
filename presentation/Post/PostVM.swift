//
//  PostVM.swift
//  presentation
//
//  Created by wito on 22/12/22.
//

import Foundation
import domain

public class PostVM: ObservableObject {
    
    @Published var posts: [PostEntity] = []
    
    private var postInteractor: PostInteractorInterface
    
    public init(postInteractor: PostInteractorInterface) {
        self.postInteractor = postInteractor
    }
    
    func getPosts() {
        
        self.postInteractor.getPosts { [weak self] (postArray) in
            DispatchQueue.main.async {
                self?.posts = postArray
            }
        }
    }
}
