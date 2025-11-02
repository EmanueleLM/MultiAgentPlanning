(define (problem blocks-world-sequence-problem)
  (:domain blocks-world-sequence)
  (:objects
    A B C D E F G H - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 - step
  )
  (:init
    ;; Initial stacks:
    ;; Stack1: Table -> G -> B -> C -> F -> D (D is top)
    (ontable G)
    (on B G)
    (on C B)
    (on F C)
    (on D F)
    ;; Stack2: Table -> A -> H -> E (E is top)
    (ontable A)
    (on H A)
    (on E H)
    ;; Clear (tops)
    (clear D)
    (clear E)
    ;; Nobody holding anything at start
    (handempty)
    ;; Start step marker
    (done s0)
  )
  (:goal (and
    (done s20)
  ))
)