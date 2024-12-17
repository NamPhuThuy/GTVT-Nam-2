// coding implementation
function checknull(txt){
    if(txt.value.length==0)
        return true;
    else
        return false;
}
function isEmail(email) {
return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
}
function validform(f){
    if(checknull(f.email)){
        alert(f.email.name + " must be not null");
        f.fullname.focus();
        return;
    }
    if(checknull(f.com))
    {
        alert(f.com.name + " must be not null");
        f.com.focus();
        return;
    }
    if(checknull(f.rate))
    {
        alert(f.rate.name + " must be not null");
        f.rate.focus();
        return;
    }
    if(isNaN(f.rate.value))
    {
        alert(f.rate.name + " must be a number");
        f.rate.value="";
        f.rate.focus();
        return;
    }
    if(eval(f.rate.value)<=0)
    {
        alert(f.rate.name + " must be greater than 0");
        f.rate.value="";
        f.rate.focus();
        return;
    }
}
// end coding implementation