//
//  RewardsList.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/3/25.
//

import Foundation
import SwiftUI


struct RewardsList: View {
    let rewards: [Rewards]
    
    var body: some View {
        VStack{
            Text("RewardsList")
            
            List(rewards) { reward in
                RewardsRow(reward: reward)
            }
        }
    }
        
}
struct RewardsList_Previews: PreviewProvider {
    static var previews: some View {
        RewardsList(rewards: [
            Rewards(id: UUID().uuidString,title:"$5 Gift Card", pointsRequired: 500),
            Rewards(id:UUID().uuidString, title:"$10 Target Gift Card",pointsRequired:1000)
        ])
    }
}
