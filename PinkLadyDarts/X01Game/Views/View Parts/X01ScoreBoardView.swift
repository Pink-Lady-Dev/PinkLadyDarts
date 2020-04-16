//
//  X01ScoreBoardView.swift
//  PinkLadyDarts
//
//  Created by Nick Clason on 4/15/20.
//  Copyright © 2020 Nick Clason. All rights reserved.
//

import SwiftUI

struct X01ScoreBoardView: View {
    
    @ObservedObject var X01GameVM: X01GameViewModel
    
    var body: some View {
        HStack {
            PlayerScoreView(X01GameVM: X01GameVM, isLHS: true)
                .padding()
            PlayerScoreView(X01GameVM: X01GameVM, isLHS: false)
            .padding()
        }
    }
}

struct X01ScoreBoardView_Previews: PreviewProvider {
    static var previews: some View {
        X01ScoreBoardView(X01GameVM: X01GameViewModel(startingX01Points: 301))
    }
}
