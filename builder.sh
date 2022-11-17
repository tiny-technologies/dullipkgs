#!/bin/sh

set -e
unset PATH

for path in $buildInputs; do
    export PATH=$path/bin${PATH:+:}$PATH
done

mkdir -p $out/bin
printf '#!/bin/sh \necho "Hello from '"$person"'!"\n' > $out/bin/$name
chmod +x $out/bin/$name
