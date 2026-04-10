import SwiftUI
import MapKit

struct Motorista: Identifiable {
    let id = UUID()
    let nome: String
    let preco: String
    let avaliacao: Int
    let foto: String
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}


struct EscolhaMotorista: View {

    @State private var selectedMotorista: String? = nil

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

            VStack(spacing: 12) {

               
                VStack(alignment: .leading, spacing: 6) {
                    routeRow(icon: "location.fill", text: "Senac Santo Amaro")
                    routeRow(icon: "mappin.circle.fill", text: "Roldão Atacadista")
                }
                .padding()
                .background(Color(hex: "#6A0030").opacity(0.55))
                .cornerRadius(16)
                .padding(.horizontal)

                ScrollView {
                    VStack(spacing: 12) {
                        motoristaCard(Motorista(nome: "Helena Maria", preco: "R$20,00", avaliacao: 5, foto: "helena maria"))
                        motoristaCard(Motorista(nome: "Fernanda Almeida", preco: "R$18,00", avaliacao: 4, foto: "fernanda almeida"))
                        motoristaCard(Motorista(nome: "Marcela Ramos", preco: "R$17,00", avaliacao: 3, foto: "marcela ramos"))
                        motoristaCard(Motorista(nome: "Rita de Cássia", preco: "R$17,00", avaliacao: 4, foto: "rita"))
                    }
                    .padding(.horizontal)
                }
                .frame(height: 320)

                Button(action: {}) {
                    Text("Escolher Motorista")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedMotorista != nil ? Color(hex: "#F5627B") : Color.gray.opacity(0.4))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .disabled(selectedMotorista == nil)
            }
            .padding(.bottom, 30)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0.2), Color(hex: "#6A0030").opacity(0.75)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea(edges: .bottom)
            )
        }
    }

    func routeRow(icon: String, text: String) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
            Text(text)
                .foregroundColor(.white)
            Spacer()
        }
    }

    func motoristaCard(_ motorista: Motorista) -> some View {
        HStack {
            Image(motorista.foto)
                .resizable()
                .scaledToFit()
                .frame(width: 80)

            VStack(alignment: .leading) {
                Text(motorista.nome)
                    .font(.headline)
                Text("Ver mais")
                    .font(.caption)
                    .foregroundColor(Color(hex: "#6A0030"))
            }

            Spacer()

            VStack(alignment: .trailing) {
                HStack {
                    ForEach(0..<5) { index in
                        Image(systemName: index < motorista.avaliacao ? "star.fill" : "star")
                            .foregroundColor(Color(hex: "#6A0030"))
                    }
                }
                Text(motorista.preco)
                    .font(.headline)
                    .foregroundColor(Color(hex: "#6A0030"))
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(selectedMotorista == motorista.nome ? Color.white.opacity(0.98) : Color.white.opacity(0.9))
                .shadow(color: Color.black.opacity(0.15), radius: 6, x: 0, y: 3)
        )
        .opacity(selectedMotorista == nil || selectedMotorista == motorista.nome ? 1.0 : 0.35)
        .cornerRadius(16)
        .onTapGesture {
            selectedMotorista = motorista.nome
        }
    }
}

#Preview {
    EscolhaMotorista()
}

