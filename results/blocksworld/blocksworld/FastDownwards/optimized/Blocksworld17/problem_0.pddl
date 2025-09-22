(define (problem combined-blocksworld-problem)
  (:domain combined-blocksworld)

  (:objects
    M H G K D N A L J F C I B E O - block
  )

  (:init
    ;; Classification: which blocks each agent can move
    (vowel A) (vowel E) (vowel I) (vowel O)

    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L) (consonant M) (consonant N)

    ;; Initial stacks (converted: "on X table" -> (ontable X))
    ;; Stack 1: M (table) - H - G - L - B - O (top)
    (ontable M)
    (on H M)
    (on G H)
    (on L G)
    (on B L)
    (on O B)

    ;; Stack 2: K (table) - N - A - J - F - C - I - E (top)
    (ontable K)
    (on N K)
    (on A N)
    (on J A)
    (on F J)
    (on C F)
    (on I C)
    (on E I)

    ;; Stack 3: D (table) (single block)
    (ontable D)

    ;; clear (top) facts: only top blocks of stacks are initially clear
    (clear O)
    (clear E)
    (clear D)

    ;; consonant agent's hand state initially empty
    (handempty)
  )

  ;; Global goal: form the full target chain A on B on C ... O on table
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