(define (problem blocksworld30-instance13)
  (:domain blocksworld_seq)
  (:objects A B C D E F G H I J - block)

  (:init
    ;; initial on / ontable relations
    (on A C)
    (ontable B)
    (ontable C)
    (on D B)
    (on E I)
    (on F H)
    (on G D)
    (ontable H)
    (ontable I)
    (on J E)

    ;; initial clear facts (top elements)
    (clear A)
    (clear G)
    (clear J)
    (clear F)

    ;; agent free hand
    (handempty)

    ;; sequence control: allow step 1 initially
    (allow1)
  )

  ;; The goal is to have executed all steps (allow31 becomes true).
  ;; The final arrangement is not explicitly encoded in the goal; successful achievement
  ;; of allow31 demonstrates the entire listed action sequence was executable from the
  ;; supplied initial state under the BlocksWorld rules encoded above.
  (:goal (and (allow31)))
)