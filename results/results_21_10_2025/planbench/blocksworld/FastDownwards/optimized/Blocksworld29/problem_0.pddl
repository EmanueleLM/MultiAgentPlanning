(define (problem multiagent-rearrange)
  (:domain multiagent-blocks)

  (:objects A B C D E F G H I J - block)

  (:init
    ;; Initial stacks (public information)
    ;; Stack 1 on table: J <- C <- E <- H <- A  (A is top)
    (ontable J)
    (on C J)
    (on E C)
    (on H E)
    (on A H)

    ;; Stack 2 on table: D <- F <- G <- B  (B is top)
    (ontable D)
    (on F D)
    (on G F)
    (on B G)

    ;; I is on the table (alone)
    (ontable I)

    ;; Initially clear (top) blocks
    (clear A)
    (clear B)
    (clear I)

    ;; Agent capabilities (private capabilities encoded in the shared problem)
    ;; Vowel agent can move these blocks:
    (vowel A)
    (vowel E)
    (vowel I)

    ;; Consonant agent can move these blocks:
    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
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
    (ontable J)
  ))
)