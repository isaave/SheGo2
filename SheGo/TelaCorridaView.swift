import SwiftUI

struct TelaCorridaView: View {
    
    var body: some View {
        
        ZStack {
            
    
            Image("corrida")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
         
                VStack(spacing: 16) {
                    
                    HStack {
                        HStack(spacing: 10) {
                            Image("helena maria")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 55, height: 55)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Helena Maria")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                HStack(spacing: 2) {
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
                            .font(.title2)
                    }
                    
                   
                    HStack(alignment: .center) {
                        
                        Image("carro")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Modelo: Hyundai HB20")
                            Text("Cor: Prata")
                            Text("Placa: BRA2E19")
                        }
                        .foregroundColor(.white)
                        .font(.caption)
                        
                        Spacer()
                        
                        VStack {
                            Text("PIN:")
                                .foregroundColor(.white)
                                .font(.caption)
                            
                            Text("7684")
                                .foregroundColor(.white)
                                .font(.title2)
                                .bold()
                        }
                    }
                    
                   
                    Text("Sua corrida foi iniciada!")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding()
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
                .cornerRadius(25, corners: [.bottomLeft, .bottomRight]) 
                .ignoresSafeArea(edges: .top)
                
                Spacer()
                
               
                VStack(spacing: 15) {
                    
                    Text("Helena chega em 5 minutos")
                        .font(.headline)
                        .foregroundColor(Color(red: 160/255, green: 0, blue: 73/255))
                    
                    HStack {
                        
                    
                        Image(systemName: "square.and.arrow.up")
                            .font(.title2)
                            .foregroundColor(Color(red: 160/255, green: 0, blue: 73/255))
                        
                        Spacer()
                   
                        Button {
                            
                        } label: {
                            Text("Cancelar corrida")
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color(red: 245/255, green: 98/255, blue: 123/255))
                                .cornerRadius(12)
                        }
                        
                        Spacer()
                        
                      
                        Text("SOS")
                            .font(.caption)
                            .padding(10)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(8)
                    }
                }
                .padding()
                .background(Color(red: 234/255, green: 208/255, blue: 184/255))
                .cornerRadius(25)
                .padding()
            }
        }
        .navigationBarHidden(true)
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
    TelaCorridaView()
}
