; Problem: BlocksworldScaling51 instance encoding the initial state and the required goal
(define (problem BlocksworldScaling51-problem)
  (:domain BlocksworldScaling51)

  (:objects
    ; blocks
    I L H J N G B D A K F E C M O - block
    ; table spots (5 as specified)
    table1 table2 table3 table4 table5 - loc
    ; agents
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    ; Agent role markers
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    ; Classification of vowels and consonants
    (is-vowel A) (is-vowel E) (is-vowel I) (is-vowel O)
    (is-consonant L) (is-consonant H) (is-consonant J) (is-consonant N)
    (is-consonant G) (is-consonant B) (is-consonant D) (is-consonant K)
    (is-consonant F) (is-consonant C) (is-consonant M)

    ; Initial stacking (as given in the specification):
    ; Stack rooted at I on table1: I - L - J - G - B - D - A - C - M - O (O top)
    (on L I)
    (on J L)
    (on G J)
    (on B G)
    (on D B)
    (on A D)
    (on C A)
    (on M C)
    (on O M)
    (on I table1)

    ; Stack rooted at H on table2: H - N - K - F - E (E top)
    (on N H)
    (on K N)
    (on F K)
    (on E F)
    (on H table2)

    ; Top-of-stack blocks initially
    (clear O)
    (clear E)

    ; Agents start empty-handed
    (handempty vowel_agent)
    (handempty consonant_agent)
  )

  (:goal (and
    ; Goal tower: bottom table1 -> O -> N -> M -> L -> K -> J -> I -> H -> G -> F -> E -> D -> C -> B -> A (A top)
    (on O table1)
    (on N O)
    (on M N)
    (on L M)
    (on K L)
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
    ; Make explicit that A is top
    (clear A)
  ))

  ; No metric specified.
)