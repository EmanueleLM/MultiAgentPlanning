(define (problem combined-blocks-problem)
  (:domain combined-blocks)

  (:objects
    vowel_agent consonant_agent table
    M H G K D N A L J F C I B E O
  )

  (:init
    (is-vowel-agent vowel_agent)
    (is-consonant-agent consonant_agent)

    (vowel A) (vowel E) (vowel I) (vowel O)

    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L) (consonant M) (consonant N)

    (on M table)
    (on H M)
    (on G H)
    (on L G)
    (on B L)
    (on O B)

    (on K table)
    (on N K)
    (on A N)
    (on J A)
    (on F J)
    (on C F)
    (on I C)
    (on E I)

    (on D table)

    (clear O)
    (clear E)
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
    (on N O)
    (on O table)
  ))
)