import SwiftUI
import MapKit

struct HomepageView: View {
    
    @State private var origem = ""
    @State private var destino = ""
    
    @State private var irParaBusca = false // 👈 NOVO
    
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -23.5505, longitude: -46.6333),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                Color("background color")
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    ScrollView {
                        VStack(spacing: 15) {
                            
                            Image("logo sem nada")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120)
                                .padding(.top, 20)
                            
                            Text("Para onde você quer ir?")
                                .font(.headline)
                                .foregroundColor(Color("card and navbar color"))
                            
                            VStack(spacing: 10) {
                                campo("Seu local", $origem)
                                campo("Destino", $destino)
                            }
                            
                            HStack {
                                Image(systemName: "location")
                                Text("Usar minha localização atual")
                            }
                            .foregroundColor(Color("card and navbar color"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Viagens anteriores")
                                    .font(.headline)
                                
                                historico("Estação Jurubatuba")
                                historico("Shopping Sp Market")
                                historico("Mc Donald's Nações Unidas")
                            }
                            
                            Map(position: $cameraPosition)
                                .frame(height: 200)
                                .cornerRadius(15)
                            
                            // 🔥 BOTÃO AGORA NAVEGA
                            Button("Buscar motorista") {
                                irParaBusca = true
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("btn color"))
                            .foregroundColor(Color("txt color"))
                            .cornerRadius(12)
                        }
                        .padding()
                    }
                    
                    // NAVBAR
                    HStack {
                        navItem("car.fill", "Home")
                        navItem("clock.fill", "Histórico")
                        navItem("wallet.pass.fill", "Carteira")
                        navItem("person.fill", "Perfil")
                    }
                    .padding(.vertical, 6)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color("card and navbar color"))
                    .shadow(radius: 5)
                }
            }
            
          
            .navigationDestination(isPresented: $irParaBusca) {
                BuscandoMotoristaView()
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
    
    func campo(_ placeholder: String, _ binding: Binding<String>) -> some View {
        TextField(placeholder, text: binding)
            .padding()
            .background(Color.white.opacity(0.9))
            .cornerRadius(10)
    }
    
    func historico(_ texto: String) -> some View {
        HStack {
            Image(systemName: "clock")
            Text(texto)
        }
        .padding(8)
        .background(Color.white.opacity(0.6))
        .cornerRadius(8)
    }
    
    func navItem(_ icon: String, _ texto: String) -> some View {
        VStack(spacing: 2) {
            Image(systemName: icon)
                .font(.system(size: 16))
            Text(texto)
                .font(.system(size: 10))
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding(.top, 2)
    }
}

#Preview {
    HomepageView()
}
