(define (problem stack-problem-scaling112)
  (:domain block-stacking-scaling112)
  (:objects
    vowel_agent consonant_agent orchestrator - agent

    A E I O - vowel
    B C D F G H J K L M N - consonant
  )

  (:init
    ;; Agent roles
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    ;; Agents start with empty hands
    (hand-empty vowel_agent)
    (hand-empty consonant_agent)

    ;; Initial stacks (bottom -> top)
    ;; Stack1: G, F, L, A, D, H, N, C, J
    (on F G)
    (on L F)
    (on A L)
    (on D A)
    (on H D)
    (on N H)
    (on C N)
    (on J C)
    (on-table G)

    ;; Stack2: M, K, B, E
    (on K M)
    (on B K)
    (on E B)
    (on-table M)

    ;; Stack3: I, O
    (on O I)
    (on-table I)

    ;; Clear (tops)
    (clear J)
    (clear E)
    (clear O)
  )

  (:goal
    (and
      ;; Final stacking order bottom->top: O, N, M, L, K, J, I, H, G, F, E, D, C, B, A
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

      ;; Ensure no other blocks are on the table (single stack with O as sole table-bottom)
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

      ;; Agent hands must be empty at goal
      (hand-empty vowel_agent)
      (hand-empty consonant_agent)
    )
  )
)