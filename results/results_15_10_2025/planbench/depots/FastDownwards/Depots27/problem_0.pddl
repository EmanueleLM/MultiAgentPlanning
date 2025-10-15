(define (problem scenario1)
  (:domain orchestrated)
  (:objects o1 o2 o3 - obj)
  (:init
    ;; initial facts for scenario 1
    (hand o1 o2)
    (cats o2 o3)
    (texture o3 o1)
    ;; other predicates left false by omission
  )
  (:goal (and
    ;; goals for scenario 1 (reflecting use-case block 1)
    (next o1 o3)
    (vase o2 o3)
  ))
)