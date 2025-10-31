(define (problem build-A-on-B-...-on-O)
  (:domain blocks-multiagent)
  (:objects
    A B C D E F G H I J K L M N O - block
  )
  (:init
    ;; membership
    (block A) (block B) (block C) (block D) (block E) (block F) (block G)
    (block H) (block I) (block J) (block K) (block L) (block M) (block N) (block O)

    ;; vowel / consonant typing
    (vowel A) (vowel E) (vowel I) (vowel O)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)
    (consonant H) (consonant J) (consonant K) (consonant L) (consonant M) (consonant N)

    ;; initial stacks as given:
    ;; Stack 1: G (table) <- N <- F <- B (top)
    (ontable G)
    (on N G)
    (on F N)
    (on B F)

    ;; Stack 2: M (table) <- O <- E <- I (top)
    (ontable M)
    (on O M)
    (on E O)
    (on I E)

    ;; Stack 3: K (table) <- C <- A (top)
    (ontable K)
    (on C K)
    (on A C)

    ;; Stack 4: D (table) <- L <- J <- H (top)
    (ontable D)
    (on L D)
    (on J L)
    (on H J)

    ;; clear = blocks that are top of their stacks initially
    (clear B)
    (clear I)
    (clear A)
    (clear H)

    ;; agents hands are empty initially
    (handempty-vowel)
    (handempty-consonant)
  )

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
    (on M N)
    (on N O)
    (ontable O)
  ))
)