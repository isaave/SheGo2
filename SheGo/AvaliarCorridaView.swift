import SwiftUI

struct AvaliarCorridaView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color("background color")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Spacer()
                
                Image("pinguim")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                
                Text("Sua corrida foi finalizada?")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(#colorLiteral(red: 0.65, green: 0.0, blue: 0.25, alpha: 1)))
                
                VStack(spacing: 12) {

                    NavigationLink(destination: HomepageView()) {
                        Text("Sim")
                            .foregroundColor(.white)
                            .frame(width: 150, height: 45)
                            .background(Color(#colorLiteral(red: 0.94, green: 0.36, blue: 0.45, alpha: 1)))
                            .cornerRadius(10)
                    }
                    
                   
                    NavigationLink(destination: TelaCorridaView()) {
                        Text("Não")
                            .foregroundColor(.white)
                            .frame(width: 150, height: 45)
                            .background(Color(#colorLiteral(red: 0.94, green: 0.36, blue: 0.45, alpha: 1)))
                            .cornerRadius(10)
                    }
                }
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    NavigationStack {
        AvaliarCorridaView()
    }
}
