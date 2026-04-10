import SwiftUI

struct CadastroView: View {
    
    @State private var nome = ""
    @State private var telefone = ""
    @State private var email = ""
    @State private var senha = ""
    @State private var confirmarSenha = ""
    @State private var mostrarSenha = false
    @State private var mostrarConfirmarSenha = false
    
    var body: some View {
        ZStack {
            
            Color("background color")
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Text("Cadastro")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color("card and navbar color"))
                
                VStack(spacing: 15) {
                    
                    campo("Nome", "Digite seu nome completo", $nome)
                    campo("Telefone", "(DDD) 99 9999-9999", $telefone)
                    campo("Email", "Digite seu email", $email)
                    
                    campoSenha("Senha", "Digite sua senha", $senha, $mostrarSenha)
                    campoSenha("Confirme sua senha", "Confirme sua senha", $confirmarSenha, $mostrarConfirmarSenha)
                    
                    NavigationLink(destination: HomepageView()) {
                        Text("Cadastrar")
                            .fontWeight(.bold)
                            .foregroundColor(Color("txt color"))
                            .frame(width: 140, height: 45)
                            .background(Color("btn color"))
                            .cornerRadius(12)
                    }
                    .buttonStyle(.plain)
                    .padding(.top, 10)
                }
                .padding(20)
                .background(Color("card and navbar color"))
                .cornerRadius(25)
                .padding(.horizontal, 30)
                
                Spacer()
            }
        }
    }
    
    func campo(_ titulo: String, _ placeholder: String, _ binding: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Text(titulo)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
            
            TextField(
                "",
                text: binding,
                prompt: Text(placeholder)
                    .foregroundColor(Color("Cor placeholder"))
            )
            .padding()
            .background(Color("Cor Label"))
            .cornerRadius(10)
            .font(.system(size: 16))
            .foregroundColor(Color("Cor placeholder"))
        }
    }
    
    func campoSenha(_ titulo: String, _ placeholder: String, _ binding: Binding<String>, _ mostrar: Binding<Bool>) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Text(titulo)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
            
            HStack {
                
                if mostrar.wrappedValue {
                    TextField(
                        "",
                        text: binding,
                        prompt: Text(placeholder)
                            .foregroundColor(Color("Cor placeholder"))
                    )
                    .foregroundColor(Color("Cor placeholder"))
                    .font(.system(size: 16))
                } else {
                    SecureField(
                        "",
                        text: binding,
                        prompt: Text(placeholder)
                            .foregroundColor(Color("Cor placeholder"))
                    )
                    .foregroundColor(Color("Cor placeholder"))
                    .font(.system(size: 16))
                }
                
                Button(action: {
                    mostrar.wrappedValue.toggle()
                }) {
                    Image(systemName: mostrar.wrappedValue ? "eye.slash" : "eye")
                        .foregroundColor(Color("Cor placeholder"))
                        .font(.system(size: 18))
                }
            }
            .padding()
            .background(Color("Cor Label"))
            .cornerRadius(10)
        }
    }
}

#Preview {
    NavigationStack {
        CadastroView()
    }
}
