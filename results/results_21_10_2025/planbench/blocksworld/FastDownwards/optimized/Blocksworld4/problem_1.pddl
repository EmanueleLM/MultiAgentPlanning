(define (problem blocksworld_multiagent_problem)
  (:domain blocksworld_multiagent)

  (:objects
    A B C D E F G H I J - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; Initial stacks: B on C on D on E on F on G on H on I on J, with J on the table
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (ontable J)

    ;; A is on the table separately
    (ontable A)

    ;; Only top blocks are clear (top of stacked column is B; A is separate and clear)
    (clear A)
    (clear B)

    ;; Hands start empty
    (handempty vowel_agent)
    (handempty consonant_agent)

    ;; Agent capabilities
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
    (ontable J)
  ))
)