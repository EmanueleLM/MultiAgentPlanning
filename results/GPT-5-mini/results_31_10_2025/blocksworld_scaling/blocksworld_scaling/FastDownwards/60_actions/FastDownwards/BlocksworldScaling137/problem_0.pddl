(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)
  (:objects
    A B C D E F G H I J K - block
    vowel_agent1 - vowel_agent
    consonant_agent1 - consonant_agent
  )

  (:init
    ;; Block type annotations (unary predicates to indicate which agent may move them)
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

    ;; Initial stacks:
    ;; Stack1 bottom E -> F -> G -> K -> J -> D top
    (ontable E)
    (on F E)
    (on G F)
    (on K G)
    (on J K)
    (on D J)

    ;; Stack2 bottom I -> H -> C -> B -> A top
    (ontable I)
    (on H I)
    (on C H)
    (on B C)
    (on A B)

    ;; Clear (tops of stacks)
    (clear D)
    (clear A)

    ;; Agents are initially free-handed
    (handempty vowel_agent1)
    (handempty consonant_agent1)
  )

  (:goal (and
    ;; Desired single stack (from bottom to top): K, J, I, H, G, F, E, D, C, B, A
    (ontable K)
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
  ))
)