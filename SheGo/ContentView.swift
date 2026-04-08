import SwiftUI

struct ContentView: View {
    let corVinho = Color(red: 160/255, green: 0/255, blue: 73/255)
    let corTextoBotao = Color(red: 255/255, green: 241/255, blue: 207/255)
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(
                            color: Color(red: 255/255, green: 200/255, blue: 200/255).opacity(0.5),
                            location: 0.0
                        ),
                        .init(
                            color: Color(red: 255/255, green: 170/255, blue: 180/255),
                            location: 1.0
                        )
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    VStack(spacing: 12) {
                        
                        Image("Image 1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250)
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Entrar")
                                .font(.system(size: 18, weight: .bold))  .foregroundColor(corTextoBotao)
                                .frame(width: 160, height: 45)
                                .background(Color.corCardEBtn)
                                .cornerRadius(12)
                        }
                        .padding(.top, 40)
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}
#Preview {
    ContentView()
}
