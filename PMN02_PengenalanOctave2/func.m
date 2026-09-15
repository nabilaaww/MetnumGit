## L0325031_NabilaSalmaAzZahra

function func(param)
    fprintf('Nama saya %s!\n', param)
    callname(param)
end

function callname (param)
    fprintf('Kata \"%s\" diawali dengan huruf %c.\n', param, param(1))
end
