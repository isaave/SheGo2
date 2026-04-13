 import SwiftUI
import MapKit

struct TelaCorridaView: View {
    
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -23.631, longitude: -46.713),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                
          
                Map(position: $cameraPosition)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
               
                    VStack(spacing: 10) {
                        
                        HStack {
                            
                            HStack {
                                Image("helena maria")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 55, height: 55)
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Helena Maria")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    
                                    HStack(spacing: 3) {
                                        ForEach(0..<5) { _ in
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                                .font(.caption2)
                                        }
                                    }
                                }
                            }
                            
                            Spacer()
                            
                            Image(systemName: "message")
                                .foregroundColor(.white)
                                .font(.title3)
                        }
                        
                        HStack {
                            
                            Image("carro")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110)
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text("Modelo: Hyundai HB20")
                                Text("Cor: Prata")
                                Text("Placa: BRA2E19")
                            }
                            .foregroundColor(.white)
                            .font(.caption)
                            
                            Spacer()
                            
                            VStack(alignment: .trailing, spacing: 2) {
                                Text("PIN:")
                                    .foregroundColor(.white)
                                    .font(.caption)
                                
                                Text("7684")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .bold()
                            }
                        }
                        
                        Text("Sua corrida foi iniciada!")
                            .foregroundColor(.white)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .padding(.top, 2)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            colors: [
                                Color(red: 160/255, green: 0, blue: 73/255),
                                Color(red: 216/255, green: 27/255, blue: 96/255)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(2)
                    .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                    .padding(.horizontal, 0)
                    .padding(.top, 5)
                    
                    Spacer()
                    VStack(spacing: 16) {
                        
                        Text("Helena Maria chega em 5 minutos")
                            .font(.headline)
                            .foregroundColor(Color(red: 160/255, green: 0, blue: 73/255))
                        
                        HStack {
                            
                            Button {
                                print("Compartilhar")
                            } label: {
                                Image(systemName: "square.and.arrow.up")
                                    .font(.title2)
                                    .foregroundColor(Color(red: 160/255, green: 0, blue: 73/255))
                            }
                            
                            Spacer()
                            
                            Button {
                                print("Cancelar corrida")
                            } label: {
                                Text("Cancelar corrida")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(red: 245/255, green: 98/255, blue: 123/255))
                                    .cornerRadius(12)
                            }
                            
                            Spacer()
                            
                            Button {
                                print("SOS")
                            } label: {
                                Text("SOS")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(red: 160/255, green: 0, blue: 73/255))
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                    .background(Color(red: 234/255, green: 208/255, blue: 184/255))
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .padding()
                }
            }
        }
    }
}
#Preview {
    TelaCorridaView()
}

