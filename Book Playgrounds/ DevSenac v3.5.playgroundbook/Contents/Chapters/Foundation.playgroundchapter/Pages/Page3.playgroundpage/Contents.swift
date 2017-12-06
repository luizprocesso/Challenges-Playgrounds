
// Classe contato
class Contato {
    var nome: String = ""
    var sobrenome: String = ""
    
    // Metodo que devolve a primeira letra do atributo nome.
    func firstLetter() -> String {
        return String(self.nome[nome.startIndex])
    }
    
    // Construtor da classe Contato. Só consigo criar um novo contato se eu passar os parâmetros nome e sobrenome.
    init(nome: String, sobrenome: String){
        self.nome = nome
        self.sobrenome = sobrenome
    }
}

// Criacao de um contato
let novoContato = Contato(nome: "Agnaldo", sobrenome: "Timoteo")

// Criacao de um Array de Contatos.
var arrayContato: Array = [Contato]()

// Adicao do contato criado no Array
arrayContato.append(novoContato)

// Criacao do Dictionary
var dict: Dictionary = [String : [Contato]]()

// Mapear a chave "A" no Dictionary para o array criado.
dict["A"] = arrayContato

// Criar um outro contato como teste
let novoContato2 = Contato(nome: "Andre", sobrenome: "Soares")

// Adicionar o contato criado no Array da chave "A" do Dictionary
dict["A"]!.append(novoContato2)

// Obter o Array mapeado na chave "A" do Dictionary
let myArray = dict["A"]!

// Percorrer o Array e imprimir o nome e sobrenome de cada contato
for c in myArray {
    print("\(c.nome), sobrenome: \(c.sobrenome)")
}






