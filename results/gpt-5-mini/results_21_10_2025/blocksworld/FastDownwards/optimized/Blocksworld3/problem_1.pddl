(define (problem multiagent_blocks_problem)
  (:domain multiagent_blocks)
  (:objects A B C D E)
  (:init
    ;; Ownership
    (vowel A)
    (vowel E)
    (consonant B)
    (consonant C)
    (consonant D)

    ;; Initial configuration: A on table; B on C on D on E; E on table
    (ontable A)
    (on B C)
    (on C D)
    (on D E)
    (ontable E)

    ;; Clear top blocks
    (clear A)
    (clear B)

    ;; Both agents start with empty hands
    (vowel_handempty)
    (consonant_handempty)
  )
  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (ontable E)
  ))
)