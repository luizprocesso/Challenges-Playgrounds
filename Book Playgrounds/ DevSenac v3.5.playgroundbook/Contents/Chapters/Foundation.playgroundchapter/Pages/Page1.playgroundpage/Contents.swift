
// Criacao do Dictionary, onde a chave é do tipo Int e o valor é do tipo String
var dict: Dictionary = [Int : String]()

// Atribuindo valores para chaves inteiras
dict[123] = "Fred"
dict[12345678909] = "Remar"
dict[45678965433] = "Nadar"

print(dict[123]!)

// Laço de repetição que percorre cada par chave e valor do Dictionary
for (key, value) in dict {
    print("A chave eh \(key) e o valor eh \(value)")
}

// Laço de repetição que percorre somente as chaves
for key in dict.keys {
    print("A chave eh \(key) e o valor eh \(dict[key]!)")
}

// Laço de repetição que percorre somente os valores
for value in dict.values {
    print("O valor eh \(value)")
}

// Também é possível gerar um Array somente com as chaves do Dictionary.

// Maneira 1
let keyArray1: Array = [Int](dict.keys)

// Maneira 2
let keyArray2 = Array(dict.keys)

print(keyArray2)


