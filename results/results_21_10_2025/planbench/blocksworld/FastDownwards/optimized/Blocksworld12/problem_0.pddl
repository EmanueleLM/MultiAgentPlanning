(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)
  (:objects
    A B C D E F G H I J table - obj
    vowel_agent consonant_agent - agent
  )
  (:init
    ;; agent permissions (as provided by the second agent)
    (canmove consonant_agent B)
    (canmove consonant_agent C)
    (canmove consonant_agent D)
    (canmove consonant_agent F)
    (canmove consonant_agent G)
    (canmove consonant_agent H)
    (canmove consonant_agent J)

    (canmove vowel_agent A)
    (canmove vowel_agent E)
    (canmove vowel_agent I)

    ;; vowel / consonant classification (as provided by the first agent)
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant H)
    (consonant D)
    (consonant J)
    (consonant F)
    (consonant G)
    (consonant C)
    (consonant B)

    ;; initial stacks (both agents described the same physical layout)
    (on H table)
    (on D H)
    (on A D)
    (on C A)

    (on J table)
    (on E J)
    (on F E)
    (on I F)
    (on G I)
    (on B G)

    ;; clear: tops of each stack
    (clear C)
    (clear B)
    ;; Note: table is used as support for multiple stacks; we do not model it with a single clear predicate here.

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
    (on J table)
  ))
)