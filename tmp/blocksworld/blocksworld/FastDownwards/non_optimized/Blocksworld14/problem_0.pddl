(define (problem stacking-multiagent-problem)
  (:domain stacking-multiagent)
  (:objects
    A B C D E F G H I J K L M N table
  )
  (:init
    ;; Ownership by agents
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
    (consonant N)

    ;; Initial table placements (both agents' inputs unified)
    (ontable L)
    (ontable K)

    ;; Initial stacks (unified)
    (on M L)
    (on A M)
    (on E A)
    (on N E)
    (on F N)
    (on B F)

    (on H K)
    (on C H)
    (on G C)
    (on J G)
    (on I J)
    (on D I)

    ;; Only top blocks are clear initially
    (clear B)
    (clear D)
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
    (on M N)
    (ontable N)
  ))
)