(define (problem multiagent-blocks-problem-vc)
  (:domain multiagent-blocks-vowel-consonant)

  (:objects
    A B C D E F G H I J K L M - block
  )

  (:init
    ;; typing
    (is-vowel A) (is-vowel E) (is-vowel I)
    (is-consonant B) (is-consonant C) (is-consonant D)
    (is-consonant F) (is-consonant G) (is-consonant H)
    (is-consonant J) (is-consonant K) (is-consonant L) (is-consonant M)

    ;; initial stacks as given (bottom -> ... -> top)
    ;; Stack 1 on table: E -> A -> F -> K -> L -> D -> C -> J -> G
    (ontable E)
    (on A E)
    (on F A)
    (on K F)
    (on L K)
    (on D L)
    (on C D)
    (on J C)
    (on G J)

    ;; Stack 2 on table: H -> B -> I -> M
    (ontable H)
    (on B H)
    (on I B)
    (on M I)

    ;; clear (top) blocks initially
    (clear G)
    (clear M)

    ;; both agents start with empty hands
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
    (ontable M)
  ))
)