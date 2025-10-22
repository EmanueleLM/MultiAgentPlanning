(define (problem blocksworld-final)
  (:domain blocks-world-multiagent)

  (:objects
    A B C D E F G H I J K L - block
    robot1 robot2 - agent
  )

  ;; Initial state (before executing the action sequence)
  (:init
    ;; table-root blocks
    (ontable D)
    (ontable K)
    (ontable C)
    (ontable J)

    ;; stacking relationships (initial)
    (on A D)
    (on L A)
    (on E L)

    (on B K)

    (on I C)
    (on G I)

    (on H J)
    (on F H)

    ;; clear (initial top blocks)
    (clear E)
    (clear B)
    (clear G)
    (clear F)

    ;; agents start empty-handed
    (handempty robot1)
    (handempty robot2)
  )

  ;; Goal: final arrangement after integrating the full action sequence
  (:goal (and
    ;; D-root stack: A on D, L on A, E on L (D on table)
    (ontable D)
    (on A D)
    (on L A)
    (on E L)

    ;; G-root stack: K on G, C on K, B on C (G on table)
    (ontable G)
    (on K G)
    (on C K)
    (on B C)

    ;; F on table
    (ontable F)

    ;; I on table
    (ontable I)

    ;; J-root: H on J (J on table)
    (ontable J)
    (on H J)
  ))
)