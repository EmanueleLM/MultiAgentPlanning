; Problem: combine the two stacks into a single tower
; See domain comments for assumptions and rationale for chosen goal ordering.
(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)

  (:objects
    ; blocks
    I L H J N G B D A K F E C M O - block
    ; table location
    table - loc
    ; agents
    vowel_agent consonant_agent - agent
  )

  (:init
    ; Classification of vowels and consonants (explicit)
    (is-vowel A) (is-vowel E) (is-vowel I) (is-vowel O)
    (is-consonant L) (is-consonant H) (is-consonant J) (is-consonant N)
    (is-consonant G) (is-consonant B) (is-consonant D) (is-consonant K)
    (is-consonant F) (is-consonant C) (is-consonant M)

    ; Initial stacking described in the global public information:
    ; Stack rooted at I: I - L - J - G - B - D - A - C - M - O (I base on table, O top)
    (on L I)
    (on J L)
    (on G J)
    (on B G)
    (on D B)
    (on A D)
    (on C A)
    (on M C)
    (on O M)
    (on I table)

    ; Stack rooted at H: H - N - K - F - E (H base on table, E top)
    (on N H)
    (on K N)
    (on F K)
    (on E F)
    (on H table)

    ; Clear (top) blocks: O and E are top-of-stack initially
    (clear O)
    (clear E)

    ; All other blocks that have something on them are not clear by omission
    ; Agents start empty-handed
    (handempty vowel_agent)
    (handempty consonant_agent)
  )

  (:goal (and
    ; The target single tower (bottom to top):
    ; I L J G B D A C M O H N K F E
    ; Represented by on relations and I on table.
    (on L I)
    (on J L)
    (on G J)
    (on B G)
    (on D B)
    (on A D)
    (on C A)
    (on M C)
    (on O M)
    (on H O)
    (on N H)
    (on K N)
    (on F K)
    (on E F)
    (on I table)
    ; top-of-stack is E
    (clear E)
  ))

  ; No metric specified; standard satisfaction planning task for FastDownward.
)