(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    A E I - block
    B C D F G H J K L - block
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    ;; block type declarations
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K) (consonant L)

    ;; agent role declarations
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    ;; both agents start with empty hands
    (handempty vowel_agent)
    (handempty consonant_agent)

    ;; Initial stacks (each list is top -> ... -> bottom on table)
    ;; Stack 1: H on B on C on E on F (F on table)
    (on H B)
    (on B C)
    (on C E)
    (on E F)
    (ontable F)

    ;; Stack 2: L on J on I (I on table)
    (on L J)
    (on J I)
    (ontable I)

    ;; Stack 3: K on D on G (G on table)
    (on K D)
    (on D G)
    (ontable G)

    ;; Stack 4: A alone on table
    (ontable A)

    ;; clear (only the top blocks of each stack are clear)
    (clear H)
    (clear L)
    (clear K)
    (clear A)
  )

  ;; Goal: L on table and then K J I H G F E D C B A stacked above in that order.
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
    (ontable L)
  ))
)