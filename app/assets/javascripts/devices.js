function generateToken() {
    document.getElementById("device_auth").value = token();
}

function token() {
    return Math.random().toString(16).substr(2);
}