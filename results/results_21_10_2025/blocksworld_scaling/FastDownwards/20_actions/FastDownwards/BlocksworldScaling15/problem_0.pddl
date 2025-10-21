(define (problem build_L_with_A_on_top)
  (:domain multiagent-blocks)
  (:objects
    A - vowel
    L - consonant
  )
  (:init
    (ontable A)
    (ontable L)
    (clear A)
    (clear L)
  )
  (:goal (and
           (ontable L)
           (on A L)
         ))
)