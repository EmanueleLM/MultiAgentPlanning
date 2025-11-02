; Problem: Build a single chain A on B on C ... on O on table.
; Ambiguity resolution (documented):
; - The input did not include an explicit initial stack configuration. To produce a runnable FastDownward problem
;   we resolve this by placing every block A..O on its own distinct table spot (spot1..spot15). This respects the
;   agents' assumption that table spots exist and (per the vowel agent) that there are at least as many table spots
;   as needed. There are therefore 15 table spots and each initially contains exactly one block.
; - Table spots are represented as place objects spot1..spot15. Blocks are typed as block and also are places
;   (so blocks can serve as destinations for other blocks).
; - All natural-language preferences in the agents' descriptions are encoded as hard constraints (e.g., only vowels
;   can be moved by move-vowel and only consonants by move-consonant; only top blocks can be moved).
; - The goal requires O to end up on a specific table spot (spot15). This choice is arbitrary but concrete so the
;   goal is fully specified for the planner.

(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    ; table spots (places)
    spot1 spot2 spot3 spot4 spot5 spot6 spot7 spot8 spot9 spot10 spot11 spot12 spot13 spot14 spot15 - place

    ; blocks A..O (block is subtype of place)
    A B C D E F G H I J K L M N O - block
  )

  (:init
    ; Initial configuration: every block on its own distinct table spot (top→bottom is just the single block).
    (on A spot1)
    (on B spot2)
    (on C spot3)
    (on D spot4)
    (on E spot5)
    (on F spot6)
    (on G spot7)
    (on H spot8)
    (on I spot9)
    (on J spot10)
    (on K spot11)
    (on L spot12)
    (on M spot13)
    (on N spot14)
    (on O spot15)

    ; Every block is initially clear (no block on top of them).
    (clear A)
    (clear B)
    (clear C)
    (clear D)
    (clear E)
    (clear F)
    (clear G)
    (clear H)
    (clear I)
    (clear J)
    (clear K)
    (clear L)
    (clear M)
    (clear N)
    (clear O)

    ; Table spots that currently have a block on them are not asserted clear (closed-world: they are treated as occupied).
    ; (If the planner expects explicit negative facts for table-spot occupancy, absence of (clear spotX) is sufficient.)

    ; Vowel / Consonant classification (per the Vowel agent assumptions)
    (vowel A)
    (vowel E)
    (vowel I)
    (vowel O)
    ; Note: U is a vowel per the Vowel agent but is not present among blocks here.

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
    (consonant N)
  )

  (:goal (and
    ; Desired final relationships (A on B, B on C, ..., N on O, O on table-spot spot15).
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
    (on O spot15)
  ))
)