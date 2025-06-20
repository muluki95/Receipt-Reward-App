import Foundation
import SwiftUI

struct ScanReceiptsView: View {
    @State var scannedImage: UIImage?
    @State var isScanning = false
    @StateObject var viewModel = ReceiptViewModel()
    @ObservedObject var historyViewModel: HistoryViewModel

    var body: some View {
        NavigationView {
            VStack {
                // Displays the scanned image
                if let image = scannedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .cornerRadius(20)
                        .padding()
                }

                Button(action: {
                    isScanning = true
                }) {
                    Text("Scan Receipts")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .padding()
                        .cornerRadius(20)
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
            .onAppear {
                viewModel.historyViewModel = historyViewModel
            }
            .sheet(isPresented: $isScanning) {
#if targetEnvironment(simulator)
                if let mockImage = UIImage(named: "sample_receipt") {
                    ScannerMockView(image: mockImage) {
                        self.scannedImage = mockImage
                        self.isScanning = false
                        viewModel.processScannedImage(mockImage)
                    }
                } else {
                    Text("Mock image not found")
                }
#else
                ScannerView { scanned in
                    self.scannedImage = scanned
                    self.isScanning = false
                    viewModel.processScannedImage(scanned)
                }
#endif
            }
        }
    }
}

#Preview {
    ScanReceiptsView(historyViewModel: HistoryViewModel())
}

