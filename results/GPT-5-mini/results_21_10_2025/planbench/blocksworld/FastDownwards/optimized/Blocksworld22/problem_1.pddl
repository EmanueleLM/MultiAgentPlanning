(define (problem multiagent-stack-goal-22)
  (:domain multiagent-blocksworld22)

  (:objects
    A B C D E F G H I J - block
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    ;; agents
    (agent vowel_agent)
    (agent consonant_agent)
    (agent orchestrator)

    ;; vowel blocks and vowel agent capability (vowel_agent can move only these)
    (vowel A)
    (vowel E)
    (vowel I)
    (can-move vowel_agent A)
    (can-move vowel_agent E)
    (can-move vowel_agent I)

    ;; consonant blocks and consonant agent capability (consonant_agent can move only these)
    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
    (can-move consonant_agent B)
    (can-move consonant_agent C)
    (can-move consonant_agent D)
    (can-move consonant_agent F)
    (can-move consonant_agent G)
    (can-move consonant_agent H)
    (can-move consonant_agent J)

    ;; initial stacks (public information)
    ;; stack1 bottom A (on table), J on A, I on J, G on I, B on G
    (ontable A)
    (on J A)
    (on I J)
    (on G I)
    (on B G)

    ;; stack2: C bottom (on table), D on C
    (ontable C)
    (on D C)

    ;; stack3: H bottom (on table), F on H
    (ontable H)
    (on F H)

    ;; stack4: E on the table alone
    (ontable E)

    ;; clear blocks (tops of stacks)
    (clear B)
    (clear D)
    (clear F)
    (clear E)
  )

  ;; Goal: single stack with bottom J on table, then I, H, G, F, E, D, C, B, A on top (A at top)
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