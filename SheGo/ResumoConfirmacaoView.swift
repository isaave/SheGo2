import SwiftUI
import MapKit

struct ResumoConfirmacaoView: View {
    
    let motorista: Motorista
    @State private var formaPagamento: String = "Pix"
    
    @Environment(\.dismiss) var dismiss
    
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
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                            .padding(12)
                            .background(Color(red: 0.90, green: 0.80, blue: 0.69)) // 👈 cor bege
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.top, 50)
                
                Spacer()
            }
            
            VStack {
                Spacer()
                
                VStack(spacing: 14) {
                    
                    Capsule()
                        .fill(Color("txt color"))
                        .frame(width: 90, height: 4)
                        .padding(.top, 8)
                    
                    Text("Pagamento da corrida")
                        .font(.custom("Karla-Bold", size: 22))
                        .foregroundColor(Color("txt color"))
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(motorista.preco)
                                .font(.custom("Karla-Bold", size: 28))
                                .foregroundColor(Color("card and navbar color"))
                            
                            Text("1,4 Km")
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
                            .padding(.leading, 19)
                        }
                        
                        VStack(spacing: 10) {
                            pagamentoRow(
                                titulo: "Pix",
                                icone: "diamond",
                                selecionado: formaPagamento == "Pix"
                            ) {
                                formaPagamento = "Pix"
                            }
                            
                            pagamentoRow(
                                titulo: "Cartão",
                                icone: "creditcard",
                                selecionado: formaPagamento == "Cartão"
                            ) {
                                formaPagamento = "Cartão"
                            }
                        }
                    }
                    .padding(16)
                    .background(Color("Cor Label"))
                    .cornerRadius(18)
                    .padding(.horizontal, 14)
                    
                    NavigationLink(destination: TelaCorridaView(motorista: motorista)) {
                        Text("Confirmar pagamento")
                            .font(.custom("Karla-Bold", size: 18))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
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
                .ignoresSafeArea(edges: .bottom)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func pagamentoRow(
        titulo: String,
        icone: String,
        selecionado: Bool,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            HStack {
                Image(systemName: icone)
                    .font(.system(size: 20))
                    .foregroundColor(Color("card and navbar color"))
                    .frame(width: 24)
                
                Text(titulo)
                    .font(.custom("Karla-Bold", size: 16))
                    .foregroundColor(Color("card and navbar color"))
                
                Spacer()
                
                ZStack {
                    Circle()
                        .stroke(Color("card and navbar color"), lineWidth: 2)
                        .frame(width: 22, height: 22)
                    
                    if selecionado {
                        Circle()
                            .fill(Color("card and navbar color"))
                            .frame(width: 10, height: 10)
                    }
                }
            }
            .padding(.horizontal, 14)
            .frame(height: 48)
            .background(Color.white.opacity(0.55))
            .cornerRadius(10)
        }
        .buttonStyle(.plain)
    }
}

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
