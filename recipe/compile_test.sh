set -e

LINK_FLAGS="-Wl,-rpath,$PREFIX/lib -L$PREFIX/lib"

FILES=test_sources/*.c
for f in $FILES
do
    clang -O2 -g $f $LINK_FLAGS
    ./a.out
done

FILES=test_sources/*.cpp
for f in $FILES
do
    clang++ -stdlib=libc++ -O2 -g $f $LINK_FLAGS
    ./a.out
done

FILES=test_sources/cpp11/*.cpp
for f in $FILES
do
    clang++ -stdlib=libc++ -std=c++11 -O2 -g $f $LINK_FLAGS
    ./a.out
done

FILES=test_sources/cpp14/*.cpp
for f in $FILES
do
    clang++ -stdlib=libc++ -std=c++14 -O2 -g $f $LINK_FLAGS
    ./a.out
done
