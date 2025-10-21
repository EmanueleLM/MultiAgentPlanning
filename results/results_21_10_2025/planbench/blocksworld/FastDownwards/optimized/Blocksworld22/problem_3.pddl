(define (problem multiagent-stack-goal-22)
  (:domain multiagent-blocksworld22)

  (:objects
    A B C D E F G H I J - block
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    ;; agents
    (is-agent vowel_agent)
    (is-agent consonant_agent)
    (is-agent orchestrator)

    ;; agent movement capabilities (vowels vs consonants)
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

    (can-move vowel_agent A)
    (can-move vowel_agent E)
    (can-move vowel_agent I)

    (can-move consonant_agent B)
    (can-move consonant_agent C)
    (can-move consonant_agent D)
    (can-move consonant_agent F)
    (can-move consonant_agent G)
    (can-move consonant_agent H)
    (can-move consonant_agent J)

    ;; initial stacks (stack1: bottom A, then J, I, G, B)
    (ontable A)
    (on J A)
    (on I J)
    (on G I)
    (on B G)

    ;; stack2: bottom C with D on C
    (ontable C)
    (on D C)

    ;; stack3: bottom H with F on H
    (ontable H)
    (on F H)

    ;; stack4: E on table alone
    (ontable E)

    ;; hand status: agents start with empty hands
    (handempty vowel_agent)
    (handempty consonant_agent)
    (handempty orchestrator)

    ;; clear blocks: tops of stacks
    (clear B)
    (clear D)
    (clear F)
    (clear E)
  )

  (:goal (and
    (ontable J)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
  ))
)