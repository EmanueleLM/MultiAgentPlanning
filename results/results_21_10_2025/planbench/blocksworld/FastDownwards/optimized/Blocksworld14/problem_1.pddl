(define (problem blocksworld_multiagent_problem)
  (:domain blocksworld_multiagent)

  (:objects
    A B C D E F G H I J K L M N - block
    table - table
  )

  (:init
    ;; Agent restrictions
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L) (consonant M) (consonant N)

    ;; initial on / ontable relations (as provided)
    (ontable L)
    (ontable K)
    (on M L)
    (on A M)
    (on H K)
    (on C H)
    (on E A)
    (on G C)
    (on J G)
    (on N E)
    (on I J)
    (on F N)
    (on D I)
    (on B F)

    ;; initial clear: tops of the two stacks are D and B
    (clear D)
    (clear B)

    ;; single hand initially empty
    (handempty)
  )

  ;; Goal: the required final single stack (A on B on C ... M on N and N on the table)
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