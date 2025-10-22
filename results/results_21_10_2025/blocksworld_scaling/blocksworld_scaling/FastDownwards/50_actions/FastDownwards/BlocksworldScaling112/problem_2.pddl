(define (problem stack-problem-scaling112)
  (:domain block-stacking-scaling112)
  (:objects
    vowel_agent consonant_agent orchestrator - agent
    A E I O - vowel
    B C D F G H J K L M N - consonant
  )

  (:init
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    (hand-empty vowel_agent)
    (hand-empty consonant_agent)

    (on F G)
    (on L F)
    (on A L)
    (on D A)
    (on H D)
    (on N H)
    (on C N)
    (on J C)
    (on-table G)

    (on K M)
    (on B K)
    (on E B)
    (on-table M)

    (on O I)
    (on-table I)

    (clear J)
    (clear E)
    (clear O)
  )

  (:goal (and
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
    (on-table O)
    (clear A)

    (not (on-table A))
    (not (on-table B))
    (not (on-table C))
    (not (on-table D))
    (not (on-table E))
    (not (on-table F))
    (not (on-table G))
    (not (on-table H))
    (not (on-table I))
    (not (on-table J))
    (not (on-table K))
    (not (on-table L))
    (not (on-table M))
    (not (on-table N))

    (hand-empty vowel_agent)
    (hand-empty consonant_agent)
  ))
)