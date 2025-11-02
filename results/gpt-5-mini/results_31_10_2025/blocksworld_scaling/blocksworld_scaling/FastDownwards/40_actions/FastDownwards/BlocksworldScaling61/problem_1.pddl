(define (problem BlocksworldScaling61-problem)
  (:domain blocksworld-multiagent)

  (:objects
    table - place
    vowel_agent consonant_agent orchestrator - agent
    K A L M C G D E J H F I B - block
  )

  (:init
    ;; initial stacks (on relations)
    (on K table)
    (on M K)
    (on G M)
    (on I G)
    (on B I)

    (on A table)
    (on L A)
    (on C L)
    (on D C)
    (on E D)
    (on J E)
    (on H J)
    (on F H)

    ;; only top blocks are clear initially
    (clear B)
    (clear F)

    ;; agents are initially handempty
    (handempty vowel_agent)
    (handempty consonant_agent)

    ;; agent role markers
    (v-agent vowel_agent)
    (c-agent consonant_agent)

    ;; block classifications
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant K)
    (consonant L)
    (consonant M)
    (consonant C)
    (consonant G)
    (consonant D)
    (consonant J)
    (consonant H)
    (consonant F)
    (consonant B)
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
    (on L M)
    (on M table)
  ))
)