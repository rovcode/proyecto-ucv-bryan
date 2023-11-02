let flipCards = 0
let cardOne = null
let cardTwo = null
let firstResult = null
let secondResult = null
let temp = false
let timer = 30   //tiempo inicial
let functionTimerId = null

let successes = 0

//cantidad de movimientos
let movements = 0

let showTime = document.getElementById('showTime')
let showSuccesses = document.getElementById('showSuccesses')
let cantMovements = document.getElementById('movements')
let numbers = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8]
numbers = numbers.sort(() => {return Math.random()-0.5})



function contTime(){
    functionTimerId = setInterval(()=>{
        timer--
        showTime.innerHTML = `Tiempo restante:<br>${timer} segundos`
        if(timer == 0){
            clearInterval(functionTimerId)
            blockCards()
        }
    }, 1000)
}

function blockCards(){
    for(let i=0; i<16; i++){
        let blockCard = document.getElementById(i)
        blockCard.innerHTML = `<img  src="../Asset/complementos/images/${numbers[i]}.png">`
        blockCard.disabled = true
    }
}


function flip(id){

    if(temp == false){
        contTime()
        temp = true
    }

    flipCards++
    if(flipCards == 1){
        cardOne = document.getElementById(id)
        firstResult = numbers[id]
        cardOne.innerHTML = `<img  src="../Asset/complementos/images/${firstResult}.png">`
        $(cardOne).closest('button').removeClass('animate__flipInX');
        $(cardOne).closest('button').addClass('animate__animated animate__flipInX');
        cardOne.disabled = true
    } else if (flipCards == 2){
        cardTwo = document.getElementById(id)
        secondResult = numbers[id]
        cardTwo.innerHTML = `<img  src="../Asset/complementos/images/${secondResult}.png">`
        $(cardTwo).closest('button').removeClass('animate__flipInX');
        $(cardTwo).closest('button').addClass('animate__animated animate__flipInX');
        cardTwo.disabled = true
        movements++
        cantMovements.innerHTML = `Movimientos: ${movements}`

        if(firstResult == secondResult){
            flipCards = 0
            successes++
            showSuccesses.innerHTML = `Aciertos: ${successes}`

            if(successes == 8){
                clearInterval(functionTimerId)
                showSuccesses.innerHTML = `Aciertos: ${successes} 🥳🥳🥳`
                showTime.innerHTML = `Muy bien!!<br>Tardaste<br>${30-timer} segundos`
                cantMovements.innerHTML = `Movimientos: ${movements}<br>🥳🥳🥳`
            }
        } else {
            setTimeout(()=>{
                cardOne.innerHTML = ' '
                cardTwo.innerHTML = ' '
                cardOne.disabled = false
                cardTwo.disabled = false
                $(cardOne).closest('button').removeClass('animate__flipInX');
                $(cardTwo).closest('button').removeClass('animate__flipInX');
                setTimeout( () => {
                    $(cardOne).closest('button').addClass('animate__flipInX');
                    $(cardTwo).closest('button').addClass('animate__flipInX');
                    setTimeout(() => {
                        $(cardOne).closest('button').removeClass('animate__flipInX');
                        $(cardTwo).closest('button').removeClass('animate__flipInX');
                    },800);
                },1)
                flipCards = 0
            }, 800)
        }
    }
}