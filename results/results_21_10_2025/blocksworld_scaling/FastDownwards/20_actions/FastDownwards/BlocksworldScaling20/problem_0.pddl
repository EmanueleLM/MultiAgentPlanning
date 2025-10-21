(define (problem blocks_multiagent_problem)
  (:domain blocks_multiagent)
  (:objects
    A B C D E F G H I J K L M N O - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; agent declarations
    (agent vowel_agent)
    (agent consonant_agent)

    ;; static type-like facts
    (vowel A)
    (vowel E)
    (vowel I)
    (vowel O)

    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
    (consonant K)
    (consonant L)
    (consonant M)
    (consonant N)

    ;; initial stacks (on / ontable)
    (ontable N)
    (on E N)
    (on A E)
    (on M A)
    (on I M)
    (on O I)

    (ontable G)
    (on F G)
    (on L F)
    (on J L)

    (ontable B)
    (on K B)

    (ontable C)
    (on D C)
    (on H D)

    ;; top-of-stack (clear) facts initial
    (clear O)
    (clear J)
    (clear K)
    (clear H)

    ;; agents' hands empty
    (handempty vowel_agent)
    (handempty consonant_agent)
  )

  (:goal (and
    ;; final single stack bottom-up: O on table, then N on O, ...
    (ontable O)
    (on N O)
    (on M N)
    (on L M)
    (on K L)
    (on J K)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
    ;; A should be the top (clear)
    (clear A)
  ))
)