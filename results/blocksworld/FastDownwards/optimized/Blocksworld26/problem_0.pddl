(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)
  (:objects
    A B C D E F G H I J K L M N - block
  )

  (:init
    ;; Type membership: vowel vs consonant (private capability constraints encoded as hard predicates)
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)
    (consonant H) (consonant J) (consonant K) (consonant L) (consonant M) (consonant N)

    ;; Publicly known initial conditions.
    ;; It is explicitly stated that B, G, I are initially on the table (each forms the base of a stack).
    (ontable B) (clear B)
    (ontable G) (clear G)
    (ontable I) (clear I)

    ;; To remain minimally assumptive while providing an operable problem file for FastDownward,
    ;; we place every block initially on the table and clear (14 single-block stacks).
    ;; This does not contradict the provided public information (which specifies B, G, I on table).
    (ontable A) (clear A)
    (ontable C) (clear C)
    (ontable D) (clear D)
    (ontable E) (clear E)
    (ontable F) (clear F)
    (ontable H) (clear H)
    (ontable J) (clear J)
    (ontable K) (clear K)
    (ontable L) (clear L)
    (ontable M) (clear M)
    (ontable N) (clear N)

    ;; Agents start free (can pick up one block at a time)
    (handempty-vowel)
    (handempty-consonant)
  )

  (:goal
    (and
      ;; Desired single stack from top A down to N on the table:
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
      (on M N)
      (ontable N)
    )
  )
)