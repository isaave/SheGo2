import SwiftUI

struct CadastroView: View {
    
    let corFundo = Color(red: 0.93, green: 0.80, blue: 0.70)
    let corCard = Color(red: 0.70, green: 0.0, blue: 0.30)
    let corBotao = Color(red: 1.0, green: 0.4, blue: 0.5)
    
    @State private var nome = ""
    @State private var telefone = ""
    @State private var email = ""
    @State private var senha = ""
    @State private var confirmarSenha = ""
    
    var body: some View {
        ZStack {
            
            corFundo
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Text("Cadastro")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(corCard)
                
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
                            .background(corBotao)
                            .cornerRadius(12)
                    }
                    .buttonStyle(.plain)
                    .padding(.top, 10)
                }
                .padding(20)
                .background(corCard)
                .cornerRadius(25)
                .padding(.horizontal, 30)
                
                Spacer()
            }
        }
    }
    
    func campo(_ titulo: String, _ placeholder: String, _ binding: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(titulo)
                .foregroundColor(.white)
                .font(.caption)
            
            TextField(placeholder, text: binding)
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(10)
        }
    }
    
    func campoSenha(_ titulo: String, _ placeholder: String, _ binding: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(titulo)
                .foregroundColor(.white)
                .font(.caption)
            
            SecureField(placeholder, text: binding)
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(10)
        }
    }
}
#Preview {
    CadastroView()
}
