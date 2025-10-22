(define (problem Blocksworld10Instance18)
  (:domain blocksworld_sequence)
  (:objects A B C D E F G H - block)

  (:init
    ; initial on / ontable relations
    (on A G)
    (on C H)
    (on D F)
    (on E B)
    (on H E)
    (ontable B)
    (ontable F)
    (ontable G)

    ; initial clear predicates (nothing on these blocks)
    (clear A)
    (clear C)
    (clear D)

    ; initially hand empty and starting step
    (handempty)
    (step0)
  )

  ; Goal: have completed the enforced sequence of 10 actions (the only way to achieve this is to execute the specified steps in order)
  (:goal (step10))
)