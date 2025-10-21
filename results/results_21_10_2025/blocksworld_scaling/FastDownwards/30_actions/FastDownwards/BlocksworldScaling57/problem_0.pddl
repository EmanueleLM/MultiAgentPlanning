(define (problem stacking-multiagent)
  (:domain multiagent-blocksworld)
  (:objects
    I C G M B K H F O A N E J D L - block
  )
  (:init
    ;; initial on / ontable relations (bottom -> top)
    (ontable I)
    (on M I)
    (on K M)
    (on F K)

    (ontable C)
    (on G C)
    (on E G)
    (on L E)

    (ontable B)
    (on H B)
    (on O H)
    (on N O)

    (ontable A)
    (on J A)
    (on D J)

    ;; clear = top blocks
    (clear F)
    (clear L)
    (clear N)
    (clear D)

    ;; agent type predicates
    (vowel I)
    (vowel O)
    (vowel A)
    (vowel E)

    (consonant C)
    (consonant G)
    (consonant M)
    (consonant B)
    (consonant K)
    (consonant H)
    (consonant F)
    (consonant N)
    (consonant J)
    (consonant D)
    (consonant L)
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
)