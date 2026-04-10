import SwiftUI
import MapKit

struct HomepageView: View {
    
    @State private var origem = ""
    @State private var destino = ""
    @State private var usarLocalizacao = false
    
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -23.6336, longitude: -46.6992),
            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        )
    )
    
    var body: some View {
        ZStack {
            
            Color("background color")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        
                        Image("logo sem nada")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120)
                            .padding(.top, 28)
                        
                        Text("Para onde você quer ir?")
                            .font(.custom("Karla-Bold", size: 18))
                            .foregroundColor(Color("card and navbar color"))
                        
                        VStack(spacing: 12) {
                            campoComIcones("Seu local", $origem, true)
                            campoComIcones("Destino", $destino, false)
                        }
                        
                     
                        Button {
                            usarLocalizacao.toggle()
                        } label: {
                            HStack(spacing: 8) {
                                Image(systemName: usarLocalizacao ? "checkmark.square.fill" : "square")
                                    .font(.system(size: 18))
                                
                                Text("Usar minha localização atual")
                                    .font(.custom("Karla-Regular", size: 16))
                            }
                        }
                        .foregroundColor(Color("card and navbar color"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .buttonStyle(.plain)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Viagens anteriores")
                                .font(.custom("Karla-Bold", size: 16))
                                .foregroundColor(Color("card and navbar color"))
                            
                            historico("Estação Jurubatuba")
                            historico("Shopping Sp Market")
                            historico("Mc Donald's Nações Unidas")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Map(position: $cameraPosition)
                            .frame(height: 245)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                        
                        Button {
                            print("Buscar motorista")
                        } label: {
                            Text("Buscar motorista")
                                .font(.custom("Karla-Bold", size: 18))
                                .foregroundColor(Color("txt color"))
                                .frame(width: 210, height: 50)
                                .background(Color("btn color"))
                                .cornerRadius(14)
                        }
                        .padding(.top, 4)
                        .padding(.bottom, 20)
                    }
                    .padding(.horizontal, 28)
                }
                
            
                HStack {
                    navItem("car.fill", "Home")
                    navItem("clock.arrow.circlepath", "Histórico")
                    navItem("wallet.pass.fill", "Carteira")
                    navItem("person", "Perfil")
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 12)
                .background(Color("card and navbar color"))
                .cornerRadius(22) // 👈 4 bordas arredondadas
                .padding(.horizontal, 18)
                .padding(.bottom, 6)
                .shadow(color: .black.opacity(0.2), radius: 8, y: 4)
            }
        }
    }
    
    func campoComIcones(_ placeholder: String, _ text: Binding<String>, _ topo: Bool) -> some View {
        HStack(spacing: 12) {
            VStack(spacing: 0) {
                Circle()
                    .fill(Color("card and navbar color"))
                    .frame(width: 6, height: 6)
                
                Rectangle()
                    .fill(Color("card and navbar color"))
                    .frame(width: 1.5, height: 26)
                
                if !topo {
                    Circle()
                        .fill(Color("card and navbar color"))
                        .frame(width: 6, height: 6)
                }
            }
            
            TextField(
                "",
                text: text,
                prompt: Text(placeholder)
                    .foregroundColor(Color("card and navbar color"))
            )
            .font(.custom("Karla-Regular", size: 17))
            .foregroundColor(Color("card and navbar color"))
        }
        .padding(.horizontal, 14)
        .frame(height: 56)
        .background(Color("Cor Label"))
        .cornerRadius(12)
    }
    
    func historico(_ texto: String) -> some View {
        HStack(spacing: 10) {
            Image(systemName: "clock")
                .font(.system(size: 13))
            
            Text(texto)
                .font(.custom("Karla-Regular", size: 16))
        }
        .foregroundColor(Color("card and navbar color"))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 10)
        .frame(height: 28)
        .background(Color("Cor Label").opacity(0.9))
        .cornerRadius(6)
    }
    
    func navItem(_ icon: String, _ texto: String) -> some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 24))
            
            Text(texto)
                .font(.custom("Karla-Regular", size: 12))
        }
        .foregroundColor(Color("txt color"))
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    HomepageView()
}
