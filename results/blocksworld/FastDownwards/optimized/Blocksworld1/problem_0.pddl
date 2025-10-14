(define (problem build-A-on-B-...-on-J)
  (:domain multi-agent-blocks)

  (:objects
    A B C D E F G H I J - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; Agent identification
    (is-vowel-agent vowel_agent)
    (is-consonant-agent consonant_agent)

    ;; Agent hands empty
    (handempty vowel_agent)
    (handempty consonant_agent)

    ;; Block type membership (vowel/consonant) as per agents' private constraints
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G) (consonant H) (consonant J)

    ;; Initial stacks:
    ;; Stack1: A on the table
    (ontable A)
    ;; Stack2: B on the table
    (ontable B)
    ;; Stack3: C on D on E on F on G on H on I on J on the table.
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (ontable J)

    ;; Top (clear) blocks initial: A, B, C are top blocks of their stacks
    (clear A)
    (clear B)
    (clear C)
  )

  (:goal
    (and
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
    )
  )
)