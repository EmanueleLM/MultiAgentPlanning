(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    A E I - vowel-block
    B C D F G H J K L - consonant-block
  )

  (:init
    ;; initial on / ontable configuration (as provided)
    (ontable I)
    (on E I)
    (on J E)
    (on F J)
    (on L F)
    (on B L)

    (ontable D)
    (on K D)
    (on H K)
    (on A H)

    (ontable C)
    (on G C)

    ;; clear (top) blocks computed from the provided configuration
    (clear A)
    (clear B)
    (clear G)

    ;; both agents start with empty hands (each agent can hold at most one)
    (vowel-handempty)
    (consonant-handempty)
  )

  (:goal
    (and
      ;; target stacking chain: A on B, B on C, ..., K on L, and L on table
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F G)
      (on G H)
      (on H I)
      (on I J)
      (on J K)
      (on K L)
      (ontable L)
    )
  )
)