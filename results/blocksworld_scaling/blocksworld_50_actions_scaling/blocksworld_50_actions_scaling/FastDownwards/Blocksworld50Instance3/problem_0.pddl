(define (problem blocksworld-final)
  (:domain blocks-world-multiagent)

  (:objects
    A B C D E F G H I J K L - block
    robot1 robot2 - agent
  )

  ;; Initial state: as given in the public facts (before executing the action sequence)
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

    ;; clear (top blocks initially)
    (clear E)
    (clear B)
    (clear G)
    (clear F)

    ;; agents start empty-handed
    (handempty robot1)
    (handempty robot2)
  )

  ;; Goal: final arrangement after integrating robot1 and robot2 actions
  (:goal (and
    ;; D-root stack: E on L on A on D (D on table)
    (ontable D)
    (on A D)
    (on L A)
    (on E L)

    ;; G-root stack: G on table <- K <- C <- B  (B top)
    (ontable G)
    (on K G)
    (on C K)
    (on B C)

    ;; I final: I on table (alone)
    (ontable I)

    ;; F final: F on table (alone)
    (ontable F)

    ;; J-root: H on J (J on table)
    (ontable J)
    (on H J)
  ))
)