import Foundation
import SwiftUI

struct ScanReceiptsView: View {
    @State private var selectedImage: UIImage?
    @State private var imageURL : URL?
    @State private var isShowingImagePicker = false
    @State private var selectedReceipt: ReceiptDetails? = nil
    @State private var redeemedReceipt: RedeemedReward? = nil
   
    
    @StateObject var uploadVM = UploadReceiptViewModel()
    @StateObject var viewModel: ReceiptViewModel
    @ObservedObject var historyViewModel: HistoryViewModel
    @Binding var selectedTab: Int
    
   

    
    init(historyViewModel: HistoryViewModel, selectedTab: Binding<Int>){
        self.historyViewModel = historyViewModel
        self._selectedTab = selectedTab
        _viewModel = StateObject(wrappedValue:ReceiptViewModel(historyViewModel: historyViewModel))
        
    }
    var body: some View {
        NavigationStack {
            VStack {
                // Displays the scanned image
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .cornerRadius(20)
                        .padding()
                }
                if selectedImage == nil {
                    Button(action: {
                        isShowingImagePicker = true
                    }) {
                        Text("Select Receipt")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .padding()
                            .cornerRadius(20)
                    }
                } else {
                    //  shows "Scan Receipt" after an image is picked
                    if selectedImage != nil {
                        Button("Process & Upload Receipt") {
                            if let image = selectedImage {
                                Task {
                                    // 1. Parse the receipt first
                                    await withCheckedContinuation { continuation in
                                        viewModel.onReceiptParsed = {
                                            continuation.resume()
                                        }
                                        viewModel.processScannedImage(image,imageURL: imageURL!)
                                        
                                    }
                                    
                                    
                                    // 2. Save the parsed receipt
                                    if let parsed = viewModel.receipt {
                                        await uploadVM.uploadReceipt(
                                            details: (
                                                    image: image,
                                                    storeName: parsed.storeName,
                                                    totalAmount: parsed.totalAmount,
                                                    pointsEarned: parsed.pointsEarned
                                                )
                                        )
                                       selectedReceipt = parsed
                                                    
                                    } else {
                                        print("No parsed receipts available to save")
                                    }
                                }
                            }
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .cornerRadius(20)
                        
                    }
                }
                // Show the parsed receipt details
                if let receipt = viewModel.receipt {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Parsed Receipt Info")
                            .font(.headline)
                            .padding(.top)

                        Text("Store: \(receipt.storeName)")
                        Text("Date: \(receipt.dateScanned)")
                        Text("Total: $\(String(format: "%.2f", receipt.totalAmount))")
                    }
                    .padding()
                }
               
                
                
            }
            .navigationTitle(Text("Scan Receipts"))
            //Navigation to the view where u redeem the receipts
            .navigationDestination( item: $selectedReceipt){
                receipt in
                                ReceiptDetailsList(
                                    receipt: [receipt], // Show just the parsed receipt
                                    viewModel: viewModel,
                                    onRedeem: { receipt in
                                        Task {
                                            await historyViewModel.saveRedeemedReward(receipt: receipt)
                                            let reward = RedeemedReward(from: receipt)
                                            redeemedReceipt = reward
                                        }
                                    }
                                )
                            }
            .navigationDestination( item : $redeemedReceipt){ reward in RedeemedRewardRow(redeemedreward: reward)}
            }
            .onAppear {
                viewModel.historyViewModel = historyViewModel
                // 👇 Listen for new receipt & switch tab
                        viewModel.onReceiptParsed = {
                                    self.selectedTab = 1
                                }
            }
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePicker { selectedURL in
                    self.imageURL = selectedURL
                    if let data = try? Data(contentsOf: selectedURL) {
                        self.selectedImage = UIImage(data: data)
                    }
                }
            }

        }
    }


#Preview {
    ScanReceiptsView(historyViewModel: HistoryViewModel(), selectedTab: .constant(0))
}


