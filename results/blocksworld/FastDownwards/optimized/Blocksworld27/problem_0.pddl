(define (problem multi_agent_problem)
  (:domain multi_agent_blocks)

  (:objects
    A B C D E F G H I J K - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; initial on/on-table relations (from provided stacks)
    (ontable B)
    (ontable G)
    (ontable E)

    (on J G)
    (on A J)
    (on C A)
    (on I C)
    (on F I)
    (on D F)

    (on K B)
    (on H K)

    ;; clear blocks = top of each stack
    (clear H)
    (clear D)
    (clear E)

    ;; typing of blocks as vowel or consonant (per agent constraints)
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

    ;; agent role markers
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    ;; both agents start free (can move one block at a time; handempty enforces single-held)
    (handempty vowel_agent)
    (handempty consonant_agent)
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
    (ontable K)
  ))
)