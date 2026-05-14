function light() {
    export BACKGROUND="light" && reload!
}

function dark() {
    export BACKGROUND="dark" && reload!
}

function ratty() {
  BEVY_ASSET_ROOT=/Users/cvaldez/workshop/ratty command ratty "$@"
}
