TW="terraform workspace"

list() {
    $TW list
}

current() {
    $TW show
}

create() {
    $TW new $1
}

switchto() {
    $TW select $1
}

delete() {
    $TW delete $1
}

$1 $2