(define (problem multiagent-stack-goal)
  (:domain multiagent-blocksworld)
  (:objects
    A B C D E F G H I J - block
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; agents
    (agent vowel_agent)
    (agent consonant_agent)

    ;; vowel agent move capability (only these vowel blocks)
    (can-move vowel_agent A)
    (can-move vowel_agent E)
    (can-move vowel_agent I)

    ;; which blocks are vowels
    (vowel A)
    (vowel E)
    (vowel I)

    ;; which blocks are consonants (consonant agent can move these)
    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)

    ;; initial stacks (shared view from both agents)
    ;; stack1: bottom A (on table), J on A, I on J, G on I, B on G  (B is top)
    (ontable A)
    (on J A)
    (on I J)
    (on G I)
    (on B G)

    ;; stack2: bottom C (on table), D on C  (D is top)
    (ontable C)
    (on D C)

    ;; stack3: bottom H (on table), F on H  (F is top)
    (ontable H)
    (on F H)

    ;; stack4: E on the table alone
    (ontable E)

    ;; clear (tops of stacks)
    (clear B)
    (clear D)
    (clear F)
    (clear E)
  )

  ;; goal: single stack with bottom J on table, then I H G F E D C B A on top
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