const updatetime = () => {
  let x = setInterval(function() { 
    const today = new Date(); 
    const hours = today.getHours(); 
    const minutes = today.getMinutes(); 
    const day = today.getDate();
    const month = today.getMonth();
    let timeValue = ((hours < 10) ? "0" : "") + hours;
    timeValue += ((minutes < 10) ? ":0" : ":") + minutes;
    timeValue += ((day < 10) ? " - 0" : " - ") + day;
    timeValue += (((month + 1) < 10) ? "/0" : "/") + (month + 1);
    document.getElementById("time").innerHTML = timeValue; 
  }, 1000);
}

export { updatetime };