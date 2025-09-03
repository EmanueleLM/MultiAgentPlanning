(define (problem reposition-blocks-classical)
  (:domain multi-agent-blocks-classical)
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
    (on-table C)
    (on-table O)
    (on B A)
    (step1)
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