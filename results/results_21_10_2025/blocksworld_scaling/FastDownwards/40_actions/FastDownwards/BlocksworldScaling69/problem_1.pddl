(define (problem BlocksworldScaling69-instance)
  (:domain multiagent-blocks)
  (:objects
    vowel_agent consonant_agent orchestrator - agent
    table1 - table
    G K E H A C M L N I F B D J - block
  )

  (:init
    ;; agent roles
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    ;; agent hands empty
    (handempty vowel_agent)
    (handempty consonant_agent)
    (handempty orchestrator)

    ;; block letter type declarations
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
    (consonant M)
    (consonant N)

    ;; initial stacking: stack on G
    (on G table1)
    (on E G)
    (on M E)
    (on L M)
    (on N L)
    (on I N)
    (on D I)
    (on J D)

    ;; initial stacking: stack on K
    (on K table1)
    (on H K)
    (on A H)
    (on C A)
    (on F C)
    (on B F)

    ;; initially clear blocks (top-of-stacks)
    (clear J)
    (clear B)
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
    (on M N)
    (on N table1)
  ))
)