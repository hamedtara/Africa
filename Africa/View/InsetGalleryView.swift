import SwiftUI

struct InsetGalleryView: View {
    let animal: Animal

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item) // Assuming each 'item' is a string referencing an image in the assets
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }
        }
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animal.json")
    
    static var previews: some View {
        InsetGalleryView(animal: animals[0]) // 
            .previewLayout(.sizeThatFits)
            .padding()
    }
}