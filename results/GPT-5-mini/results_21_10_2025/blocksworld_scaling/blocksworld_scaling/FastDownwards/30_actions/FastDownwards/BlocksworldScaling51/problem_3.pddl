(define (problem BlocksworldScaling51-problem)
  (:domain BlocksworldScaling51)

  (:objects
    I L H J N G B D A K F E C M O - block
    table1 table2 table3 table4 table5 - loc
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    (is-vowel A) (is-vowel E) (is-vowel I) (is-vowel O)
    (is-consonant L) (is-consonant H) (is-consonant J) (is-consonant N)
    (is-consonant G) (is-consonant B) (is-consonant D) (is-consonant K)
    (is-consonant F) (is-consonant C) (is-consonant M)

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

    (on N H)
    (on K N)
    (on F K)
    (on E F)
    (on H table2)

    (clear O)
    (clear E)

    (handempty vowel_agent)
    (handempty consonant_agent)
  )

  (:goal (and
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
    (clear A)
  ))
)