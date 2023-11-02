let start = document.getElementById("start")
let startPanel = document.getElementById("start-panel")
let gamePanel = document.getElementById("game-panel")
let endPanel = document.getElementById("end-panel")
let currentQue = 0
let strPreg = document.getElementById("pregunta")
let imgPreg = document.getElementById("imgPreg")
let alternative = null
let bienRespondidas = 0
let malRespondidas = 0


let preguntas = ["Officia occaecat laborum dolore ipsum nulla.", 
                "Ad veniam excepteur sunt minim qui do eiusmod non non labore.", 
                "Officia commodo pariatur tempor minim magna et."]

let alternativas = [["Hola", "Nada", "Nombre"], ["Hola2", "Nada2", "Nombre2"], ["Hola3", "Nada3", "Nombre3"]]

let respuestas = ["Hola", "Hola2", "Hola3"]

function mostrarQuiz(){
    strPreg.innerHTML = preguntas[currentQue]
    startGame()
} 


function startGame(){
    startPanel.style.display = "none"
    gamePanel.style.display = "block"
    strPreg.innerHTML = preguntas[currentQue]
    for(let i=0; i<3; i++){
        alternative = document.getElementById(`alt${i+1}`)
        alternative.innerHTML = alternativas[currentQue][i]
    }
}

function probarAlt(a){
    console.log(currentQue)
    if(currentQue >= preguntas.length - 1){
        comprobar(alternativas[currentQue][a], respuestas[currentQue])
        endPanel.style.display = "block"
        document.getElementById("respuestasBien").innerHTML = `Respuestas bien: ${bienRespondidas}`
        document.getElementById("respuestasMal").innerHTML = `Respuestas mal: ${malRespondidas}`
        gamePanel.style.display = "none"
    } else {
        comprobar(alternativas[currentQue][a], respuestas[currentQue])
        currentQue++
        if(currentQue < preguntas.length){
            mostrarQuiz()
        }
    }
}

function comprobar(a, b){
    if(a === b){
        bienRespondidas++
    } else {
        malRespondidas++
    }
}