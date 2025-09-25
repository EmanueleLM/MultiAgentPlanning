(define (problem multiagent_blocks_problem)
  (:domain multiagent_blocks)
  (:objects
    A B C D E F G H I J K L M
  )

  (:init
    ;; Table bottoms
    (ontable M)
    (ontable E)
    (ontable G)
    (ontable H)

    ;; Stack 1: M - I - K - A  (M bottom, A top)
    (on I M)
    (on K I)
    (on A K)

    ;; Stack 2: E - L - D - F - J  (E bottom, J top)
    (on L E)
    (on D L)
    (on F D)
    (on J F)

    ;; Stack 3: G - B - C  (G bottom, C top)
    (on B G)
    (on C B)

    ;; Clear (top) blocks
    (clear A)
    (clear J)
    (clear C)
    (clear H)

    ;; Vowel-capable blocks (manipulated by vowel agent)
    (vowel A)
    (vowel E)
    (vowel I)

    ;; Consonant-capable blocks (manipulated by consonant agent)
    (consonant M)
    (consonant H)
    (consonant G)
    (consonant B)
    (consonant L)
    (consonant D)
    (consonant F)
    (consonant C)
    (consonant K)
    (consonant J)
  )

  (:goal (and
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
    (on L M)
    (ontable M)
  ))
)