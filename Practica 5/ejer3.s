            .data
altura:     .double 13.47
base:       .double 5.85
medio:      .double 0.5
resultado:  .double 0.0

            .text
            l.d f1, base(r0)
            l.d f2, altura(r0)
            mul.d f4, f1, f2
            l.d f3, medio(r0)
            mul.d f5, f4, f3
            s.d f5, resultado(r0)
            halt