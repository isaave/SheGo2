import SwiftUI

struct LoginView: View {
    
    let corVinho = Color(red: 160/255, green: 0/255, blue: 73/255)
    let corRosa = Color(red: 245/255, green: 98/255, blue: 123/255)
    let corFundo = Color(red: 255/255, green: 235/255, blue: 215/255)
    
    @State private var usuario = ""
    @State private var senha = ""
    
    var body: some View {
        ZStack {
            
       
            corFundo
                .ignoresSafeArea()
            
            VStack {
                
                // 🔝 LOGO
                Image("Image 1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180)
                    .padding(.top, 100)
                
                Spacer()
            }
            
            // 🔻 CARD DE LOGIN
            VStack {
                Spacer()
                
                VStack(spacing: 25) {
                    
                    Text("Login")
                        .font(.system(size: 32, weight: .bold))          .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .background(corVinho)
                    .cornerRadius(30)
                }
                .ignoresSafeArea(edges: .bottom)
            
                    // USUÁRIO
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Usuário")
                            .foregroundColor(.white)
                            .font(.custom("Karla-Medium", size: 14))
                        
                        TextField("Digite seu email ou telefone", text: $usuario)
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                    }
                    
                    // SENHA
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Senha")
                            .foregroundColor(.white)
                            .font(.custom("Karla-Medium", size: 14))
                        
                        SecureField("Digite sua senha", text: $senha)
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                    }
                    
                    // BOTÃO
                    Button(action: {
                        print("Login clicado")
                    }) {
                        Text("Entrar")
                            .font(.custom("Karla-Bold", size: 18))
                            .foregroundColor(.white)
                            .frame(width: 160, height: 45)
                            .background(Color(red: 245/255, green: 120/255, blue: 130/255))
                            .cornerRadius(12)
                    }
                    .padding(.top, 10)
                    
                    // CADASTRO
                    VStack(spacing: 4) {
                        Text("Não tem conta?")
                            .foregroundColor(.white)
                            .font(.custom("Karla-Regular", size: 14))
                        
                        Text("Cadastre-se")
                            .foregroundColor(.white)
                            .font(.custom("Karla-Bold", size: 14))
                    }
                    .padding(.top, 8)
                }
                .padding(24)
                .frame(maxWidth: .infinity)
                .background(corVinho)
                .cornerRadius(30)
            }
        }
    }
}

#Preview {
    LoginView()
}


arrume
