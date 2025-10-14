(define (problem stack-goal)
  (:domain blocks-multiagent)

  (:objects
    vowel_agent consonant_agent - agent
    A B C D E F G H I J K L - block
  )

  (:init
    ; initial on / ontable relations (as provided)
    (ontable I)
    (ontable B)
    (ontable J)

    (on L I)
    (on A B)
    (on F L)
    (on H A)
    (on D H)
    (on G F)
    (on C G)
    (on E D)
    (on K E)

    ; clear = top of each stack (computed from initial stacks)
    (clear C)
    (clear K)
    (clear J)

    ; agent permissions encoded as hard constraints (vowel vs consonant)
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
    (consonant K)
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
    (ontable L)
  ))
)