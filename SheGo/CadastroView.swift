import SwiftUI

 struct CadastroView: View {
    let corBotao = Color(red: 245/255, green: 98/255, blue: 123/255)
    let corTitulo = Color(red: 160/255, green: 0/255, blue: 73/255)
    let corFundo = Color(red: 254/255, green: 222/255, blue: 196/255)

    @State private var nome = ""
    @State private var telefone = ""
    @State private var email = ""
    @State private var senha = ""
    @State private var confirmarSenha = ""

    var body: some View {
        NavigationStack {
            ZStack {
                corFundo
                    .ignoresSafeArea()
                VStack(spacing: 15) {
                    Text("Cadastro")

                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(corTitulo)


                    VStack(alignment: .leading, spacing: 5) {
                        Text("NOME:")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        TextField("Digite seu nome", text: $nome)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                
                    VStack(alignment: .leading, spacing: 5) {
                        Text("TELEFONE:")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        TextField("Digite seu telefone", text: $telefone)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                    }

    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("EMAIL:")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        TextField("Digite seu email", text: $email)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Text("SENHA:")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        SecureField("Digite sua senha", text: $senha)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Text("CONFIRMAR SENHA:")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        SecureField("Digite novamente a senha", text: $confirmarSenha)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)

                    }

                    NavigationLink(destination: EscolhaUsuarioView()) {
                        Text("Cadastrar")
                            .foregroundColor(.white)
                            .frame(width: 118, height: 40)
                            .background(corBotao)
                            .cornerRadius(10)
                    }
                    .padding(.top, 10)
                }
                .padding()
                .background(corTitulo)
                .cornerRadius(20)
                .frame(width: 320)
            }
        }
    }
 }
