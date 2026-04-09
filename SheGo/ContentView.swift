import SwiftUI

struct ContentView: View {
    
    @State private var irParaEscolhaUsuario = false
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                Color("background color")
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Image("logo and slogan")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                    
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $irParaEscolhaUsuario) {
                EscolhaUsuarioView()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    irParaEscolhaUsuario = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
