(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocksworld)
  (:objects
    A B C D E F G H I J K L M - block
  )

  (:init
    ;; Agent membership constraints
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
    (consonant K)
    (consonant L)
    (consonant M)

    ;; Initial stacking configuration (as provided)
    ;; Stack: M (table) <- I <- K <- A
    (ontable M)
    (on I M)
    (on K I)
    (on A K)

    ;; Stack: E (table) <- L <- D <- F <- J
    (ontable E)
    (on L E)
    (on D L)
    (on F D)
    (on J F)

    ;; Stack: G (table) <- B <- C
    (ontable G)
    (on B G)
    (on C B)

    ;; H on table
    (ontable H)

    ;; Clear (top) facts as given: A, J, C, H are clear
    (clear A)
    (clear J)
    (clear C)
    (clear H)

    ;; Hands initially empty
    (handempty-vowel)
    (handempty-consonant)
  )

  (:goal
    (and
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
    )
  )
)