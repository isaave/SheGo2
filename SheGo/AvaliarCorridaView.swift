import SwiftUI

struct AvaliarCorridaView: View {

    var body: some View {
        ZStack {
            
           
            Color(red: 244/255, green: 220/255, blue: 199/255)
                .ignoresSafeArea()

            VStack(spacing: 24) {

                Spacer()

                
                Image("pinguim")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)

          
                Text("Sua corrida foi finalizada?")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 139/255, green: 0, blue: 54/255))

                VStack(spacing: 12) {
                    
                    Button {
                        print("Sim")
                    } label: {
                        Text("Sim")
                            .foregroundColor(.white)
                            .frame(width: 160)
                            .padding()
                            .background(Color(red: 245/255, green: 98/255, blue: 123/255))
                            .cornerRadius(12)
                    }

                    Button {
                        print("Não")
                    } label: {
                        Text("Não")
                            .foregroundColor(.white)
                            .frame(width: 160)
                            .padding()
                            .background(Color(red: 245/255, green: 98/255, blue: 123/255))
                            .cornerRadius(12)
                    }
                }

                Spacer()
            }
        }
    }
}

#Preview {
    AvaliarCorridaView()
}
