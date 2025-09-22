(define (problem multiagent_stack_problem)
  (:domain multiagent_blocks)
  (:objects
    A B C D E F G H I J K L table
  )

  (:init
    ;; Initial placement (unified from both agents; table represented explicitly)
    (on I table)
    (on E I)
    (on J E)
    (on F J)
    (on L F)
    (on B L)

    (on D table)
    (on K D)
    (on H K)
    (on A H)

    (on C table)
    (on G C)

    ;; clear/top blocks initially
    (clear B)
    (clear A)
    (clear G)

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
    (consonant K)
    (consonant L)
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
    (on J K)
    (on K L)
    (on L table)
  ))
)