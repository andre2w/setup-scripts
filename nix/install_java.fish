function _get_latest_java
    sdk list java | grep "$argv.*j9-adpt" | awk '{ print $8 }'
end

function install_java 
    set -l java_version (_get_latest_java $argv)
    echo "Installing Java $java_version"
    sdk install java $java_version
end

function set_default_java
    sdk default java (sdk list java | grep "$argv.*j9-adpt" | awk '{ print $9 }')
end