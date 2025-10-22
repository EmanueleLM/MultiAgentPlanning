; Problem: orchestrator-instance
; Assumptions repeated briefly:
; - Table is unbounded; on-table facts indicate blocks directly on table.
; - Vowels are forbidden from being placed onto consonants unless that consonant is marked (settled).
; - final relations indicate the required final support for consonant settle actions.
(define (problem blocks-orch-prob)
  (:domain blocks-orch)

  (:objects
    K D F M A B L C G I H E J - block
  )

  (:init
    ; Initial stacks (bottom -> ... -> top):
    ; Stack 1: K -> D -> F -> E -> J
    (on D K)
    (on F D)
    (on E F)
    (on J E)
    (on-table K)

    ; Stack 2: M -> L -> G
    (on L M)
    (on G L)
    (on-table M)

    ; Stack 3: A -> B
    (on B A)
    (on-table A)

    ; Stack 4: C -> I -> H
    (on I C)
    (on H I)
    (on-table C)

    ; Top facts (top blocks of each stack)
    (top J)
    (top G)
    (top B)
    (top H)

    ; Vowel / consonant classification
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant K)
    (consonant D)
    (consonant F)
    (consonant M)
    (consonant B)
    (consonant L)
    (consonant C)
    (consonant G)
    (consonant H)
    (consonant J)

    ; Initial settled flags
    ; M is already in its final place (on-table) and is considered settled initially.
    (settled M)

    ; Final-support facts (for settle action):
    ; These state where the consonant must be to be considered settled.
    (final L M)
    (final K L)
    (final J K)
    (final H I)  ; H's final support is vowel I
    (final G H)
    (final F G)
    (final D E)  ; D's final support is vowel E
    (final C D)
    (final B C)
    ; Note: M's final support is the table; M is pre-settled and does not have a final fact here.
  )

  (:goal (and
    ; Final stack bottom->top: M, L, K, J, I, H, G, F, E, D, C, B, A
    (on-table M)
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
    ; ensure A is the top block in final configuration
    (top A)
  ))
)