import SwiftUI


struct BuscandoMotoristaView: View {
    
    @State var irParaProxima = false
    
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
                        .frame(width: 280)
                    
                    Spacer()
                }
            }
            
            .navigationDestination(isPresented: $irParaProxima) {
                EscolhaMotorista()
                    .navigationBarBackButtonHidden(true)
            }
            
      
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    irParaProxima = true
                }
            }
        }
    }
}

#Preview {
    BuscandoMotoristaView()
}
