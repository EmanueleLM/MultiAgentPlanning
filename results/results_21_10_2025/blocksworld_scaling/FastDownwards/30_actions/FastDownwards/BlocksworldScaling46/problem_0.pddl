(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)
  (:objects
    A B C D E F G H I J K L table
  )
  (:init
    ;; initial: every block starts on the table and is clear
    (ontable A) (ontable B) (ontable C) (ontable D) (ontable E) (ontable F)
    (ontable G) (ontable H) (ontable I) (ontable J) (ontable K) (ontable L)

    (clear A) (clear B) (clear C) (clear D) (clear E) (clear F)
    (clear G) (clear H) (clear I) (clear J) (clear K) (clear L)

    ;; block type facts: vowels and consonants
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K) (consonant L)

    ;; both agents' hands start free
    (free-vowel-hand)
    (free-cons-hand)
  )
  (:goal
    (and
      ;; global stacking goal: build one tower A on B on C ... on L on table
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
      (ontable L)
    )
  )
)