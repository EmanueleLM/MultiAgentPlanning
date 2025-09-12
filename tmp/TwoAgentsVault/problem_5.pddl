(define (problem block-stacking)
  (:domain block-manipulation)

  (:objects
    agent-vowel agent-consonant - agent
    A B C O - block
  )

  (:init
    (vowel-block A)
    (vowel-block O)
    (consonant-block B)
    (consonant-block C)
    (on-table A)
    (on-table C)
    (on-table O)
    (on B A)
    (clear B)
    (clear C)
    (clear O)
  )

  (:goal (and
    (on-table A)
    (on-table B)
    (on C O)
    (on O B)
  ))
)