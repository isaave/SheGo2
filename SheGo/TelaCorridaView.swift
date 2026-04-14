import SwiftUI
import MapKit

struct TelaCorridaView: View {
    
    let motorista: Motorista
    @State private var mostrarPopupCancelar = false
    
    @State private var camera = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -23.6336, longitude: -46.6992),
            span: MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)
        )
    )
    
    private let rota: [CLLocationCoordinate2D] = [
        CLLocationCoordinate2D(latitude: -23.6408, longitude: -46.7038),
        CLLocationCoordinate2D(latitude: -23.6390, longitude: -46.7020),
        CLLocationCoordinate2D(latitude: -23.6372, longitude: -46.7002),
        CLLocationCoordinate2D(latitude: -23.6352, longitude: -46.6986),
        CLLocationCoordinate2D(latitude: -23.6336, longitude: -46.6992),
        CLLocationCoordinate2D(latitude: -23.6318, longitude: -46.6975),
        CLLocationCoordinate2D(latitude: -23.6302, longitude: -46.6958)
    ]
    
    private var origem: CLLocationCoordinate2D {
        rota.first ?? CLLocationCoordinate2D(latitude: -23.6408, longitude: -46.7038)
    }
    
    private var destino: CLLocationCoordinate2D {
        rota.last ?? CLLocationCoordinate2D(latitude: -23.6302, longitude: -46.6958)
    }
    
    private var motoristaPosicao: CLLocationCoordinate2D {
        rota[3]
    }
    
    var body: some View {
        ZStack {
            
            Map(position: $camera) {
                Annotation("Origem", coordinate: origem) {
                    Circle()
                        .fill(Color("card and navbar color"))
                        .frame(width: 14, height: 14)
                        .overlay(
                            Circle()
                                .stroke(.white, lineWidth: 3)
                        )
                }
                
                Annotation("Destino", coordinate: destino) {
                    Image(systemName: "mappin.circle.fill")
                        .font(.system(size: 28))
                        .foregroundColor(.red)
                }
                
                Annotation("Motorista", coordinate: motoristaPosicao) {
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 34, height: 34)
                        
                        Image(systemName: "car.fill")
                            .font(.system(size: 16))
                            .foregroundColor(Color("card and navbar color"))
                    }
                    .shadow(radius: 4)
                }
                
                MapPolyline(coordinates: rota)
                    .stroke(.blue, lineWidth: 8)
            }
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                topCard
                    .ignoresSafeArea(edges: .top)
                
                Spacer()
                
                bottomCard
            }
            
            if mostrarPopupCancelar {
                Color.black.opacity(0.35)
                    .ignoresSafeArea()
                
                popupCancelar
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: -23.6352, longitude: -46.6998),
                span: MKCoordinateSpan(latitudeDelta: 0.014, longitudeDelta: 0.014)
            )
            camera = .region(region)
        }
    }
    
    private var topCard: some View {
        VStack(spacing: 0) {
            
            HStack(alignment: .top) {
                HStack(alignment: .center, spacing: 14) {
                    Image(motorista.foto)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(motorista.nome)
                            .font(.custom("Karla-Regular", size: 18))
                            .foregroundColor(.white)
                        
                        HStack(spacing: 2) {
                            ForEach(0..<5, id: \.self) { index in
                                Image(systemName: index < motorista.avaliacao ? "star.fill" : "star")
                                    .font(.system(size: 13))
                                    .foregroundColor(Color("txt color"))
                            }
                        }
                    }
                }
                
                Spacer()
                
                NavigationLink(destination: ChatMotoristaView()) {
                    Image(systemName: "message")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 22)
            .padding(.top, 55)
            
            HStack(alignment: .center, spacing: 8) {
                Image("carro")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 105, height: 60)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Modelo: \(motorista.modelo)")
                    Text("Cor: \(motorista.cor)")
                    Text("Placa: \(motorista.placa)")
                }
                .font(.custom("Karla-Regular", size: 14))
                .foregroundColor(.white)
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 0) {
                    Text("PIN:")
                        .font(.custom("Karla-Bold", size: 16))
                        .foregroundColor(.white)
                    
                    Text("7684")
                        .font(.custom("Karla-Bold", size: 20))
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 22)
            .padding(.top, 12)
            
            Text("Sua corrida foi iniciada!")
                .font(.custom("Karla-Bold", size: 18))
                .foregroundColor(.white)
                .padding(.top, 18)
                .padding(.bottom, 22)
        }
        .frame(maxWidth: .infinity)
        .background(Color("card and navbar color"))
        .cornerRadius(28, corners: [.bottomLeft, .bottomRight])
    }
    
    private var bottomCard: some View {
        VStack(spacing: 18) {
            
            Text("\(motorista.nome) chega em 5 min")
                .font(.custom("Karla-Bold", size: 18))
                .foregroundColor(Color("card and navbar color"))
                .padding(.top, 18)
            
            HStack(alignment: .center) {
                Button {
                    print("Compartilhar")
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 22, weight: .medium))
                        .foregroundColor(Color("card and navbar color"))
                        .frame(width: 36, height: 36)
                }
                
                Spacer()
                
                Button {
                    mostrarPopupCancelar = true
                } label: {
                    Text("Cancelar corrida")
                        .font(.custom("Karla-Bold", size: 14))
                        .foregroundColor(.white)
                        .frame(width: 170, height: 42)
                        .background(Color("btn color"))
                        .cornerRadius(12)
                }
                
                Spacer()
                
                Button {
                    print("SOS")
                } label: {
                    Text("SOS")
                        .font(.custom("Karla-Regular", size: 16))
                        .foregroundColor(.gray)
                        .frame(width: 48, height: 48)
                        .background(Color(.systemGray4))
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 22)
        }
        .frame(maxWidth: .infinity)
        .background(Color("Cor Label"))
        .cornerRadius(28, corners: [.topLeft, .topRight])
        .padding(.top, 415)
    }
    
    private var popupCancelar: some View {
        VStack(spacing: 18) {
            Text("Tem certeza de que deseja\ncancelar essa corrida?")
                .font(.custom("Karla-Bold", size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(Color("card and navbar color"))
            
            NavigationLink(destination: AvaliarCorridaView(motorista: motorista)) {
                Text("Confirmar")
                    .font(.custom("Karla-Bold", size: 16))
                    .foregroundColor(.white)
                    .frame(width: 190, height: 38)
                    .background(Color("btn color"))
                    .cornerRadius(10)
            }
            .buttonStyle(.plain)
            
            Button {
                mostrarPopupCancelar = false
            } label: {
                Text("Voltar para a corrida")
                    .font(.custom("Karla-Bold", size: 16))
                    .foregroundColor(.white)
                    .frame(width: 190, height: 38)
                    .background(Color("btn color"))
                    .cornerRadius(10)
            }
        }
        .padding(.vertical, 30)
        .padding(.horizontal, 24)
        .background(Color("Cor Label"))
        .cornerRadius(24)
        .shadow(radius: 10)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = 25
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    NavigationStack {
        TelaCorridaView(
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
}
