(define (problem multiagent_blocks_problem)
  (:domain multiagent_blocks)
  (:objects A B C D E)
  (:init
    ;; Ownership / capability
    (vowel A)
    (vowel E)
    (consonant B)
    (consonant C)
    (consonant D)

    ;; Initial stacking configuration
    (ontable A)
    (on B C)
    (on C D)
    (on D E)
    (ontable E)

    ;; Clear tops
    (clear A)
    (clear B)

    ;; Vowel agent hand is empty at start
    (vowel_handempty)
  )
  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (ontable E)
  ))
)