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
                    
                    VStack(spacing: 20) {
                        
                        Text("Login")
                            .font(.custom("Karla-Bold", size: 32))
                            .foregroundColor(.white)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Usuário")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                            TextField(
                                "",
                                text: $usuario,
                                prompt: Text("Digite seu email ou telefone")
                                    .foregroundColor(Color("Cor placeholder"))
                            )
                            .padding()
                            .background(Color("Cor Label"))
                            .cornerRadius(10)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Senha")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                            
                            SecureField(
                                "",
                                text: $senha,
                                prompt: Text("Digite sua senha")
                                    .foregroundColor(Color("Cor placeholder"))
                            )
                            .padding()
                            .background(Color("Cor Label"))
                            .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: HomepageView()) {
                            Text("Entrar")
                                .font(.system(size: 18, weight: .bold))
                                .frame(width: 167, height: 47)
                                .background(Color("btn color"))
                                .foregroundColor(Color("txt color"))
                                .cornerRadius(12)
                        }
                        .buttonStyle(.plain)
                        
                        VStack(spacing: 4) {
                            Text("Não tem conta?")
                                .foregroundColor(Color("txt color"))
                            
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
                    .background(Color("card and navbar color"))
                    .cornerRadius(30)
                }
                .ignoresSafeArea(edges: .bottom)            }
        }
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
