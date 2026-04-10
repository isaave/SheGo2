import SwiftUI

struct PedirCorridaView: View {

    @State private var showCard = false

    let motorista: Motorista

    var body: some View {
        ZStack {
          //  Map(position: .constant(
          //      MapCameraPosition.region(
          //          MKCoordinateRegion(
             //           center: CLLocationCoordinate2D(latitude: -23.5505, longitude: -46.6333),
            //            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                   // )
             //  )
          //  ))
           // .ignoresSafeArea()

            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.25), Color(hex: "#6A0030").opacity(0.75)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer()

                Group {

                Text("Pedindo corrida...")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)

                VStack(spacing: 12) {
                    HStack {
                        Image(motorista.foto)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())

                        VStack(alignment: .leading, spacing: 4) {
                            Text(motorista.nome)
                                .font(.headline)

                            HStack {
                                ForEach(0..<motorista.avaliacao, id: \.self) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color(hex: "#F5627B"))
                                }
                            }
                        }

                        Spacer()

                        Text(motorista.preco)
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color(hex: "#F5627B"))
                    }

                    Divider()
                        .background(Color(hex: "#F5627B"))

                    HStack(spacing: 16) {
                        Image("car_placeholder")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)

                        VStack(alignment: .leading, spacing: 6) {
                            Text("Modelo: Hyundai HB20")
                            Text("Cor: Prata")
                            Text("Placa: BRA2E19")
                        }
                        .font(.subheadline)
                    }

                    Text("Motorista parceira há quase 4 anos e especialista em rotas urbanas. Priorizo sempre o conforto e a tranquilidade das minhas passageiras.")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)

                Button(action: {}) {
                    Text("Confirmar Corrida")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "#F5627B"))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .padding()
                }
                .background(.ultraThinMaterial)
                .cornerRadius(18)
                .shadow(color: Color.black.opacity(0.25), radius: 12, x: 0, y: 8)
                .opacity(showCard ? 1 : 0)
                .offset(y: showCard ? 0 : 30)
                .animation(.easeOut(duration: 0.35), value: showCard)
                .onAppear { showCard = true }
            }
    }
}

#Preview {
    PedirCorridaView(
        motorista: Motorista(
            nome: "Helena Maria",
            preco: "R$20,00",
            avaliacao: 5,
            foto: "helena maria"
        )
    )
}

