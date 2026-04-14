import SwiftUI
import MapKit

struct ResumoConfirmacaoView: View {
    
    @State private var selectedPagamento: String = "Pix"
    
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -23.631, longitude: -46.713),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )
    
    var body: some View {
        ZStack {
            
            Map(position: $cameraPosition)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 16) {
                    
                    Text("Pagamento da corrida")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                    
                   
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text("R$20,00")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "#A00049"))
                        
                        Text("1,4 Km")
                            .foregroundColor(.gray)
                        
                        Divider()
                        
                        VStack(alignment: .leading) {
                            Text("Seu local:")
                                .fontWeight(.semibold)
                            
                            Text("Senac Santo Amaro...")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Destino:")
                                .fontWeight(.semibold)
                            
                            Text("Roldão Atacadista...")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Divider()
                        
                        pagamentoOption("Pix")
                        pagamentoOption("Cartão")
                        
                        Button {
                            print("Pagamento confirmado")
                        } label: {
                            Text("Confirmar pagamento")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.pink)
                                .cornerRadius(14)
                        }
                        .padding(.top, 10)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(16)
                }
                .padding()
                .background(
                    LinearGradient(
                        colors: [
                            Color(hex: "#A00049"),
                            Color(hex: "#D81B60")
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .cornerRadius(24)
                .padding()
            }
        }
    }
    
    func pagamentoOption(_ titulo: String) -> some View {
        HStack {
            Text(titulo)
                .foregroundColor(Color(hex: "#A00049"))
            
            Spacer()
            
            Circle()
                .stroke(Color(hex: "#A00049"), lineWidth: 2)
                .frame(width: 20, height: 20)
                .overlay(
                    Circle()
                        .fill(selectedPagamento == titulo ? Color(hex: "#A00049") : Color.clear)
                        .frame(width: 10, height: 10)
                )
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .onTapGesture {
            selectedPagamento = titulo
        }
    }
}

#Preview {
    ResumoConfirmacaoView()
}

