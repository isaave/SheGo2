import SwiftUI

struct Mensagem: Identifiable {
    let id = UUID()
    let texto: String
    let isMotorista: Bool
}

struct ChatMotoristaView: View {
    
    @State private var mensagem = ""
    @State private var mensagens: [Mensagem] = [
        Mensagem(texto: "Estou chegando em 5 min 😊", isMotorista: true)
    ]
    
    @State private var status = "Online"
    
    var body: some View {
        ZStack {
            

            LinearGradient(
                colors: [
                    Color(#colorLiteral(red: 0.88, green: 0.67, blue: 0.60, alpha: 1)),
                    Color(#colorLiteral(red: 0.91, green: 0.86, blue: 0.72, alpha: 1))
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                
                
                VStack(spacing: 6) {
                    Image("helena maria")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 85, height: 85)
                        .clipShape(Circle())
                    
                    Text("Helena Maria")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text(status)
                        .font(.caption)
                        .foregroundColor(.green)
                }
                .padding(.top, 30)
                
               
                ScrollViewReader { proxy in
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(mensagens) { msg in
                                mensagemBolha(msg)
                            }
                        }
                        .padding()
                    }
                    .onChange(of: mensagens.count) {
                        if let last = mensagens.last {
                            proxy.scrollTo(last.id, anchor: .bottom)
                        }
                    }
                }
                
                Spacer()
                
            
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        botaoRapido("Quando chega?")
                        botaoRapido("Estou indo até você!")
                        botaoRapido("Onde você está?")
                       
                    }
                    .padding(.horizontal)
                }
                
                HStack {
                    TextField("Envie uma mensagem...", text: $mensagem)
                        .padding()
                        .onTapGesture {
                            status = "Digitando..."
                        }
                    
                    Button {
                        enviarMensagem()
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(#colorLiteral(red: 0.65, green: 0.0, blue: 0.25, alpha: 1)))
                            .clipShape(Circle())
                    }
                }
                .background(.white)
                .cornerRadius(20)
                .shadow(radius: 5)
                .padding()
            }
        }
    }
    
  
    func enviarMensagem() {
        guard !mensagem.isEmpty else { return }
        
        mensagens.append(Mensagem(texto: mensagem, isMotorista: false))
        mensagem = ""
        
        status = "Online"
 
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            status = "Digitando..."
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                mensagens.append(Mensagem(texto: "Já estou perto 👍", isMotorista: true))
                status = "Online"
            }
        }
    }
    

    func mensagemBolha(_ msg: Mensagem) -> some View {
        HStack {
            if msg.isMotorista {
                Text(msg.texto)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .id(msg.id)
                
                Spacer()
            } else {
                Spacer()
                
                Text(msg.texto)
                    .padding()
                    .background(Color(#colorLiteral(red: 0.94, green: 0.36, blue: 0.45, alpha: 1)))
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .id(msg.id)
            }
        }
    }
    
    func botaoRapido(_ texto: String) -> some View {
        Button {
            mensagem = texto
        } label: {
            Text(texto)
                .font(.caption)
                .foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color(#colorLiteral(red: 0.94, green: 0.36, blue: 0.45, alpha: 1)))
                .cornerRadius(12)
        }
    }
}
#Preview {
    ChatMotoristaView()
       }
