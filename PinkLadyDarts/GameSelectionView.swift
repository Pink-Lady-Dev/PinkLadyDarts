//
//  GameSelectionView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 2/8/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct GameSelectionView: View {
    
    //    enum menuItems {
    //        case X01, Settings
    //    }
    //
    //    var item: menuItems
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    NavigationLink(destination: inGameXO1View()) {
                        Text("X01")
                    }
                }
            }
            
        }
    }
}

struct GameSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GameSelectionView()
    }
}
