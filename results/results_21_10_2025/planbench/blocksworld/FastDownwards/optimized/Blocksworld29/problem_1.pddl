(define (problem Blocksworld29-problem)
  (:domain Blocksworld29)

  (:objects
    A B C D E F G H I J - block
  )

  (:init
    ;; public initial stacks:
    ;; Stack 1 on table: J <- C <- E <- H <- A  (A top)
    (ontable J)
    (on C J)
    (on E C)
    (on H E)
    (on A H)

    ;; Stack 2 on table: D <- F <- G <- B  (B top)
    (ontable D)
    (on F D)
    (on G F)
    (on B G)

    ;; I is on the table (alone)
    (ontable I)

    ;; top (clear) blocks initially
    (clear A)
    (clear B)
    (clear I)

    ;; hand is empty initially
    (handempty)

    ;; Agent capabilities (private capabilities encoded as public predicates here)
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