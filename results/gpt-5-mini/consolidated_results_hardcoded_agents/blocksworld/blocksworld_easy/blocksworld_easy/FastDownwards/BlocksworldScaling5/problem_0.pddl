(define (problem place-blue-on-orange)
  (:domain blocksworld-manipulator)
  (:objects
    blue orange red yellow - block
    table - object
  )
  (:init
    ;; hand and clearance facts (as reported)
    (clear blue)
    (clear orange)
    (hand-empty)

    ;; stacking facts (immediate supports)
    (on blue yellow)
    (on orange red)

    ;; table placements — include both on(... table) and on-table for consistency with the observer report
    (on red table)
    (on yellow table)
    (on-table red)
    (on-table yellow)
  )
  (:goal (and
    (on blue orange)
  ))
)