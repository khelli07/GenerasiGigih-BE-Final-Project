console.log("Hello from custom! Please rename me :)")
const tagContainer = document.querySelector('.tag-container');
const input = document.querySelector('.tag-container input');

let tags = [];

function createTag(label) {
  const div = document.createElement('div');
  div.setAttribute('class', 'tag');
  const span = document.createElement('span');
  span.innerHTML = label;
  const closeIcon = document.createElement('i');
  closeIcon.innerHTML = 'buang';
  closeIcon.setAttribute('class', 'material-icons');
  closeIcon.setAttribute('data-item', label);
  div.appendChild(span);
  div.appendChild(closeIcon);
  return div;
}

function clearTags() {
  document.querySelectorAll('.tag').forEach(tag => {
    tag.parentElement.removeChild(tag);
  });
}

function addTags() {
  clearTags();
  tags.slice().reverse().forEach(tag => {
    tagContainer.prepend(createTag(tag));
  }); 
}

function moveTags() {
  // Memindahkan tags supaya bisa dikirim bersama form
  let input = document.getElementById("hidden-tags");
  while (input.hasChildNodes()) {
      input.removeChild(input.lastChild);
  }
  input.value = tags;
}

input.addEventListener('keyup', (e) => {
  console.log(e.key);
  if (e.key === 'Escape' && e.target.value != "") {
    e.target.value.split(',').forEach(tag => {
      tags.push(tag);  
    });
    
    addTags();
    input.value = '';
  }
  moveTags()
});

document.addEventListener('click', (e) => {
  console.log(e.target.tagName);
  if (e.target.tagName === 'I') {
    const tagLabel = e.target.getAttribute('data-item');
    const index = tags.indexOf(tagLabel);
    tags = [...tags.slice(0, index), ...tags.slice(index+1)];
    addTags();    
  }
})

input.focus();


/*
ADD <%= javascript_include_tag 'category'%> to HTML :)
*/