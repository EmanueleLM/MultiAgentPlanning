(define (problem BlocksworldScaling73-problem)
  (:domain BlocksworldScaling73)
  (:objects
    D F L O G N B M K A J E I H C table
  )
  (:init
    ;; initial "on" relations (on X Y) where Y is a block or the special object table
    (on D table)
    (on C D)

    (on F table)
    (on O F)
    (on N O)
    (on J N)

    (on L table)
    (on B L)
    (on A B)
    (on E A)
    (on H E)

    (on G table)
    (on M G)
    (on K M)
    (on I K)

    ;; which blocks are clear initially (no block on top)
    (clear C)
    (clear J)
    (clear H)
    (clear I)

    ;; classification of vowels and consonants according to agents' capabilities
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
    (consonant B) ; duplicate harmless
    (consonant B) ; duplicate harmless
    (consonant B) ; ensure presence (duplicates OK in problem text)
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