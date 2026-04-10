import SwiftUI

struct AvaliacaoFinalView: View {

    var body: some View {
        ZStack {
          
            Color(hex: "#F4DCC7")
                .ignoresSafeArea()

            VStack(spacing: 24) {
                Spacer(minLength: 50)
                Spacer()

                Image("pinguim")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)

                Text("Sua corrida foi finalizada?")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hex: "#8B0036"))

                Button(action: {
                 
                }) {
                    Text("Confirmar")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "#8B0036"))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal, 40)
                }

                Spacer()
            }
        }
    }
}


#Preview {
    AvaliacaoFinalView()
}

