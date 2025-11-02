; Problem: Build a single chain A on B on C ... on O on table (concretely: O on spot2).
; Notes / ambiguity resolution:
; - The human/JSON initial description supplied three stacks on a table. To enable temporary storage
;   moves during the rearrangement we introduce a set of 15 table spots (spot1..spot15). The three
;   original stacks are placed on spot1, spot2 and spot3 respectively (bottom blocks F, O, A).
; - Additional spots spot4..spot15 are initially empty and serve as temporary table positions to allow
;   single-block top moves required by the agents.
; - The final goal requires O to be on the table. We concretize this by requiring O to be on spot2
;   (the original table spot holding the O-bottom stack). This does not change the logical requirement
;   "O is on the table" while making the goal explicit for the planner.
; - Actions are named to indicate which agent may perform them: move-vowel (vowel_agent) and
;   move-consonant (consonant_agent). Only top blocks (clear) may be moved, and destinations must be clear.

(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    ; table spots (places)
    spot1 spot2 spot3 spot4 spot5 spot6 spot7 spot8 spot9 spot10 spot11 spot12 spot13 spot14 spot15 - spot

    ; blocks A..O (also places so blocks can be destinations)
    A B C D E F G H I J K L M N O - block
  )

  (:init
    ; Initial stacks as specified in the JSON:
    ; stack1 on spot1: bottom F, then J, then L (top)
    (on F spot1)
    (on J F)
    (on L J)

    ; stack2 on spot2: bottom O, then E, H, B, I, D, N, C (top)
    (on O spot2)
    (on E O)
    (on H E)
    (on B H)
    (on I B)
    (on D I)
    (on N D)
    (on C N)

    ; stack3 on spot3: bottom A, then K, M, G (top)
    (on A spot3)
    (on K A)
    (on M K)
    (on G M)

    ; Clear facts: only the top items of each stack are clear initially (no block on them).
    (clear L)
    (clear C)
    (clear G)

    ; Spots that are empty are clear; occupied spots (spot1..spot3) are not asserted clear.
    (clear spot4)
    (clear spot5)
    (clear spot6)
    (clear spot7)
    (clear spot8)
    (clear spot9)
    (clear spot10)
    (clear spot11)
    (clear spot12)
    (clear spot13)
    (clear spot14)
    (clear spot15)

    ; Vowel / Consonant classification
    (vowel A)
    (vowel E)
    (vowel I)
    (vowel O)

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
    ; Desired final relationships (A on B, B on C, ..., N on O, O on the table-spot spot2).
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
    (on O spot2)
  ))
)