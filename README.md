# cl-stack-idna

Stack-owned **IDNA2008 / UTS #46** facade (`stack-idna`) over [`unicode-protocol`](https://github.com/egao1980/unicode-protocol) + [`unicode-backend-cl-unicode`](https://github.com/egao1980/unicode-backend-cl-unicode).

**Does not replace** Ultralisp [`egao1980/cl-idna`](https://github.com/egao1980/cl-idna) — that package stays for external/QL consumers. New stack code (quri, demos, …) should depend on **`cl-stack-idna`**.

```lisp
(asdf:load-system "cl-stack-idna")
(stack-idna:to-ascii "bücher.de")     ; => "xn--bcher-kva.de"
(stack-idna:to-unicode "xn--bcher-kva.de")
```

API mirrors `cl-idna` (`to-ascii` / `to-unicode` / `idna-map` + the same keyword args).

## License

MIT
