//
//  main.swift
//  atividade acompanhamento nivelamento
//
//  Created by Alan Fagner Goncalves on 11/04/26.
//

import Foundation

struct Contact {
	let id: Int
	var name: String
	var age: Int
	var phone: String
	var email: String
}

var contacts: [Contact] = []
var nextId = 1

func readTrimmedInput(prompt: String) -> String? {
	print(prompt, terminator: "")
	guard let input = readLine() else {
		return nil
	}

	return input.trimmingCharacters(in: .whitespacesAndNewlines)
}

func readRequiredField(fieldName: String) -> String? {
	guard let value = readTrimmedInput(prompt: "Digite \(fieldName): ") else {
		return nil
	}

	if value.isEmpty {
		print("Erro: o campo \(fieldName) deve estar preenchido.")
		return nil
	}

	return value
}

func readRequiredAge() -> Int? {
	guard let ageInput = readRequiredField(fieldName: "a idade") else {
		return nil
	}

	guard let age = Int(ageInput), age > 0 else {
		print("Erro: idade inválida. Informe um número inteiro maior que zero.")
		return nil
	}

	return age
}

func isValidEmail(_ email: String) -> Bool {
	let pattern = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
	return email.range(of: pattern, options: .regularExpression) != nil
}

func isValidPhone(_ phone: String) -> Bool {
	let allowedCharacters = CharacterSet(charactersIn: "+-() ").union(.decimalDigits)
	let hasOnlyAllowedCharacters = phone.unicodeScalars.allSatisfy { scalar in
		allowedCharacters.contains(scalar)
	}

	guard hasOnlyAllowedCharacters else {
		return false
	}

	let digitsOnly = phone.filter { $0.isNumber }
	return digitsOnly.count >= 10 && digitsOnly.count <= 13
}

func formatPhoneWithMask(_ phone: String) -> String {
	let digits = phone.filter { $0.isNumber }

	switch digits.count {
	case 10:
		let ddd = digits.prefix(2)
		let firstPart = digits.dropFirst(2).prefix(4)
		let secondPart = digits.suffix(4)
		return "(\(ddd)) \(firstPart)-\(secondPart)"
	case 11:
		let ddd = digits.prefix(2)
		let firstPart = digits.dropFirst(2).prefix(5)
		let secondPart = digits.suffix(4)
		return "(\(ddd)) \(firstPart)-\(secondPart)"
	case 12:
		let countryCode = digits.prefix(2)
		let ddd = digits.dropFirst(2).prefix(2)
		let firstPart = digits.dropFirst(4).prefix(4)
		let secondPart = digits.suffix(4)
		return "+\(countryCode) (\(ddd)) \(firstPart)-\(secondPart)"
	case 13:
		let countryCode = digits.prefix(2)
		let ddd = digits.dropFirst(2).prefix(2)
		let firstPart = digits.dropFirst(4).prefix(5)
		let secondPart = digits.suffix(4)
		return "+\(countryCode) (\(ddd)) \(firstPart)-\(secondPart)"
	default:
		return phone
	}
}

func readRequiredPhone(fieldName: String) -> String? {
	guard let phone = readRequiredField(fieldName: fieldName) else {
		return nil
	}

	guard isValidPhone(phone) else {
		print("Erro: telefone inválido. Informe entre 10 e 13 dígitos, com ou sem formatação.")
		return nil
	}

	return formatPhoneWithMask(phone)
}

func readRequiredEmail(fieldName: String) -> String? {
	guard let email = readRequiredField(fieldName: fieldName) else {
		return nil
	}

	guard isValidEmail(email) else {
		print("Erro: e-mail inválido. Informe um e-mail no formato exemplo@dominio.com.")
		return nil
	}

	return email
}

func hasDuplicateName(_ name: String, excludingId: Int? = nil) -> Bool {
	for contact in contacts {
		if let excludingId, contact.id == excludingId {
			continue
		}

		if contact.name == name {
			return true
		}
	}

	return false
}

func printContactNamesWithIds() {
	print("\nContatos cadastrados:")
	for contact in contacts {
		print("[\(contact.id)] \(contact.name)")
	}
}

func findContactIndex(byId id: Int) -> Int? {
	contacts.firstIndex { $0.id == id }
}

func showMenu() {
	print("\n=== Sistema de Contatos ===")
	print("1 - Cadastro")
	print("2 - Listagem")
	print("3 - Alteração")
	print("4 - Remoção")
	print("5 - Finalizar")
}

func createContact() {
	print("\n--- Cadastro de Contato ---")

	guard let name = readRequiredField(fieldName: "o nome") else {
		return
	}

	if hasDuplicateName(name) {
		print("Erro: já existe um contato com esse nome.")
		return
	}

	guard let age = readRequiredAge() else {
		return
	}

	guard let phone = readRequiredPhone(fieldName: "o telefone") else {
		return
	}

	guard let email = readRequiredEmail(fieldName: "o e-mail") else {
		return
	}

	let newContact = Contact(id: nextId, name: name, age: age, phone: phone, email: email)
	contacts.append(newContact)
	nextId += 1

	print("Contato cadastrado com sucesso.")
}

func listContacts() {
	print("\n--- Listagem de Contatos ---")

	guard !contacts.isEmpty else {
		print("Nenhum contato cadastrado.")
		return
	}

	for contact in contacts {
		print("[\(contact.id)] Nome: \(contact.name) | Idade: \(contact.age) | Telefone: \(contact.phone) | E-mail: \(contact.email)")
	}
}

func updateContact() {
	print("\n--- Alteração de Contato ---")

	guard !contacts.isEmpty else {
		print("Nenhum contato cadastrado para alterar.")
		return
	}

	printContactNamesWithIds()

	guard let idInput = readRequiredField(fieldName: "o identificador do contato para alterar"),
		  let id = Int(idInput),
		  let index = findContactIndex(byId: id) else {
		print("Erro: identificador inválido. A informação não é condizente com os identificadores listados.")
		return
	}

	guard let name = readRequiredField(fieldName: "o novo nome") else {
		return
	}

	if hasDuplicateName(name, excludingId: id) {
		print("Erro: já existe um contato com esse nome.")
		return
	}

	guard let age = readRequiredAge() else {
		return
	}

	guard let phone = readRequiredPhone(fieldName: "o novo telefone") else {
		return
	}

	guard let email = readRequiredEmail(fieldName: "o novo e-mail") else {
		return
	}

	contacts[index].name = name
	contacts[index].age = age
	contacts[index].phone = phone
	contacts[index].email = email

	print("Contato alterado com sucesso.")
}

func removeContact() {
	print("\n--- Remoção de Contato ---")

	guard !contacts.isEmpty else {
		print("Nenhum contato cadastrado para remover.")
		return
	}

	printContactNamesWithIds()

	guard let idInput = readRequiredField(fieldName: "o identificador do contato para remover"),
		  let id = Int(idInput),
		  let index = findContactIndex(byId: id) else {
		print("Erro: identificador inválido. A informação não é condizente com os identificadores listados.")
		return
	}

	contacts.remove(at: index)
	print("Contato removido com sucesso.")
}

while true {
	showMenu()

	guard let option = readTrimmedInput(prompt: "Escolha uma opção: ") else {
		print("Erro ao ler a opção. Tente novamente.")
		continue
	}

	switch option {
	case "1":
		createContact()
	case "2":
		listContacts()
	case "3":
		updateContact()
	case "4":
		removeContact()
	case "5":
		print("Sistema finalizado.")
		exit(0)
	default:
		print("Opção inválida. Escolha uma opção de 1 a 5.")
	}
}

