(define (problem multiagent_blocks_problem)
  (:domain multiagent_blocks)
  (:objects
    A B C D E F G H I J K L M
  )

  (:init
    (ontable M)
    (ontable E)
    (ontable G)
    (ontable H)

    (on I M)
    (on K I)
    (on A K)

    (on L E)
    (on D L)
    (on F D)
    (on J F)

    (on B G)
    (on C B)

    (clear A)
    (clear J)
    (clear C)
    (clear H)

    (vowel A)
    (vowel E)
    (vowel I)

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