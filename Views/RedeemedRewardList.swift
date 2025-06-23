//
//  RedeemedRowList.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/12/25.
//

import SwiftUI


struct RedeemedRewardList: View {
    let redeemedrewards: [RedeemedReward]
    var body: some View {
        VStack {
            
            Text("Redeemed Rewards")
            ForEach(redeemedrewards){reward in
                RedeemedRewardRow(redeemedreward: reward)
                
            }
        }
    }
}

