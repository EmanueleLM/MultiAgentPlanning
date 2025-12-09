(define (problem hanoi-5-problem)
  (:domain hanoi-5-domain)
  (:objects
    a b c d e - disk
    left middle right - peg
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10
    s11 s12 s13 s14 s15 s16 s17 s18 s19 s20
    s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - step
  )

  (:init
    ;; Initial stack on left: top->bottom a,b,c,d,e represented as on-d/on-p chain
    (on-d a b)
    (on-d b c)
    (on-d c d)
    (on-d d e)
    (on-p e left)

    ;; Other pegs empty initially
    (peg-empty middle)
    (peg-empty right)

    ;; Top disk predicates
    (top a)

    ;; start at step 1
    (current-step s1)
  )

  ;; Goal: final middle peg top->bottom a,b,c,d,e and left,right empty
  (:goal (and
    (on-d a b)
    (on-d b c)
    (on-d c d)
    (on-d d e)
    (on-p e middle)
    (peg-empty left)
    (peg-empty right)
  ))
)