#!/bin/bash

function _get_proj_path() {
    local SOURCE="${BASH_SOURCE[0]}"
    while [ -h "$SOURCE" ]; do
        local TARGET="$(readlink "$SOURCE")"
        if [[ $TARGET == /* ]]; then
            SOURCE="$TARGET"
        else
            local DIR="$( dirname "$SOURCE" )"
            SOURCE="$DIR/$TARGET"
        fi
    done
    local RDIR="$( dirname "$SOURCE" )"
    DIR="$( \cd -P "$( dirname "$SOURCE" )" && pwd )"
    if [ "$DIR" != "$RDIR" ]; then
       echo "source '$DIR' "
    fi

    export CWD="$( cd -P "$DIR/../" && pwd )"
    echo "set CWD to '$CWD'."
}

_get_proj_path

#---------------------------------------------------
# Custom
#--------------------------------------------------
function cscope-sync() {
    if [[ -z ${CWD} ]]; then
        echo "CWD is not set!!!"
    else
        \cd ${CWD};
        local DIR="${CWD}/.projrc"

        echo "Finding source c-like code..."
        > ${DIR}/filelist

        # C-like
        #_find_c_source vendor/mediatek/proprietary/
        #_find_c_source kernel-3.10/
        #_find_c_source frameworks/av/
        _find_c_source modules/
        #_find_c_source bionic/

        echo "Finding source java code..."
        # Java
        #_find_java_source frameworks/av/
        echo "Done."

        echo "Building cscope database..."
        cscope -bq -i ${DIR}/filelist -f ${DIR}/cscope/cscope.out 2>/dev/null
        echo "Done."
    fi
}

function _find_c_source() {
    find ${1} -name .repo -prune -o -name .git -prune -o -name out -prune -o -type f \( -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name '*.h' -o -name '*.hpp' \) -print >> ${DIR}/filelist
}

function _find_java_source() {
    find ${1} -name .repo -prune -o -name .git -prune -o -name out -prune -o -type f \( -name '*.java' \) -print >> ${DIR}/filelist
}

#TODO
function _mark_mcu_path() {
    alias cdrt='cd ${CWD}'
    #alias cdvcu='cd ${CWD}/vendor/mediatek/proprietary/custom'
    #alias cdvhw='cd ${CWD}/vendor/mediatek/proprietary/hardware/mtkcam'
    #alias cdvplf='cd ${CWD}/vendor/mediatek/proprietary/platform/mt6795/hardware/mtkcam'
    #alias cdkimg='cd ${CWD}/kernel-3.10/drivers/misc/mediatek/imgsensor/src/mt6795'
    #alias cdklen='cd ${CWD}/kernel-3.10/drivers/misc/mediatek/imgsensor/lens/mt6795'
}

_mark_mcu_path

