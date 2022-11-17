#!/bin/sh

$cp $busybox busybox
./busybox mkdir -p $out/bin

for cmd in "mv" "chmod" "cp" "ln" "mkdir"; do
  ./busybox ln -s busybox $out/bin/$cmd
done

./busybox mv busybox $out/bin
