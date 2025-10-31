(define (problem multiagent_blocks_problem)
  (:domain multiagent_blocks_domain)
  (:objects
    A E I - vowel
    B C D F G H J K L - consonant
  )

  (:init
    ;; Initial stacks as given:
    ;; Stack1 bottom-to-top: I, H, L, A, J
    (ontable I)
    (on H I)
    (on L H)
    (on A L)
    (on J A)

    ;; Stack2 bottom-to-top: F, E, K, G, C, B, D
    (ontable F)
    (on E F)
    (on K E)
    (on G K)
    (on C G)
    (on B C)
    (on D B)

    ;; Clear tops initially
    (clear J)
    (clear D)
    ;; All other clear/ontable/on facts are false by default
  )

  (:goal (and
    ;; Final single stack bottom-to-top: L, K, J, I, H, G, F, E, D, C, B, A
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
    ;; A on top
    (clear A)
  ))
)