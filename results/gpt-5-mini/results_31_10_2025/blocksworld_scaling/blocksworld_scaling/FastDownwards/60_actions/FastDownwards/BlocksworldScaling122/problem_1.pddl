(define (problem stack-single-tower)
  (:domain multiagent-blocks)
  (:objects
    E A I - block
    F B N L G C J M D H K - block
  )

  (:init
    ;; initial on relations (from public stack descriptions)
    (on F E)
    (on J F)
    (on D J)

    (on B A)
    (on N B)

    (on I L)
    (on G I)
    (on C G)
    (on M C)
    (on H M)
    (on K H)

    ;; ontable bottoms
    (ontable E)
    (ontable A)
    (ontable L)

    ;; clear top blocks
    (clear D)
    (clear N)
    (clear K)

    ;; vowel / consonant classification (agent capability encoding)
    (vowel E)
    (vowel A)
    (vowel I)

    (consonant F)
    (consonant B)
    (consonant N)
    (consonant L)
    (consonant G)
    (consonant C)
    (consonant J)
    (consonant M)
    (consonant D)
    (consonant H)
    (consonant K)
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