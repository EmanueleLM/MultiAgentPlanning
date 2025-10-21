(define (problem blocks-stack)
  (:domain blocks-multiagent)

  (:objects
    A B C D E F G H I J K L M N O - block
    table - place
  )

  (:init
    ; Initial on relationships (exactly as provided)
    (on I table)
    (on C I)
    (on H C)

    (on N table)
    (on O N)
    (on L O)

    (on E table)
    (on F E)
    (on G F)
    (on B G)
    (on M B)

    (on D table)
    (on J D)
    (on K J)
    (on A K)

    ; Top-of-stack (clear) facts initially (blocks that have no block on top)
    (clear A)
    (clear L)
    (clear M)
    (clear H)

    ; Letter capability predicates
    (vowel A)
    (vowel E)
    (vowel I)
    (vowel O)

    (consonant N)
    (consonant D)
    (consonant F)
    (consonant J)
    (consonant G)
    (consonant K)
    (consonant L)
    (consonant C)
    (consonant B)
    (consonant H)
    (consonant M)
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
    (on N O)
    (on O table)
  ))
)