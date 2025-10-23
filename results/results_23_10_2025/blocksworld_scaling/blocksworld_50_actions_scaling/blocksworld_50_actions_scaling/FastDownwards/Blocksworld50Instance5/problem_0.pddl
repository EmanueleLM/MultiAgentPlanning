(define (problem blocks-world-final-goal)
  (:domain blocks)
  (:objects A B C D E F G H I J K L M - block)

  ; Initial state (as provided in the public information)
  (:init
    ; table bases
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

  ; Goal: the final arrangement computed from the full recorded action sequence
  (:goal (and
    ; final stack L -> A -> K
    (ontable L)
    (on A L)
    (on K A)

    ; final stack B -> F
    (ontable B)
    (on F B)

    ; final stack C -> J -> H -> D
    (ontable C)
    (on J C)
    (on H J)
    (on D H)

    ; E is on the table
    (ontable E)

    ; G -> I
    (ontable G)
    (on I G)

    ; M on table
    (ontable M)
  ))
)