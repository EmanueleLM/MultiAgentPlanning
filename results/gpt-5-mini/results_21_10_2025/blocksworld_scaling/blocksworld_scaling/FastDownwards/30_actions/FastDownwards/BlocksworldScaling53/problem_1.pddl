(define (problem BlocksworldScaling53-instance)
  (:domain blocks-multiagent)

  (:objects
    A B C D E F G H I J K L M N O - block
    table - place
  )

  (:init
    ;; Initial on relationships (as specified)
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

    ;; Initially clear (top blocks of each stack)
    (clear A)
    (clear L)
    (clear M)
    (clear H)

    ;; Letter capability classification
    (vowel A)
    (vowel E)
    (vowel I)
    (vowel O)

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