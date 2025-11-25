; Assumptions:
; - There are 10 blocks in the world: yellow, red, b1..b8.
; - All blocks start on the table and are clear (no stacks initially).
; - The table is represented implicitly as the place named "table".
; - The only required terminal condition mandated by the specification is that the yellow block be on top of the red block.
; - The plan must also end with the agent's hand empty (handempty) to avoid leaving a block held.
; - No additional resources or phases are assumed beyond these objects and predicates.

(define (problem blocksworld-scaling10-problem)
  (:domain blocksworld-scaling10-domain)
  (:objects
    table - place
    yellow red b1 b2 b3 b4 b5 b6 b7 b8 - block
  )
  (:init
    ; All blocks start on the table and are clear
    (ontable yellow) (clear yellow)
    (ontable red)    (clear red)
    (ontable b1)     (clear b1)
    (ontable b2)     (clear b2)
    (ontable b3)     (clear b3)
    (ontable b4)     (clear b4)
    (ontable b5)     (clear b5)
    (ontable b6)     (clear b6)
    (ontable b7)     (clear b7)
    (ontable b8)     (clear b8)
    ; The table is treated as a place; it may be considered clear implicitly when nothing sits on it.
    ; The agent's hand is initially empty.
    (handempty)
  )
  (:goal
    (and
      (on yellow red)   ; global goal: yellow block must be on top of red block
      (handempty)       ; task-level requirement: end with hand empty
    )
  )
)