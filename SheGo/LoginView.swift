import SwiftUI

struct LoginView: View {
    
    @State private var usuario = ""
    @State private var senha = ""
    
    var body: some View {
        GeometryReader { geo in
            
            ZStack {
                
                Color("background color")
                    .ignoresSafeArea()
                
                VStack {
                    Image("logo sem nada")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .padding(.top, 50)
                    
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    
                    // 🔻 CARD
                    VStack(spacing: 20) {
                        
                        Text("Login")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                        
                        VStack(alignment: .leading) {
                            Text("Usuário")
                                .foregroundColor(.white)
                            
                            TextField("Digite seu email ou telefone", text: $usuario)
                                .padding()
                                .background(Color.white.opacity(0.95))
                                .cornerRadius(10)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Senha")
                                .foregroundColor(.white)
                            
                            SecureField("Digite sua senha", text: $senha)
                                .padding()
                                .background(Color.white.opacity(0.95))
                                .cornerRadius(10)
                        }
                        
                        Button("Entrar") {
                            print("Login clicado")
                        }
                        .frame(width: 167, height: 47)
                        .background(Color("btn color"))
                        .foregroundColor(Color("txt color"))
                        .cornerRadius(12)
                        
                        // 🔗 LINK CADASTRO
                        VStack {
                            Text("Não tem conta?")
                                .foregroundColor(.white)
                            
                            NavigationLink(destination: CadastroView()) {
                                Text("Cadastre-se")
                                    .foregroundColor(.white)
                                    .bold()
                                    .underline()
                            }
                        }
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height * 0.6)
                    .background(Color("card and navbar color"))
                    .cornerRadius(30)
                }
                .ignoresSafeArea(edges: .bottom)
            }
        }
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
