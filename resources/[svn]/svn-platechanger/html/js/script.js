const doc = document;
const plate = doc.getElementById('wrapper');
let currentKey = "";
let usingButtons = true;

this.window.addEventListener('load', e => {
    window.addEventListener('message', e => {
        switch (e.data.action) {
            case 'show':
                $("body").show()
                plate.style.display = 'flex';
                plate.style.opacity = '1';
                if (!usingButtons) {
                    doc.getElementById('btns').style.display = 'none';
                }
            break;

            case 'hide':
                plate.style.display = 'none';
                plate.style.opacity = '0';
                $("body").hide()
                if (!usingButtons) {
                    doc.getElementById('btns').style.display = 'none';
                }
            break;

            case 'key':
                usingButtons = e.data.buttons;
                currentKey = e.data.key;
                doc.getElementById('title').textContent = e.data.title;
                if (e.data.chars) {
                    document.getElementById("text").maxLength = '8'
                    document.getElementsByName('text')[0].placeholder='SAMPLE';
                }
            break;
        }
    })
})

doc.getElementById('one').addEventListener('click', () => fetchNUI('getPlateText', doc.getElementById('text').value.toUpperCase()));

doc.getElementById('two').addEventListener('click', () => fetchNUI('close'));

const fetchNUI = async (cbname, data) => {
    const options = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        },
        body: JSON.stringify(data)
    };
    const resp = await fetch(`https://svn-platechanger/${cbname}`, options);
    return await resp.json();
}

function closeNUI() {
    fetchNUI('close')
    console.log('NUI closed');
    $("body").hide()
  }

$(document).on('click', '.exit', function (e) {
    closeNUI()
  })
  

document.addEventListener('keydown', function(event) {
  
    if (event.key === 'Escape') {
      closeNUI();
    }
  });