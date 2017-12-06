
// Classe contato
class Contato {
    var nome: String = ""
    var sobrenome: String = ""
}

// Dictionary que considera como chave do tipo String e o valor é um objeto da classe Contato.
var dict: Dictionary = [String : Contato]()

// Criacao e preenchimento de um novo contato
let c = Contato()
c.nome = "AV"
c.sobrenome = "ED"

// Atribuir o contato para a chave "ABC" do Dictionary
dict["ABC"] = c

// Obter o contato do Dictionary e imprimir na tela.
let c1 = dict["ABC"]
print("\(c1!.nome) - \(c1!.sobrenome)")


