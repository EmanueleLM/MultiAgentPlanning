(define (problem BlocksworldScaling137-problem)
  (:domain blocksworld-multiagent)
  (:objects
    ;; blocks
    A B C D E F G H I J K - block

    ;; agents
    vowel_agent1 - vowel_agent
    consonant_agent1 - consonant_agent

    ;; two table spots (capacity = 2)
    table1 table2 - table
  )

  (:init
    ;; block label classification
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

    ;; initial stacks: we represent bottoms by ontable <bottom> <table>
    ;; Stack1 bottom E -> F -> G -> K -> J -> D top
    (ontable E table1)
    (on F E)
    (on G F)
    (on K G)
    (on J K)
    (on D J)

    ;; Stack2 bottom I -> H -> C -> B -> A top
    (ontable I table2)
    (on H I)
    (on C H)
    (on B C)
    (on A B)

    ;; tops are clear
    (clear D)
    (clear A)

    ;; both table spots are occupied initially (E on table1, I on table2), so no free-table facts

    ;; agents free-handed initially
    (handempty vowel_agent1)
    (handempty consonant_agent1)
  )

  ;; Goal: single stack (bottom to top): K, J, I, H, G, F, E, D, C, B, A
  (:goal (and
    (ontable K table1)           ;; K on some table spot; choose table1 for the goal
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