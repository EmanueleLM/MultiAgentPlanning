(define (problem blocks-final)
  (:domain blocks-world)
  (:objects A B C D E F G - block)

  ;; The initial state here represents the state AFTER executing the provided action sequence.
  (:init
    ;; On relations (block on block)
    (on D B)
    (on E A)
    (on A C)
    (on C G)

    ;; On-table relations
    (ontable B)
    (ontable F)
    (ontable G)

    ;; Clear status
    (clear D)
    (clear E)
    (clear F)

    ;; Blocks that are not clear are not listed as clear (e.g., B, A, C, G are not clear where appropriate)

    ;; The agent's hand is empty in the final state
    (handempty)
  )

  ;; The goal is the same as the reported final arrangement (we require this exact final configuration).
  (:goal
    (and
      (on D B)
      (on E A)
      (on A C)
      (on C G)
      (ontable B)
      (ontable F)
      (ontable G)
      (clear D)
      (clear E)
      (clear F)
      (handempty)
    )
  )
)