import SwiftUI

struct BuscandoMotoristaView: View {
    
    @State private var irParaProxima = false
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
        
                Color("background color")
                    .ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                    
                  
                    Image("animation")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220)
                    
                    Spacer()
                }
            }
            
           
           // .navigationDestination(isPresented: $irParaProxima) {
                //HomepageView()
           // }
            
            
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    irParaProxima = true
                }
            }
        }
    }
}

#Preview {
    BuscandoMotoristaView()
}
    
