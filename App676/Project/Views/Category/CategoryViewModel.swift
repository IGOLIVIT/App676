//
//  CategoryViewModel.swift
//  App676
//
//  Created by IGOR on 08/07/2024.
//

import SwiftUI

final class CategoryViewModel: ObservableObject {

    @AppStorage("categories") var categories: [String] = []

    @Published var addCat = ""
    
    @Published var isAddCat: Bool = false

    
}
