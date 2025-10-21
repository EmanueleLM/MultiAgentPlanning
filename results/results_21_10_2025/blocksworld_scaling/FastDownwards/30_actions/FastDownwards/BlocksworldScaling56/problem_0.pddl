(define (problem blocks-vc-problem)
  (:domain blocks-vowel-consonant)

  ;; Objects: vowels and consonants (only the labels provided by the agents)
  (:objects
    A E I - vowel
    B C D F G H J K L M N - consonant
  )

  ;; Initial state:
  ;; Stacks described (top-to-bottom):
  ;; Stack1: [B, A]      => B on A; A on table
  ;; Stack2: [E]         => E on table
  ;; Stack3: [C, I, D]   => C on I; I on D; D on table
  ;; Stack4..11: [F], [G], [H], [J], [K], [L], [M], [N] => each on table
  (:init
    ;; on relations
    (on B A)
    (on C I)
    (on I D)

    ;; ontable relations (bottom elements)
    (ontable A)
    (ontable D)
    (ontable E)
    (ontable F)
    (ontable G)
    (ontable H)
    (ontable J)
    (ontable K)
    (ontable L)
    (ontable M)
    (ontable N)

    ;; clear / top: true for top blocks of each stack
    (clear B)
    (top B)

    (clear E)
    (top E)

    (clear C)
    (top C)

    (clear F)
    (top F)

    (clear G)
    (top G)

    (clear H)
    (top H)

    (clear J)
    (top J)

    (clear K)
    (top K)

    (clear L)
    (top L)

    (clear M)
    (top M)

    (clear N)
    (top N)

    ;; Blocks that are not clear/top are A, I, D (they have blocks above them)
    ;; (These are simply not listed as clear/top)
  )

  ;; Goal:
  ;; All vowel blocks A, E, I must be top-of-stack (clear / top)
  ;; (This enforces the hard constraint that vowels must end up accessible on top.)
  (:goal (and
    (top A)
    (top E)
    (top I)
  ))
)