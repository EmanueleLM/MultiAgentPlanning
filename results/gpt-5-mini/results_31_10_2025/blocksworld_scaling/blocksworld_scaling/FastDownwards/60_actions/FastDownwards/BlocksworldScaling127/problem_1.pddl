(define (problem blocksworld-multiagent-problem)
  (:domain blocksworld-multiagent)

  (:objects
    vowel_agent_1 - vowel-agent
    consonant_agent_1 - consonant-agent

    ;; Blocks
    A B C D E F G H I J K L M - block

    ;; Table positions
    pos1 pos2 pos3 pos4 - position
  )

  (:init
    ;; agents available
    (available vowel_agent_1)
    (available consonant_agent_1)

    ;; classify vowels and consonants
    (is-vowel A)
    (is-vowel E)
    (is-vowel I)

    (is-consonant B) (is-consonant C) (is-consonant D) (is-consonant F)
    (is-consonant G) (is-consonant H) (is-consonant J) (is-consonant K)
    (is-consonant L) (is-consonant M)

    ;; Initial stacks encoded exactly as given (bottom -> top)
    ;; pos1: J, M, E, G
    (ontable J pos1)
    (on M J)
    (on E M)
    (on G E)
    (top G)

    ;; pos2: I, K, F, L
    (ontable I pos2)
    (on K I)
    (on F K)
    (on L F)
    (top L)

    ;; pos3: B, C
    (ontable B pos3)
    (on C B)
    (top C)

    ;; pos4: D, A, H
    (ontable D pos4)
    (on A D)
    (on H A)
    (top H)
  )

  ;; Global goal: final single stack (bottom-to-top) M L K J I H G F E D C B A,
  ;; with M directly on the table (ontable M ?pos). We assert the on relations
  ;; corresponding to that final ordering; the specific table position for M is
  ;; not fixed by the human specification beyond "M is on the table", so we
  ;; require M to be on the table at some position and enforce the chain above it.
  (:goal
    (and
      ;; chain from top down:
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

      ;; M must be directly on the table at some position.
      ;; Because PDDL requires ground atoms, we require M to be ontable at one of the positions.
      (or (ontable M pos1) (ontable M pos2) (ontable M pos3) (ontable M pos4))
    )
  )
)