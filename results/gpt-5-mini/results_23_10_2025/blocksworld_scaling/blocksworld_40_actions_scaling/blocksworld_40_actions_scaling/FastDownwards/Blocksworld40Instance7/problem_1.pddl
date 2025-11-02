(define (problem blocksworld-final-verify)
  (:domain blocksworld-multiagent-final)
  (:objects A B C D E F G H I J - block)

  (:init
    ;; Initial placement (from provided initial arrangement)
    (ontable A)
    (on E A)
    (on H E)

    (ontable B)
    (on F B)

    (ontable D)
    (on I D)
    (on C I)

    (ontable G)
    (on J G)

    ;; clear blocks initially (tops)
    (clear H)
    (clear F)
    (clear C)
    (clear J)

    ;; both robots start with empty hands
    (handempty-r1)
    (handempty-r2)
  )

  ;; Goal: final arrangement after executing the provided ordered action sequence
  (:goal
    (and
      ;; Stack on A: C then G then J -> A (table) <- C <- G <- J
      (ontable A)
      (on C A)
      (on G C)
      (on J G)

      ;; Stack on B: F then H then E -> B (table) <- F <- H <- E
      (ontable B)
      (on F B)
      (on H F)
      (on E H)

      ;; Stack on D: I -> D (table) <- I
      (ontable D)
      (on I D)
    )
  )
)