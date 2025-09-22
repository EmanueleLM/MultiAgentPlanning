(define (problem multiagent_blocks_problem)
  (:domain multi_agent_blocks)
  (:objects A B C D E F G H I J K L M)

  (:init
    ;; bottom-of-stack on-table facts (from both agents' initial descriptions)
    (ontable B)
    (ontable E)
    (ontable K)

    ;; stacked relations (top -> on -> below)
    (on C B)
    (on D C)
    (on H D)

    (on J E)
    (on F J)
    (on G F)
    (on L G)

    (on I K)
    (on M I)
    (on A M)

    ;; clear (top) blocks
    (clear H)
    (clear L)
    (clear A)

    ;; both agents start with empty hands (independent hands)
    (handempty-vowel)
    (handempty-consonant)

    ;; type assignments (from agents' knowledge)
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
    (consonant L)
    (consonant M)
  )

  ;; Global joint goal: stack A on B on C ... on L on M, with M on the table.
  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J K)
    (on K L)
    (on L M)
    (ontable M)
  ))
)