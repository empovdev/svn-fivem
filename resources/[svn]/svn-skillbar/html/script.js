var attemptsLeft = 0; 
var timerInterval = null;
var eKeyPressed = false;
var slotPosition = 0;
var currPosition = 1;

$(function() {
    window.addEventListener('message', function(event) {
        var data = event.data
        if(data.action == "openAndCheck" ) {
            attemptsLeft = data.attempts - 1;
            openHackingContainer(attemptsLeft);
            startGame(data.speed);
        }
    })
})

function startGame(speed) {
    MoveSpeed = speed
    var movingSquare = document.querySelector('.moving-square');
    var buttonPress = document.querySelector('.button-press');
    var squareSlot = document.querySelector('.square-slot');
    movingSquare.style.background = "radial-gradient(circle, rgb(0, 255, 200), rgb(0, 174, 130))";
    movingSquare.style.boxShadow = "0 0 5px 0px rgb(16, 239, 191)";
    movingSquare.style.marginLeft = "1%";
    buttonPress.style.background = 'radial-gradient(circle, rgb(0, 183, 140), rgb(0, 81, 61))';
    squareSlot.style.setProperty('--background-gradient', 'radial-gradient(circle, rgb(0, 255, 200), rgb(0, 174, 130))');
    eKeyPressed = false;
    currPosition = 0;
    randomizeSquareSlot();
    tick(MoveSpeed);
}

function checkWin() {
    var movingSquare = document.querySelector('.moving-square');
    var squareSlot = document.querySelector('.square-slot');
    var buttonPress = document.querySelector('.button-press');
    if (timerInterval) {
        clearInterval(timerInterval);
    }
    if (slotPosition - 2 <= currPosition && currPosition <= slotPosition + 2) {
        movingSquare.style.scale = '1.2';
        setTimeout(function () {
            movingSquare.style.scale = '1';
        }, 300);
        $.post('http://svn-skillbar/success', JSON.stringify({}));
        setTimeout(closeHackingContainer, 1000);
        return true;
        
    } else {
        if (attemptsLeft > 0) {
            attemptsLeft--; 
            movingSquare.style.background = "radial-gradient(circle, rgb(255, 85, 76), rgba(132, 32, 32, 0.894))";
            movingSquare.style.boxShadow = "0 0 5px 0px rgb(255, 0, 0)";
            buttonPress.style.background = "radial-gradient(circle, rgb(255, 85, 76), rgba(132, 32, 32, 0.894))";
            squareSlot.style.setProperty('--background-gradient', 'radial-gradient(circle, rgb(255, 85, 76), rgba(132, 32, 32, 0.894))');
            setTimeout(tryHackingContainer, 1000);
            setTimeout(function() {
                openHackingContainer(attemptsLeft);
                startGame(MoveSpeed);
            }, 1000);
            
        } else {
            movingSquare.style.background = "radial-gradient(circle, rgb(255, 85, 76), rgba(132, 32, 32, 0.894))";
            movingSquare.style.boxShadow = "0 0 5px 0px rgb(255, 0, 0)";
            buttonPress.style.background = "radial-gradient(circle, rgb(255, 85, 76), rgba(132, 32, 32, 0.894))";
            squareSlot.style.setProperty('--background-gradient', 'radial-gradient(circle, rgb(255, 85, 76), rgba(132, 32, 32, 0.894))');
            setTimeout(closeHackingContainer, 1000);
            $.post('http://svn-skillbar/failed', JSON.stringify({}));       
         }

        return false;
    }
}


function tick(speed) {
    var movingSquare = document.querySelector('.moving-square');
    var intervalDuration = 1000 / speed;
    timerInterval = setInterval(function () {
        movingSquare.style.marginLeft = "".concat(currPosition, "%");
        currPosition += 0.5;
        if (currPosition > Math.min(slotPosition + 7, 94)) {
            if (timerInterval) {
                clearInterval(timerInterval);
            }
            handleKeyPress(new KeyboardEvent('keydown', { key: 'E' }));
        }
    }, intervalDuration);
}

function handleKeyPress(event) {
    if (!eKeyPressed && (event.key === 'e' || event.key === "E")) {
        eKeyPressed = true;
        checkWin();
    } else if (event.key === 'Escape') {
        closeHackingContainer();
    }
}

function randomizeSquareSlot() {
    var squareSlot = document.querySelector('.square-slot');
    slotPosition = Math.floor(Math.random() * (90 - 15) + 15);
    squareSlot.style.marginLeft = "".concat(slotPosition, "%");
    squareSlot.style.display = "flex";
}

function openHackingContainer(attempts) {
    var hackingContainer = document.querySelector('.hacking-container');
    hackingContainer.style.display = 'flex';
    document.addEventListener('keydown', handleKeyPress);
}

function closeHackingContainer() {
    var hackingContainer = document.querySelector('.hacking-container');
    hackingContainer.style.display = 'none';
    document.removeEventListener('keydown', handleKeyPress);
    $.post('http://svn-skillbar/close', JSON.stringify({}));
}

function tryHackingContainer() {
    var hackingContainer = document.querySelector('.hacking-container');
    hackingContainer.style.display = 'none';
    document.removeEventListener('keydown', handleKeyPress);
}