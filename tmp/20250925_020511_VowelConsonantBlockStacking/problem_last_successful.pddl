(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    A B C D E F G I - block
    slot1 slot2 slot3 - slot
    vowel_agent consonant_agent - agent
  )

  (:init
    ;; agent hands start empty
    (handempty vowel_agent)
    (handempty consonant_agent)

    ;; mark which agent is vowel/consonant
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    ;; block classifications
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)

    ;; initial stacks mapped to slots (bottom -> ... -> top)
    ;; stack1: ['D', 'C', 'B', 'A'] (D bottom on slot1, then C on D, B on C, A on B)
    (on D slot1)
    (on C D)
    (on B C)
    (on A B)

    ;; stack2: ['E', 'G', 'I', 'F'] (E bottom on slot2, then G on E, I on G, F on I)
    (on E slot2)
    (on G E)
    (on I G)
    (on F I)

    ;; top clear blocks
    (clear A)
    (clear F)

    ;; free slot(s) available (max_stacks = 3)
    (free-slot slot3)
  )

  ;; Goal: exactly the two goal stacks present on the table and no extra stacks (slot3 free)
  ;; goal_stack1: ['F','C','I','G'] bottom F then C on F then I on C then G on I
  ;; goal_stack2: ['A','B','D','E'] bottom A then B on A then D on B then E on D
  (:goal (and
    ;; stack 1 on slot1
    (on F slot1)
    (on C F)
    (on I C)
    (on G I)

    ;; stack 2 on slot2
    (on A slot2)
    (on B A)
    (on D B)
    (on E D)

    ;; ensure maximum stacks invariant: only two stacks present => slot3 remains free
    (free-slot slot3)
  )))