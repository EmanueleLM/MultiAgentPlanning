(define (problem floor-tiles-problem)
  (:domain floor-tile)

  (:objects
    r1 - robot
    t1 t2 t3 t4 - tile
    red blue none - color
  )

  (:init
    ;; initial robot location and held color
    (robot-at r1 t1)
    (robot-has r1 none)

    ;; clear = tile unoccupied by any robot
    (not (clear t1))  ; occupied by r1
    (clear t2)
    (clear t3)
    (clear t4)

    ;; all tiles start unpainted
    (unpainted t1)
    (unpainted t2)
    (unpainted t3)
    (unpainted t4)

    ;; paint pots (colors are reusable)
    (color-available red t1)
    (color-available blue t2)

    ;; adjacency for a 2x2 grid:
    ;; layout:
    ;;  t1  t2
    ;;  t3  t4

    ;; up/down relations
    (up t3 t1)
    (up t4 t2)
    (down t1 t3)
    (down t2 t4)

    ;; left/right relations
    (left t2 t1)
    (left t4 t3)
    (right t1 t2)
    (right t3 t4)

    ;; initial total cost
    (= (total-cost) 0)
  )

  (:goal (and
    (painted t1 red)
    (painted t2 blue)
    (painted t3 red)
    (painted t4 blue)
    ;; final required robot location (terminal condition)
    (robot-at r1 t1)
  ))

  ;; minimize total cost (optional for planner search guidance)
  (:metric minimize (total-cost))
)