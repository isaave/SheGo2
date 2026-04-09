import SwiftUI

struct CadastroView: View {
    
    @State private var nome = ""
    @State private var telefone = ""
    @State private var email = ""
    @State private var senha = ""
    @State private var confirmarSenha = ""
    
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
                    campoSenha("Senha", "Digite sua senha", $senha)
                    campoSenha("Confirme sua senha", "Confirme sua senha", $confirmarSenha)
                    
                    NavigationLink(destination: HomepageView()) {
                        Text("Cadastrar")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
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
                .font(.caption)
            
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
            .foregroundColor(.white)
        }
    }
    
    // 🔥 CAMPO SENHA
    func campoSenha(_ titulo: String, _ placeholder: String, _ binding: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Text(titulo)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
                .font(.caption)
            
            SecureField(
                "",
                text: binding,
                prompt: Text(placeholder)
                    .foregroundColor(Color("Cor placeholder"))
            )
            .padding()
            .background(Color("Cor Label"))
            .cornerRadius(10)
            .font(.system(size: 16))
            .foregroundColor(.white)
        }
    }
}

#Preview {
    NavigationStack {
        CadastroView()
    }
}
