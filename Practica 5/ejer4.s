            .data
ESTATURA:   .double 1.73
PESO:       .double 75.7
IMC:        .double 0.0
INFRA:      .double 18.5
NORMAL:     .double 25.0
SOBREPESO:  .double 30
ESTADO:     .word 0

            .text
            l.d f1, ESTATURA(r0)
            l.d f2, PESO(r0)
            l.d f3, INFRA(r0)
            l.d f4, NORMAL(r0)
            l.d f5, SOBREPESO(r0)
            mul.d f6, f1, f1
            div.d f7, f2, f6
            c.lt.d f7, f3
            bc1t INF
            c.lt.d f7, f4
            bc1t NORM
            c.lt.d f7, f5
            bc1t SOBRE
            s.d f7, IMC(r0)
            daddi r1, r0, 4
            sd r1, ESTADO(r0)
            j fin
INF:        s.d f7, IMC(r0)
            daddi r1, r0, 1
            sd r1, ESTADO(r0)
            j fin
NORM:       s.d f7, IMC(r0)
            daddi r1, r0, 2
            sd r1, ESTADO(r0)
            j fin
SOBRE:      s.d f7, IMC(r0)
            daddi r1, r0, 3
            sd r1, ESTADO(r0)
            j fin
fin:        halt