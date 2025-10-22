(define (problem blocksworld20instance8-problem)
  (:domain blocksworld20instance8)
  (:objects A B C D E F G H I - block)
  (:init
    ;; Initial stacks (as given)
    (ontable B)
    (on H B)
    (on A H)

    (ontable G)
    (on C G)
    (on E C)
    (on I E)
    (on F I)

    (ontable D)

    ;; Clear tops in initial state
    (clear A)
    (clear F)
    (clear D)

    (handempty)
  )
  ;; Goal: final arrangement derived from executing the sequence
  (:goal (and
    (on A I)
    (ontable B)
    (on C G)
    (on D A)
    (on E C)
    (on F H)
    (ontable G)
    (on H B)
    (on I F)
  ))
)