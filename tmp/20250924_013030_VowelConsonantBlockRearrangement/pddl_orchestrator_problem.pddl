(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects
    A B C D E F G I - block
    vowel_agent consonant_agent - agent
  )
  (:init
    ;; stacks initial: ['D','C','B','A'] bottom->top and ['E','G','I','F']
    (on C D)
    (on B C)
    (on A B)
    (on-table D)

    (on G E)
    (on I G)
    (on F I)
    (on-table E)

    (clear A)
    (clear F)

    ;; agents empty hands initially
    (handempty vowel_agent)
    (handempty consonant_agent)

    ;; capabilities
    (vowel-capable A)
    (vowel-capable E)
    (vowel-capable I)

    (consonant-capable B)
    (consonant-capable C)
    (consonant-capable D)
    (consonant-capable F)
    (consonant-capable G)

    ;; no one is holding any block initially (absence of holding facts)

    ;; total stacks initial
    (= (total-stacks) 2)
  )

  (:goal (and
    ;; desired stacks: ['F','C','I','G'] bottom->top and ['A','B','D','E']
    ;; first stack bottom F
    (on C F)
    (on I C)
    (on G I)
    (on-table F)

    ;; second stack bottom A
    (on B A)
    (on D B)
    (on E D)
    (on-table A)

    ;; tops
    (clear G)
    (clear E)

    ;; total stacks must be 2
    (= (total-stacks) 2)
  ))
)