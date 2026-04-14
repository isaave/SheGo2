import SwiftUI
import MapKit

struct PedirCorridaView: View {
    
    let motorista: Motorista
    
    @State private var camera = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -23.6336, longitude: -46.6992),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )
    
    var body: some View {
        ZStack {
            
            Map(position: $camera)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 14) {
                    
                    Capsule()
                        .fill(Color("txt color"))
                        .frame(width: 90, height: 4)
                        .padding(.top, 8)
                    
                    Text("Resumo da corrida")
                        .font(.custom("Karla-Bold", size: 22))
                        .foregroundColor(Color("txt color"))
                    
                    VStack(alignment: .leading, spacing: 14) {
                        
                        HStack(alignment: .top) {
                            Image(motorista.foto)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 56, height: 56)
                                .clipShape(Circle())
                            
                            Text(motorista.nome)
                                .font(.custom("Karla-Bold", size: 18))
                                .foregroundColor(.black)
                                .padding(.top, 6)
                            
                            Spacer()
                            
                            HStack(spacing: 2) {
                                ForEach(0..<5, id: \.self) { index in
                                    Image(systemName: index < motorista.avaliacao ? "star.fill" : "star")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color("btn color"))
                                }
                            }
                            .padding(.top, 8)
                        }
                        
                        HStack(alignment: .center, spacing: 14) {
                            Image("carro")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 115, height: 72)
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text(motorista.modelo)
                                Text(motorista.cor)
                                Text(motorista.placa)
                                Text("1,4 Km")
                            }
                            .font(.custom("Karla-Regular", size: 16))
                            .foregroundColor(.black)
                        }
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            HStack(alignment: .top, spacing: 14) {
                                VStack(spacing: 2) {
                                    Circle()
                                        .fill(Color("card and navbar color"))
                                        .frame(width: 5, height: 5)
                                    
                                    Rectangle()
                                        .fill(Color("card and navbar color"))
                                        .frame(width: 1.5, height: 28)
                                    
                                    Circle()
                                        .fill(Color("card and navbar color"))
                                        .frame(width: 5, height: 5)
                                }
                                .padding(.top, 6)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Seu local:")
                                        .font(.custom("Karla-Bold", size: 15))
                                        .foregroundColor(.black)
                                    
                                    Text("Senac Santo Amaro, Av. Eng. Eusébio Stevaux, 823\nSanto Amaro, São Paulo - SP, 04696-000")
                                        .font(.custom("Karla-Regular", size: 14))
                                        .foregroundColor(.black.opacity(0.85))
                                }
                            }
                            
                            HStack(alignment: .top, spacing: 10) {
                                Color.clear
                                    .frame(width: 5, height: 5)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Destino:")
                                        .font(.custom("Karla-Bold", size: 15))
                                        .foregroundColor(.black)
                                    
                                    Text("Roldão Atacadista, Av. das Nações Unidas, 22063\nCampo Grande, São Paulo - SP, 04795-100")
                                        .font(.custom("Karla-Regular", size: 14))
                                        .foregroundColor(.black.opacity(0.85))
                                }
                            }
                            .padding(.leading, 15)
                        }
                        
                        HStack {
                            Spacer()
                            
                            Text("Valor da Corrida: \(motorista.preco)")
                                .font(.custom("Karla-Bold", size: 18))
                                .foregroundColor(Color("card and navbar color"))
                            
                            Spacer()
                        }
                        .padding(.top, 2)
                    }
                    .padding(16)
                    .background(Color("Cor Label"))
                    .cornerRadius(18)
                    .padding(.horizontal, 14)
                    
                    NavigationLink(destination: ResumoConfirmacaoView(motorista: motorista)){
                        Text("Pedir Corrida")
                            .font(.custom("Karla-Bold", size: 18))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color("btn color"))
                            .cornerRadius(12)
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 14)
                    .padding(.bottom, 80)
                }
                .frame(maxWidth: .infinity)
                .background(Color("card and navbar color"))
                .cornerRadius(25)
                .padding(.top, 345)
                .ignoresSafeArea(edges: .vertical)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
} //

#Preview {
    NavigationStack {
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
}
