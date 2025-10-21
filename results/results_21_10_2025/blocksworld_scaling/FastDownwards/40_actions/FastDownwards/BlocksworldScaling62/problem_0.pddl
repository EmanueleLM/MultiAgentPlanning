(define (problem blocks-two-agents-problem)
  (:domain blocks-two-agents)

  (:objects
    A B C D E F G H I J K L M TABLE - block
    vowel-agent consonant-agent - agent
  )

  (:init
    ;; agent capabilities
    (vowel-agent vowel-agent)
    (consonant-agent consonant-agent)

    ;; vowel / consonant classification
    (is-vowel A) (is-vowel E) (is-vowel I)
    (is-consonant B) (is-consonant C) (is-consonant D) (is-consonant F)
    (is-consonant G) (is-consonant H) (is-consonant J) (is-consonant K)
    (is-consonant L) (is-consonant M)

    ;; initial stack configuration (on top -> bottom relationships)
    ;; Stack1: D (table) <- J (top)
    (on J D)
    (on D TABLE)

    ;; Stack2: A (table, alone)
    (on A TABLE)

    ;; Stack3: F (table) <- C <- M <- G <- H <- E (top)
    (on C F)
    (on M C)
    (on G M)
    (on H G)
    (on E H)
    (on F TABLE)

    ;; Stack4: L (table) <- I <- K <- B (top)
    (on I L)
    (on K I)
    (on B K)
    (on L TABLE)

    ;; clear = top-of-stack
    (clear J)
    (clear A)
    (clear E)
    (clear B)
    ;; mark TABLE as clear (we do not change TABLE's clear in effects)
    (clear TABLE)
  )

  (:goal (and
    ;; required final tower (top -> bottom):
    ;; A on B on C on D on E on F on G on H on I on J on K on L on M on TABLE
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