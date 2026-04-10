import SwiftUI

struct CorridaView: View {

    let motorista: Motorista

    var body: some View {
        ZStack {
         
            Image("corrida")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

    
            Image(systemName: "mappin.circle.fill")
                .font(.system(size: 40))
                .foregroundColor(Color(hex: "#F5627B"))
                .shadow(color: .black.opacity(0.4), radius: 9)
        }

         
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Text("SOS")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 18)
                            .padding(.vertical, 10)
                            .background(Color(hex: "#D91E36"))
                            .clipShape(Capsule())
                            .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 4)
                    }
                    Spacer()
                }
                .padding(.bottom, 24)
            }
        }
    }

#Preview {
    CorridaView(
        motorista: Motorista(
            nome: "Helena Maria",
            preco: "R$20,00",
            avaliacao: 5,
            foto: "helena maria"
        )
    )
}

