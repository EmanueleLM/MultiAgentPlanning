(define (problem stacking-11blocks)
  (:domain blocks-multiagent)
  (:objects
    A B C D E F G H I J K - block
    table - support
  )

  (:init
    ;; vowel / consonant typing
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)

    ;; initial stacking: Stack1 bottom-to-top H, G, A
    (on A G)
    (on G H)
    (on H table)

    ;; Stack2 bottom-to-top K, F, D, B
    (on B D)
    (on D F)
    (on F K)
    (on K table)

    ;; Stack3: I alone on the table
    (on I table)

    ;; Stack4 bottom-to-top C, E, J
    (on J E)
    (on E C)
    (on C table)

    ;; initial clear (top blocks)
    (clear A)
    (clear B)
    (clear I)
    (clear J)

    ;; Note: supports that currently have something on them (blocks that are supporting another) are not marked clear.
    ;; The table support does not need a clear fact to allow placement to table (table accepts multiple bottom stacks).
  )

  (:goal (and
    ;; target single tower with K on the table and J on K and I on J and H on I and G on H
    ;; and F on G and E on F and D on E and C on D and B on C and A on B.
    (on K table)
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
  ))
)