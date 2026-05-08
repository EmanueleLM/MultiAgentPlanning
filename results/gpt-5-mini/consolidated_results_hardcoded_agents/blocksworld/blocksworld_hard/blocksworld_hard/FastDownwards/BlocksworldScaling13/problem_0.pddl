; Problem: build the stack red on blue on orange on yellow
; Modeling clarifications and choices:
; - The provided specification required the final ordering:
;     red on top of blue, blue on top of orange, orange on top of yellow.
;   To ensure a well-formed stack anchored to the environment and to prevent
;   interpretations where the bottom block floats, we additionally require
;   (ontable yellow) in the final goal. This is a modeling choice to make the
;   terminal configuration fully specified and planner-checkable.
; - The initial state was unspecified in the inputs. For determinism and
;   simplicity we choose the common initial condition where all blocks are
;   individually on the table and clear, and the agent's hand is empty.
;   This choice is documented here and encoded below.
(define (problem stack-red-blue-orange-yellow)
  (:domain blocksworld)
  (:objects
    red blue orange yellow - block
  )
  (:init
    ; All blocks start on the table and are clear; agent is handempty.
    (ontable red)
    (ontable blue)
    (ontable orange)
    (ontable yellow)

    (clear red)
    (clear blue)
    (clear orange)
    (clear yellow)

    (handempty)
  )

  ; Goal: red on blue, blue on orange, orange on yellow, and yellow on the table.
  (:goal (and
    (on red blue)
    (on blue orange)
    (on orange yellow)
    (ontable yellow)
  ))
)