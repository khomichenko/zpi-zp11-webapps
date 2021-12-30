let backend = 'http://localhost:8081'
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