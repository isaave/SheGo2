import SwiftUI
import MapKit

struct PedirCorridaView: View {

    @State private var showCard = false
    let motorista: Motorista

    @State private var camera = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -23.5505, longitude: -46.6333),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )

    var body: some View {
        ZStack(alignment: .bottom) {

    
            Map(position: $camera)
                .ignoresSafeArea()

            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.25), Color(hex: "#6A0030").opacity(0.75)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer()

            
                VStack(spacing: 14) {

                    
                    VStack(spacing: 12) {
                        HStack {
                            Image(motorista.foto)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
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

                        Divider().background(Color(hex: "#F5627B"))

                        HStack(spacing: 16) {
                            Image("carro")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200)

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
                .background(.ultraThinMaterial)
                .cornerRadius(18)
                .shadow(color: Color.black.opacity(0.25), radius: 12, x: 0, y: 8)
                .opacity(showCard ? 1 : 0)
                .offset(y: showCard ? 0 : 30)
                .animation(.easeOut(duration: 0.35), value: showCard)
                .onAppear { showCard = true }
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    PedirCorridaView(
        motorista: Motorista(
            nome: "Helena Maria",
            preco: "R$20,00",
            avaliacao: 5,
            foto: "helena maria",
            modelo: "Hyundai HB20",
            cor: "Prata",
            placa: "BRA2E19",
            descricao: "Motorista parceira há quase 4 anos e especialista em rotas urbanas."
        )
    )
}

