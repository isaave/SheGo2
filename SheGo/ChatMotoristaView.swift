import SwiftUI

struct ChatMotoristaView: View {

    let motorista: Motorista

    @State private var mensagem: String = ""
    @State private var mensagens: [MensagemChat] = [
        MensagemChat(texto: "Olá, já estou a caminho!", isMotorista: false),
        MensagemChat(texto: "Ok, estou te aguardando.", isMotorista: true)
    ]

    var body: some View {
        VStack(spacing: 0) {

            HStack {
                Image(motorista.foto)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 70)
                    .clipShape(Circle())

                VStack(alignment: .leading) {
                    Text(motorista.nome)
                        .font(.headline)
                    Text("Online")
                        .font(.caption)
                        .foregroundColor(.green)
                }

                Spacer()
            }
            .padding()
            .background(Color("card and navbar"))
            .foregroundColor(.white)

            Divider()

            ScrollView {
                VStack(spacing: 10) {
                    ForEach(mensagens) { msg in
                        HStack {
                            if !msg.isMotorista { Spacer() }

                            Text(msg.texto)
                                .padding(10)
                                .background(!msg.isMotorista ? Color("btn color") : Color.gray.opacity(0.3))
                                .foregroundColor(!msg.isMotorista ? .white : .black)
                                .cornerRadius(15)
                                .frame(maxWidth: 250, alignment: !msg.isMotorista ? .trailing : .leading)

                            if msg.isMotorista { Spacer() }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 10)
            }

            Divider()

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(["Estou chegando", "Estou te esperando", "Quanto tempo falta?", "Pode parar aqui"], id: \.self) { sugestao in
                        Button(action: {
                            mensagem = sugestao
                            enviarMensagem()
                        }) {
                            Text(sugestao)
                                .font(.caption)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 12)
                                .background(Color("btn color").opacity(0.15))
                                .foregroundColor(Color("card and navbar"))
                                .cornerRadius(16)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 6)
            }

            HStack {
                TextField("Digite uma mensagem...", text: $mensagem)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)

                Button(action: enviarMensagem) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(Color("card and navbar"))
                        .padding(.horizontal, 6)
                }
            }
            .padding()
        }
    }

    func enviarMensagem() {
        guard !mensagem.isEmpty else { return }
        mensagens.append(MensagemChat(texto: mensagem, isMotorista: false))
        mensagem = ""
    }
}

struct MensagemChat: Identifiable {
    let id = UUID()
    let texto: String
    let isMotorista: Bool
}

#Preview {
    ChatMotoristaView(
        motorista: Motorista(
            nome: "Helena Maria",
            preco: "R$20,00",
            avaliacao: 5,
            foto: "helena maria",
            modelo: "Hyundai HB20",
            cor: "Prata",
            placa: "BRA2E19",
            descricao: "Motorista parceira há quase 4 anos e especialista em rotas urbanas."
        )
    )
}
