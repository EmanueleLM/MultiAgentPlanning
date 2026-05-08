(define (problem hanoi-7)
  (:domain hanoi)
  (:objects
    a b c d e f g - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 - stage
  )

  (:init
    ;; stage chain exactly covering required number of moves (2^7 - 1 = 127 moves -> 128 stages)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9)
    (succ s9 s10) (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15) (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19)
    (succ s19 s20) (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24) (succ s24 s25) (succ s25 s26) (succ s26 s27)

    (active s0)

    ;; static size ordering (smaller -> larger)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g)
    (smaller d e) (smaller d f) (smaller d g)
    (smaller e f) (smaller e g)
    (smaller f g)

    ;; initial stack on right peg: top-to-bottom a b c d e f g
    ;; immediate-support ("on") links: a on b, b on c, ..., f on g, g on right
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g right)

    ;; top-of-peg facts
    (top a right)

    ;; empty pegs
    (empty left)
    (empty middle)
  )

  (:goal (and
    ;; final stack on middle peg: a on b, b on c, ..., f on g, g on middle, and a is top of middle
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g middle)
    (top a middle)
    ;; left and right must be empty at the end
    (empty left)
    (empty right)
  ))
)