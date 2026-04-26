import Foundation

enum QuizThemeProvider {
    static let themes: [QuizTheme] = [
        QuizTheme(
            name: "Historia",
            subtitle: "Civilizacoes, marcos e personagens.",
            questions: [
                QuizQuestion(
                    prompt: "Em que ano o Brasil declarou sua independencia?",
                    options: ["1808", "1822", "1889", "1922"],
                    correctIndex: 1
                ),
                QuizQuestion(
                    prompt: "Qual civilizacao construiu Machu Picchu?",
                    options: ["Asteca", "Egipcia", "Inca", "Romana"],
                    correctIndex: 2
                ),
                QuizQuestion(
                    prompt: "A Revolucao Francesa teve inicio em qual ano?",
                    options: ["1492", "1789", "1824", "1914"],
                    correctIndex: 1
                ),
                QuizQuestion(
                    prompt: "Quem foi o primeiro presidente do Brasil?",
                    options: ["Getulio Vargas", "Juscelino Kubitschek", "Marechal Deodoro da Fonseca", "Dom Pedro II"],
                    correctIndex: 2
                ),
                QuizQuestion(
                    prompt: "Qual lider ficou conhecido pelo discurso I Have a Dream?",
                    options: ["Nelson Mandela", "Mahatma Gandhi", "Martin Luther King Jr.", "Winston Churchill"],
                    correctIndex: 2
                ),
                QuizQuestion(
                    prompt: "Qual evento marcou a queda do bloco sovietico em 1989?",
                    options: ["Queda do Muro de Berlim", "Guerra dos Cem Anos", "Tratado de Tordesilhas", "Renascimento"],
                    correctIndex: 0
                )
            ]
        ),
        QuizTheme(
            name: "Fisica",
            subtitle: "Conceitos, unidades e fenomenos.",
            questions: [
                QuizQuestion(
                    prompt: "Qual e a unidade de medida da forca no SI?",
                    options: ["Watt", "Pascal", "Newton", "Joule"],
                    correctIndex: 2
                ),
                QuizQuestion(
                    prompt: "Qual e a velocidade da luz no vacuo, aproximadamente?",
                    options: ["300 mil km/s", "150 mil km/s", "30 mil km/s", "3 mil km/s"],
                    correctIndex: 0
                ),
                QuizQuestion(
                    prompt: "Quem formulou as tres leis do movimento classico?",
                    options: ["Galileu Galilei", "Isaac Newton", "Albert Einstein", "Nikola Tesla"],
                    correctIndex: 1
                ),
                QuizQuestion(
                    prompt: "Qual particula possui carga eletrica negativa?",
                    options: ["Proton", "Neutron", "Foton", "Eletron"],
                    correctIndex: 3
                ),
                QuizQuestion(
                    prompt: "A energia potencial gravitacional aumenta quando:",
                    options: ["A altura diminui", "A altura aumenta", "A massa zera", "A gravidade desaparece"],
                    correctIndex: 1
                ),
                QuizQuestion(
                    prompt: "Qual e a unidade de corrente eletrica?",
                    options: ["Volt", "Ampere", "Ohm", "Tesla"],
                    correctIndex: 1
                )
            ]
        ),
        QuizTheme(
            name: "Geografia",
            subtitle: "Paises, relevo e localizacao.",
            questions: [
                QuizQuestion(
                    prompt: "Qual e a capital da Australia?",
                    options: ["Sydney", "Melbourne", "Canberra", "Perth"],
                    correctIndex: 2
                ),
                QuizQuestion(
                    prompt: "Qual e o maior oceano da Terra?",
                    options: ["Atlantico", "Indico", "Artico", "Pacifico"],
                    correctIndex: 3
                ),
                QuizQuestion(
                    prompt: "Qual linha imaginaria divide a Terra em hemisferio norte e sul?",
                    options: ["Meridiano de Greenwich", "Tropico de Cancer", "Linha do Equador", "Circulo Polar Artico"],
                    correctIndex: 2
                ),
                QuizQuestion(
                    prompt: "Em qual continente esta localizado o Egito?",
                    options: ["Asia", "Africa", "Europa", "Oceania"],
                    correctIndex: 1
                ),
                QuizQuestion(
                    prompt: "Qual deserto ocupa grande parte do norte da Africa?",
                    options: ["Atacama", "Saara", "Gobi", "Kalahari"],
                    correctIndex: 1
                ),
                QuizQuestion(
                    prompt: "Qual e o maior pais da America do Sul em area territorial?",
                    options: ["Argentina", "Chile", "Brasil", "Colombia"],
                    correctIndex: 2
                )
            ]
        ),
        QuizTheme(
            name: "Matematica",
            subtitle: "Calculos, logica e propriedades.",
            questions: [
                QuizQuestion(
                    prompt: "Qual e a raiz quadrada de 81?",
                    options: ["7", "8", "9", "10"],
                    correctIndex: 2
                ),
                QuizQuestion(
                    prompt: "Quanto e 15% de 200?",
                    options: ["20", "25", "30", "35"],
                    correctIndex: 2
                ),
                QuizQuestion(
                    prompt: "A soma dos angulos internos de um triangulo e:",
                    options: ["90 graus", "180 graus", "270 graus", "360 graus"],
                    correctIndex: 1
                ),
                QuizQuestion(
                    prompt: "Qual destes numeros e primo?",
                    options: ["21", "27", "29", "33"],
                    correctIndex: 2
                ),
                QuizQuestion(
                    prompt: "Se 2x + 6 = 14, qual e o valor de x?",
                    options: ["3", "4", "5", "6"],
                    correctIndex: 1
                ),
                QuizQuestion(
                    prompt: "Qual e a area de um retangulo com base 8 e altura 3?",
                    options: ["11", "16", "21", "24"],
                    correctIndex: 3
                )
            ]
        )
    ]
}