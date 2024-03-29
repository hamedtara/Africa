import SwiftUI

struct ContentView: View {
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var  isGridViewActive: Bool = false;
    
    @State private var  gridLayout:[GridItem] = [GridItem(.flexible())]
    
    @State private var gridC: Int = 1
    
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridC = gridLayout.count
        
        switch gridC {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"


        default:
            toolbarIcon = "square.grid.2x2"
        }
        
    }
    
//    let gridItem: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor) // Changed from .foregroundStyle(.tint)
            NavigationView {
                
                Group{
                    if !isGridViewActive {
                        List {
                            CoverImageView().frame(height: 300).listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            ForEach(animals, id: \.id) { animal in // Assuming `Animal` has an `id` property
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalListItemView(animal: animal)
                                }
                            }
                            CreditsView().modifier(CenterModifer())
                        }
                    } else {
                        ScrollView(.vertical,showsIndicators:false) {
                            LazyVGrid(columns :gridLayout,alignment: .center,spacing:10) {
                                ForEach(animals) { animal in
                                    NavigationLink(destination:AnimalDetailView(animal:animal)){
                                        AnimalGridItemView(animal: animal)
                                    }
                                }
                            }.padding(10)
                                .animation(.easeIn)
                        }
                    }
                }
               
                .navigationTitle("Africa")
                .toolbar {
                         ToolbarItem(placement: .navigationBarTrailing) {
                             HStack (spacing:16){
                                 Button(action: {
                                     print("List View is Activated")
                                     isGridViewActive = false;
                                     haptic.impactOccurred()
                                     
                                 }) {
                                     Image(systemName: "square.fill.text.grid.1x2")
                                         .font(.title2)
                                         .foregroundColor(isGridViewActive ? .primary : .accentColor)
                                 }
                                 Button(action: {
                                     print("Grid View Is activated")
                                     isGridViewActive = true;
                                     haptic.impactOccurred()
                                     gridSwitch()
                                 }){
                                     Image(systemName: toolbarIcon)
                                         .font(.title2)
                                         .foregroundColor(isGridViewActive ? .primary : .accentColor)
                                 }
                             }
                                    }
                                }
                            }
                        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
