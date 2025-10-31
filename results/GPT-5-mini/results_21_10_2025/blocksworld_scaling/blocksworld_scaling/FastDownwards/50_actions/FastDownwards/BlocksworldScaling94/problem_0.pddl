; Assumptions (explicit, minimal):
; - Agents may place a moved block onto any other block that is currently clear or onto the table.
; - Creating additional table stacks is modeled by placing a block "on-table".
; - There is no explicit object for "table"; on-table is a unary predicate on blocks.
; - The conservative preferences described by the agents have been encoded as agent-specific move actions:
;   vowel actions can only affect vowel blocks; consonant actions only consonant blocks.
; - No extra blocks exist beyond the 14 named blocks.

(define (problem blocks-multiagent-initial)
  (:domain blocks-multiagent)
  (:objects
    J F D N I E A M K H C G L B - block
  )

  (:init
    ; Type classification
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

    ; Initial stacks:
    ; Stack 1 bottom->top: J, N, A, M, K, C
    (on N J)
    (on A N)
    (on M A)
    (on K M)
    (on C K)
    (on-table J)

    ; Stack 2 bottom->top: F, D, I, E, H, G, L, B
    (on D F)
    (on I D)
    (on E I)
    (on H E)
    (on G H)
    (on L G)
    (on B L)
    (on-table F)

    ; Clear (top) blocks initially are the tops of each stack: C and B
    (clear C)
    (clear B)

    ; Other blocks are not declared clear (they have something on top).
    ; Note: on-table facts are declared for bases J and F above.
  )

  (:goal (and
    ; Goal single stack bottom on table is N
    (on-table N)

    ; Final stack from bottom to top:
    ; N, M, L, K, J, I, H, G, F, E, D, C, B, A
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