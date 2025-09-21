(define (problem multiagent_stack_problem)
  (:domain multiagent_blocks)
  (:objects
    A B C D E F G H I J K L - block
    vowel_agent consonant_agent - agent
    table - object
  )
  (:init
    ;; stack initial configuration
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

    ;; clear top blocks
    (clear B)
    (clear A)
    (clear G)

    ;; block types
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

    ;; agent roles
    (vowel_agent vowel_agent)
    (consonant_agent consonant_agent)

    ;; precomputed environment constraints as predicates
    (stacks_4)
    (max_height_12)
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