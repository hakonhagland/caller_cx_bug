To test the code run:

```
cd lib/My
perl Makefile.PL
make
cd ../..
p.pl
```

**Output**:

```
My::Caller::test() : NULL
My::Caller::test2() : main
```

**Expected output**:

```
My::Caller::test() : main
My::Caller::test2() : main
```


