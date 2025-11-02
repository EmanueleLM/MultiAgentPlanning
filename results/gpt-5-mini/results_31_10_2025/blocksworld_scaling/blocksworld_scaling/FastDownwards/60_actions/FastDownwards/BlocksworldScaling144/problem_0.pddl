(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects
    A E I - vowel
    B C D F G H J K L - consonant
  )

  (:init
    ;; Table and on relations reflecting initial stacks (bottom -> top):
    ;; Stack1: G, H, L  (G on table; H on G; L on H)
    (ontable G)
    (on H G)
    (on L H)
    ;; Stack2: I, K, B  (I on table; K on I; B on K)
    (ontable I)
    (on K I)
    (on B K)
    ;; Stack3: F
    (ontable F)
    ;; Stack4: C, J, E, D, A
    (ontable C)
    (on J C)
    (on E J)
    (on D E)
    (on A D)

    ;; Clear (tops)
    (clear L)
    (clear B)
    (clear F)
    (clear A)
  )

  ;; Goal: single chain with L on the table and above it (bottom->top):
  ;; K, J, I, H, G, F, E, D, C, B, A
  (:goal (and
    (ontable L)
    (on K L)
    (on J K)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
  ))
)