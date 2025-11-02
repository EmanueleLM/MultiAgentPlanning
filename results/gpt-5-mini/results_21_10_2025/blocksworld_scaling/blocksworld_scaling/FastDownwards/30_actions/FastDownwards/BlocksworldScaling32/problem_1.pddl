(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects
    A B C D E F G H I J K L M - block
  )

  ;; Initial configuration: two stacks on the table as specified.
  ;; Stack 1 bottom->top: D, F, C, H, J, I, L
  ;; Stack 2 bottom->top: E, K, M, A, G, B
  (:init
    ;; stack1 relations (bottom -> top)
    (on F D)
    (on C F)
    (on H C)
    (on J H)
    (on I J)
    (on L I)
    (on-table D)

    ;; stack2 relations (bottom -> top)
    (on K E)
    (on M K)
    (on A M)
    (on G A)
    (on B G)
    (on-table E)

    ;; clear/top facts: tops are L and B
    (clear L)
    (clear B)

    ;; vowel / consonant labelling
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
    (consonant K)
    (consonant L)
    (consonant M)
  )

  ;; Goal: single stack bottom->top: M L K J I H G F E D C B A
  ;; plus M on the table and A top (clear)
  (:goal (and
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
    (on-table M)
    (clear A)
  ))
)