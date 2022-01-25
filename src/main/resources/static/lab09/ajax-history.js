
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
