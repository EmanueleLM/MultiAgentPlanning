(define (problem blocks-problem)
  (:domain blocks-multiagent)

  ; Objects: the twelve uniquely labelled blocks
  (:objects
    A B C D E F G H I J K L - block
  )

  ; Initial state
  (:init
    ; Static capability partitioning (hard constraints).
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K) (consonant L)

    ; Assumption due to missing explicit initial stacks:
    ; place every block as a single-block stack on the table and mark them clear.
    (ontable A) (clear A)
    (ontable B) (clear B)
    (ontable C) (clear C)
    (ontable D) (clear D)
    (ontable E) (clear E)
    (ontable F) (clear F)
    (ontable G) (clear G)
    (ontable H) (clear H)
    (ontable I) (clear I)
    (ontable J) (clear J)
    (ontable K) (clear K)
    (ontable L) (clear L)
  )

  ; Goal: single stack with L on table and K J I H G F E D C B A above (A at top)
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
    (ontable L)
  ))

)