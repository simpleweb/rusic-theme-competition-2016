clipboard = new Clipboard('.js-clipboard')

clipboard.on 'success', (e) ->
  el = document.getElementById("referral_link_button")
  el.innerHTML = "✔"
  if (el.classList)
    el.classList.add("active")
  else
    el.className += ' ' + "active"
