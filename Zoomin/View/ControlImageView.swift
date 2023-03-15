//
//  ControlImageView.swift
//  Zoomin
//
//  Created by Deka Primatio on 15/03/23.
//

import SwiftUI

//Dynamic UI Components from Hard Code
struct ControlImageView: View {
    let icon: String
    
    var body: some View {
        // Injecting Sample Data for Dynamic UI Components
        Image(systemName: icon)
            .font(.system(size: 36))
    }
}

struct ControlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageView(icon: "minus.magnifyingglass")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
