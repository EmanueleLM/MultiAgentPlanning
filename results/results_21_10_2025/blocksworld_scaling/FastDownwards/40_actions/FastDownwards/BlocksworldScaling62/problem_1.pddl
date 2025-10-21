(define (problem blocksworld-two-agents-problem)
  (:domain blocksworld-two-agents)

  (:objects
    A B C D E F G H I J K L M TABLE - block
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    ;; agent roles
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    ;; vowel / consonant classification
    (is-vowel A) (is-vowel E) (is-vowel I)
    (is-consonant B) (is-consonant C) (is-consonant D) (is-consonant F)
    (is-consonant G) (is-consonant H) (is-consonant J) (is-consonant K)
    (is-consonant L) (is-consonant M)

    ;; initial stack configuration (on relationships)
    ;; Stack1: D on TABLE, J on D
    (on D TABLE)
    (on J D)

    ;; Stack2: A on TABLE
    (on A TABLE)

    ;; Stack3: F on TABLE, C on F, M on C, G on M, H on G, E on H
    (on F TABLE)
    (on C F)
    (on M C)
    (on G M)
    (on H G)
    (on E H)

    ;; Stack4: L on TABLE, I on L, K on I, B on K
    (on L TABLE)
    (on I L)
    (on K I)
    (on B K)

    ;; clear = top-of-stack
    (clear J)
    (clear A)
    (clear E)
    (clear B)
    ;; TABLE is treated as always available as a placement; mark it clear
    (clear TABLE)
  )

  (:goal (and
    ;; final single tower (top -> bottom): A on B on C on D on E on F on G on H on I on J on K on L on M on TABLE
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
    (on M TABLE)
  ))
)