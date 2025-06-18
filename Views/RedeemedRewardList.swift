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
            List(redeemedrewards){reward in
                RedeemedRewardRow(redeemedreward: reward)
                
            }
        }
    }
}
struct RedeemedRewardList_Previews: PreviewProvider {
    static var previews: some View {
        RedeemedRewardList(redeemedrewards: [
            RedeemedReward(id:UUID().uuidString, title:"$10 Starbucks Card",imageName:"Starbucks",dateRedeemed: Date(), pointsUsed:1000 ),
            RedeemedReward(id:UUID().uuidString, title:"$50 Walmart Gift Card",imageName:"Walmart",dateRedeemed: Date(), pointsUsed:5000)
        ])
    }
}
