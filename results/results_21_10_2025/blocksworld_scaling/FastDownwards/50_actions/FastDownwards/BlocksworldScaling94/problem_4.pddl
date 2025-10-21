; Minimal explicit assumptions (conservative):
; - Blocks may be moved onto any block that is currently (clear) or onto the table.
; - The "table" is represented by the unary predicate (on-table ?b).
; - Multiple table stacks are allowed temporarily; the global goal requires a single final stack as specified.
; - Agents are distinguished only by action schemas: vowel-agent actions include (vowel ?b) precondition; consonant-agent actions include (consonant ?b).
; - No blocks exist beyond the 14 named objects.

(define (problem blocks-multiagent-initial)
  (:domain blocks-multiagent)
  (:objects
    J F D N I E A M K H C G L B - block
  )

  (:init
    ;; Type classification
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant J)
    (consonant F)
    (consonant D)
    (consonant N)
    (consonant M)
    (consonant K)
    (consonant H)
    (consonant C)
    (consonant G)
    (consonant L)
    (consonant B)

    ;; Initial stacks:
    ;; Stack 1 bottom->top: J, N, A, M, K, C
    (on N J)
    (on A N)
    (on M A)
    (on K M)
    (on C K)
    (on-table J)

    ;; Stack 2 bottom->top: F, D, I, E, H, G, L, B
    (on D F)
    (on I D)
    (on E I)
    (on H E)
    (on G H)
    (on L G)
    (on B L)
    (on-table F)

    ;; Initially clear (top) blocks
    (clear C)
    (clear B)
  )

  (:goal (and
    ;; Goal single stack bottom on table is N
    (on-table N)

    ;; Final stack from bottom to top:
    ;; N, M, L, K, J, I, H, G, F, E, D, C, B, A
    (on M N)
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
  ))
)