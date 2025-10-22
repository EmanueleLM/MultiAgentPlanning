(define (problem blocks-world-verify-final)
  (:domain blocks)
  (:objects A B C D E F G H I J K L M - block)

  ; Initial state as given in the public information
  (:init
    ; table bases initially
    (ontable L)
    (ontable B)
    (ontable C)
    (ontable F)
    (ontable G)

    ; on relations describing initial stacks:
    (on A L)
    (on M A)
    (on H M)

    (on D B)
    (on J D)

    (on K C)

    (on E F)

    (on I G)

    ; clear predicates for the initial top blocks
    (clear H)
    (clear J)
    (clear K)
    (clear E)
    (clear I)

    ; robot not holding anything initially
    (handempty)
  )

  ; Goal: verify action must be executable; the verify action requires the final arrangement
  ; The goal is (verified) so the planner must reach the computed final arrangement and then do verify-final-arrangement.
  (:goal (and (verified)))
)