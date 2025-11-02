(define (problem blocks-agents-problem)
  (:domain blocks-agents)
  (:objects
    vowel_agent_1 - vowel-agent
    consonant_agent_1 - consonant-agent

    ; Blocks
    A B C D E F G H I J K L M - block

    ; Table positions
    pos1 pos2 pos3 pos4 - position
  )

  (:init
    ;; Vowel / consonant classification
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L) (consonant M)

    ;; Initial stacks (from bottom -> top):
    ;; pos1: J, M, E, G  (G top)
    (ontable J pos1)
    (on M J)
    (on E M)
    (on G E)
    (top G)

    ;; pos2: I, K, F, L  (L top)
    (ontable I pos2)
    (on K I)
    (on F K)
    (on L F)
    (top L)

    ;; pos3: B, C  (C top)
    (ontable B pos3)
    (on C B)
    (top C)

    ;; pos4: D, A, H  (H top)
    (ontable D pos4)
    (on A D)
    (on H A)
    (top H)
  )

  ;; Global goal:
  ;; Expose all vowel blocks so each vowel is the top block of its stack:
  ;; A, E, and I must be top.
  (:goal (and
    (top A)
    (top E)
    (top I)
  ))
)