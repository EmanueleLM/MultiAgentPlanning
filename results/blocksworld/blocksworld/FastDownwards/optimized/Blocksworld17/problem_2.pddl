(define (problem combined-blocksworld-problem)
  (:domain combined-blocksworld)

  (:objects
    M H G K D N A L J F C I B E O - block
  )

  (:init
    ;; Classification: which blocks each agent can move
    (vowel A) (vowel E) (vowel I) (vowel O)

    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L) (consonant M) (consonant N)

    ;; Initial stacks
    (ontable M)
    (on H M)
    (on G H)
    (on L G)
    (on B L)
    (on O B)

    (ontable K)
    (on N K)
    (on A N)
    (on J A)
    (on F J)
    (on C F)
    (on I C)
    (on E I)

    (ontable D)

    ;; clear (top) facts
    (clear O)
    (clear E)
    (clear D)

    (handempty)
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
    (ontable O)
  ))