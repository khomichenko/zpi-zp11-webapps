let backend = 'http://localhost:8081'
if (window.location.hostname!='localhost') {
    backend = 'http://instoof.com:8081'
}
function appCalculate(expr,callback) {
    axios.get(backend+"/calc/do?expression="+encodeURIComponent(expr),{
        headers: {
            'Access-Control-Allow-Origin': '*',
            'Content-Type': 'application/json',
        }
    }).then(r => {
        callback(r.data)
    });
}
function appHistory(callback){
    axios.get(backend+"/calc/history",{
        headers: {
            'Access-Control-Allow-Origin': '*',
            'Content-Type': 'application/json',
        }
    }).then(r => {
        callback(r.data)
    });
}