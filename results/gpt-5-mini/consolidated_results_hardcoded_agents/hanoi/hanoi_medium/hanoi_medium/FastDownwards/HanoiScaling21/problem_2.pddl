(define (problem hanoi-5-problem)
  (:domain hanoi-5-domain)

  (:objects
    a b c d e - disk
    left middle right - peg
  )

  (:init
    ;; Size ordering (smallest -> largest)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)

    ;; Initial on-chain: top->bottom a,b,c,d,e on left peg
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e left)

    ;; Top disk
    (top a)

    ;; Peg emptiness initially
    (peg-empty middle)
    (peg-empty right)
  )

  (:goal (and
    ;; full stack on middle peg in correct order top->bottom a,b,c,d,e
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e middle)

    ;; both other pegs empty
    (peg-empty left)
    (peg-empty right)
  ))
)