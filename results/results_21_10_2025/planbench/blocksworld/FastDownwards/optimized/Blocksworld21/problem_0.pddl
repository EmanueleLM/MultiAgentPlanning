(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocksworld)
  (:objects
    A B C D E F G H I J K L M - block
  )

  (:init
    ;; Membership as provided by the two agents (mapped to same object names)
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

    ;; Initial stacking configuration (unified from both agents' descriptions)
    ;; Stack 1: M (base) <- I <- K <- A
    (ontable M)
    (on I M)
    (on K I)
    (on A K)

    ;; Stack 2: E (base) <- L <- D <- F <- J
    (ontable E)
    (on L E)
    (on D L)
    (on F D)
    (on J F)

    ;; Stack 3: G (base) <- B <- C
    (ontable G)
    (on B G)
    (on C B)

    ;; Stack 4: H (base)
    (ontable H)

    ;; Clear (top) facts
    (clear A)
    (clear J)
    (clear C)
    (clear H)
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