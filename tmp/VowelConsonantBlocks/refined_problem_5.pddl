(define (problem reposition-blocks)
  (:domain multi-agent-blocks)
  (:objects
    A B C O - block
  )
  (:init
    (vowel A)
    (consonant B)
    (consonant C)
    (vowel O)
    (clear B)
    (clear C)
    (clear O)
    (on-table A)
    (on B A)
    (on-table C)
    (on-table O)
  )
  (:goal
    (and
      (on-table A)
      (on-table B)
      (on C O)
      (on O B)
    )
  )
)