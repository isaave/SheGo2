import SwiftUI
import MapKit

struct Motorista: Identifiable {
    let id = UUID()
    let nome: String
    let preco: String
    let avaliacao: Int
    let foto: String
    let modelo: String
    let cor: String
    let placa: String
    let descricao: String
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
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedMotorista: Motorista? = nil
    
    @State private var camera = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -23.6336, longitude: -46.6992),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )
    
    let motoristas: [Motorista] = [
        Motorista(
            nome: "Fernanda Almeida",
            preco: "R$18,00",
            avaliacao: 4,
            foto: "fernanda almeida",
            modelo: "Fiat Argo",
            cor: "Branco",
            placa: "QWE4F56",
            descricao: "Motorista cuidadosa, pontual e com foco em corridas seguras e tranquilas."
        ),
        Motorista(
            nome: "Marcela Ramos",
            preco: "R$17,00",
            avaliacao: 3,
            foto: "marcela ramos",
            modelo: "Chevrolet Onix",
            cor: "Vermelho",
            placa: "ABC1D23",
            descricao: "Experiência com corridas urbanas e viagens confortáveis."
        ),
        Motorista(
            nome: "Rita de Cássia",
            preco: "R$17,00",
            avaliacao: 4,
            foto: "rita",
            modelo: "Renault Kwid",
            cor: "Cinza",
            placa: "XYZ9K88",
            descricao: "Atendimento simpático e responsável."
        )
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
            
            Map(position: $camera)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                ZStack {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Circle()
                                .fill(Color(hex: "#A00049"))
                                .frame(width: 42, height: 42)
                                .overlay(
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(.white)
                                )
                        }
                        Spacer()
                    }
                    
                    Text("Sarah Freitas")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color(hex: "#F5627B"))
                        .cornerRadius(10)
                }
                .padding(.top, 60)
                .padding(.horizontal)
                
                Spacer()
            }
            
            VStack {
                Spacer()
                
                VStack(spacing: 12) {
                    
                    ForEach(motoristas) { motorista in
                        HStack {
                            Text(motorista.nome)
                            Spacer()
                            Text(motorista.preco)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .onTapGesture {
                            selectedMotorista = motorista
                        }
                    }
                    
                    Button {
                    } label: {
                        Text("Escolher Motorista")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(selectedMotorista != nil ? Color.pink : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .disabled(selectedMotorista == nil)
                }
                .padding()
                .background(Color(hex: "#A00049"))
                .cornerRadius(20)
            }
        }
    }
}

#Preview {
    NavigationStack {
        EscolhaMotorista()
    }
}
