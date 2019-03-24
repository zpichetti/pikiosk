const updatetime = () => {
  let x = setInterval(function() { 
    const today = new Date(); 
    const hours = today.getHours(); 
    const minutes = today.getMinutes(); 
    let timeValue = ((hours < 10) ? "0" : "") + hours;
    timeValue += ((minutes < 10) ? ":0" : ":") + minutes;
    document.getElementById("time").innerHTML = timeValue; 
  }, 1000);
}

export { updatetime };