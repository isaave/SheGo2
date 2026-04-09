import SwiftUI

struct EscolhaUsuarioView: View {
    
    var body: some View {
        ZStack {
            
            Color("background color")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Spacer()
                
                Image("logo com bem-vinda")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180)
                
                Text("Como você pretende\nusar nosso aplicativo?")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("card and navbar color"))
                
                VStack(spacing: 15) {
                    
                    NavigationLink(destination: LoginView()) {
                        botao("Passageira", "figure.stand")
                    }
                    .buttonStyle(.plain)
                    
                    botao("Motorista", "car")
                }
                
                Spacer()
            }
            .padding(.horizontal, 30)
        }
    }
    
    func botao(_ texto: String, _ icone: String) -> some View {
        HStack {
            Image(systemName: icone)
            Text(texto)
                .fontWeight(.semibold)
        }
        .foregroundColor(Color("txt color"))
        .frame(width: 221, height: 68)
        .background(Color("btn color"))
        .cornerRadius(12)
    }
}
#Preview {
    EscolhaUsuarioView()
}
