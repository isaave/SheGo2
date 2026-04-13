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

struct TopRoundedShape: Shape {
    var radius: CGFloat = 24
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: radius))
        path.addQuadCurve(
            to: CGPoint(x: radius, y: 0),
            control: CGPoint(x: 0, y: 0)
        )
        path.addLine(to: CGPoint(x: rect.maxX - radius, y: 0))
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX, y: radius),
            control: CGPoint(x: rect.maxX, y: 0)
        )
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
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
            nome: "Helena Maria",
            preco: "R$20,00",
            avaliacao: 5,
            foto: "helena maria",
            modelo: "Hyundai HB20",
            cor: "Prata",
            placa: "BRA2E19",
            descricao: "Motorista parceira há quase 4 anos e especialista em rotas urbanas. Priorizo sempre o conforto e a tranquilidade das minhas passageiras."
        ),
        Motorista(
            nome: "Fernanda Almeida",
            preco: "R$18,00",
            avaliacao: 4,
            foto: "fernanda almeida",
            modelo: "Fiat Argo",
            cor: "Branco",
            placa: "QWE4F56",
            descricao: "Motorista cuidadosa, pontual e com foco em corridas seguras e tranquilas, principalmente para trajetos do dia a dia."
        ),
        Motorista(
            nome: "Marcela Ramos",
            preco: "R$17,00",
            avaliacao: 3,
            foto: "marcela ramos",
            modelo: "Chevrolet Onix",
            cor: "Vermelho",
            placa: "ABC1D23",
            descricao: "Tenho experiência com corridas urbanas e busco oferecer uma viagem confortável e acolhedora para cada passageira."
        ),
        Motorista(
            nome: "Rita de Cássia",
            preco: "R$17,00",
            avaliacao: 4,
            foto: "rita",
            modelo: "Renault Kwid",
            cor: "Cinza",
            placa: "XYZ9K88",
            descricao: "Atendimento simpático e responsável, sempre priorizando segurança, clareza no trajeto e uma boa experiência."
        )
    ]
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            Map(position: $camera)
                .ignoresSafeArea()
            
            if selectedMotorista != nil {
                Color.black.opacity(0.001)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            selectedMotorista = nil
                        }
                    }
            }
            
           
           
            VStack {
                Spacer()
                
                VStack(spacing: 12) {
                    
                    Capsule()
                        .fill(Color.white.opacity(0.9))
                        .frame(width: 70, height: 4)
                        .padding(.top, 8)
                    
                    VStack(spacing: 8) {
                        routeRow("Senac Santo Amaro")
                        routeRow("Roldão Atacadista")
                    }
                    .padding(.horizontal, 12)
                    
                    if let motorista = selectedMotorista {
                        VStack(spacing: 12) {
                            motoristaDetalhado(motorista)
                            
                            ScrollView(showsIndicators: false) {
                                VStack(spacing: 12) {
                                    ForEach(motoristas.filter { $0.id != motorista.id }) { item in
                                        motoristaCard(item)
                                            .blur(radius: 2)
                                            .opacity(0.25)
                                    }
                                }
                                .padding(.horizontal, 12)
                                .padding(.bottom, 8)
                            }
                            .frame(height: 170)
                        }
                    } else {
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 12) {
                                ForEach(motoristas) { motorista in
                                    motoristaCard(motorista)
                                }
                            }
                            .padding(.horizontal, 12)
                            .padding(.bottom, 8)
                        }
                        .frame(height: 390)
                    }
                    
                    Button {
                    } label: {
                        Text("Escolher Motorista")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .background(selectedMotorista != nil ? Color(hex: "#F5627B") : Color.white.opacity(0.5))
                            .cornerRadius(12)
                    }
                    .disabled(selectedMotorista == nil)
                    .padding(.horizontal, 12)
                    .padding(.bottom, 5)
                }
                .frame(maxWidth: .infinity)
                .background(Color(hex: "#A00049"))
                .clipShape(TopRoundedShape(radius: 2555))
                .ignoresSafeArea(edges: .bottom)
            }
        }
        .navigationBarBackButtonHidden(true)
        .animation(.easeInOut(duration: 0.25), value: selectedMotorista?.id)
    }
    
    func routeRow(_ text: String) -> some View {
        HStack(spacing: 10) {
            VStack(spacing: 2) {
                Circle()
                    .fill(Color.white)
                    .frame(width: 5, height: 5)
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 1.5, height: 14)
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 5, height: 5)
            }
            
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .medium))
            
            Spacer()
        }
        .padding(.horizontal, 14)
        .frame(height: 42)
        .background(Color(hex: "#83003B"))
        .cornerRadius(12)
    }
    
    func motoristaCard(_ motorista: Motorista) -> some View {
        HStack(spacing: 12) {
            Image(motorista.foto)
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 4) {
                    Text(motorista.nome)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                    
                    Image(systemName: "checkmark.seal")
                        .font(.system(size: 11))
                        .foregroundColor(.black.opacity(0.85))
                }
                
                Button {
                    withAnimation {
                        selectedMotorista = motorista
                    }
                } label: {
                    Text("Ver mais")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(Color(hex: "#F5627B"))
                        .cornerRadius(8)
                }
                .buttonStyle(.plain)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 10) {
                HStack(spacing: 2) {
                    ForEach(0..<5, id: \.self) { index in
                        Image(systemName: index < motorista.avaliacao ? "star.fill" : "star")
                            .font(.system(size: 11))
                            .foregroundColor(Color(hex: "#FF2C74"))
                    }
                }
                
                Text(motorista.preco)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(hex: "#A00049"))
            }
        }
        .padding(14)
        .background(Color(hex: "#F7ECEC"))
        .cornerRadius(16)
    }
    
    func motoristaDetalhado(_ motorista: Motorista) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .top) {
                Image(motorista.foto)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 54, height: 54)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(motorista.nome)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                HStack(spacing: 2) {
                    ForEach(0..<5, id: \.self) { index in
                        Image(systemName: index < motorista.avaliacao ? "star.fill" : "star")
                            .font(.system(size: 12))
                            .foregroundColor(Color(hex: "#FF2C74"))
                    }
                }
            }
            
            HStack(alignment: .top, spacing: 12) {
                Image("carro motorista")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 60)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Modelo: \(motorista.modelo)")
                    Text("Cor: \(motorista.cor)")
                    Text("Placa: \(motorista.placa)")
                }
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.black)
            }
            
            Rectangle()
                .fill(Color(hex: "#F2B0B8"))
                .frame(height: 1)
            
            Text(motorista.descricao)
                .font(.system(size: 13))
                .foregroundColor(.black)
                .fixedSize(horizontal: false, vertical: true)
            
            HStack {
                Spacer()
                
                Text(motorista.preco)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color(hex: "#A00049"))
            }
        }
        .padding(16)
        .background(Color(hex: "#F7ECEC"))
        .cornerRadius(18)
        .padding(.horizontal, 12)
    }
}

#Preview {
    NavigationStack {
        EscolhaMotorista()
    }
}
