(define (problem multiagent_blocks_problem)
  (:domain multiagent_blocks)
  (:objects
    A B C D E F G H I J - block
  )

  (:init
    ;; table placements (as given by agents)
    (ontable A)
    (ontable B)
    (ontable J)

    ;; stacked relations for the tall stack: C on D on E on F on G on H on I on J
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)

    ;; clear facts (top blocks of each stack)
    (clear A)
    (clear B)
    (clear C)

    ;; agent permissions (do not invent movement authority beyond provided data)
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

  ;; Global goal: full tower A on B on C on D on E on F on G on H on I on J (J on table)
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