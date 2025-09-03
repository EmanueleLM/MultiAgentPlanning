```pddl
(define (problem reposition-blocks-adapted)
  (:domain multi-agent-blocks-adapted)
  
  (:objects
    A B C O - block
  )
  
  (:init
    (vowel A)
    (vowel O)
    (consonant B)
    (consonant C)
    (clear B)
    (clear C)
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
```