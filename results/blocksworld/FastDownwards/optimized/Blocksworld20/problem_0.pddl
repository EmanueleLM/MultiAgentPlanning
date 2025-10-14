(define (problem stack15-multiagent)
  (:domain multiagent_blocks)

  (:objects
    A B C D E F G H I J K L M N O - block
  )

  (:init
    ; initial on relations (two stacks)
    (ontable E)
    (ontable O)

    (on F O)
    (on B F)
    (on C B)
    (on I C)
    (on D I)
    (on H D)
    (on L H)
    (on J L)

    (on M E)
    (on N M)
    (on K N)
    (on A K)
    (on G A)

    ; clear = top blocks
    (clear J)
    (clear G)

    ; agent capability predicates (private capabilities encoded as facts)
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
    (ontable O)
  ))
)