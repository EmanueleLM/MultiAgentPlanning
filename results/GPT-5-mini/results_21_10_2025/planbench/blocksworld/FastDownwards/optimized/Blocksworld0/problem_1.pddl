(define (problem multiagent_blocks_problem)
  (:domain multiagent_blocks)
  (:objects
    A B C D E F G H I J - block
  )

  (:init
    ;; initial table placements
    (ontable A)
    (ontable B)
    (ontable J)

    ;; stacked relations for the tall stack: C on D on E on F on G on H on I on J (J on table)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)

    ;; clear facts (top blocks of each initial stack)
    (clear A)
    (clear B)
    (clear C)

    ;; agent movement permissions (labels)
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

  ;; Global goal: reconfigure into the full tower A on B on C on D on E on F on G on H on I on J, with J on table.
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