(define (problem floortile-instance-01)
  (:domain floortile)

  (:objects
    r1 - robot

    t1 t2 t3 t4 - tile

    red blue - color
  )

  (:init
    ;; types
    (robot r1)
    (tile t1) (tile t2) (tile t3) (tile t4)
    (color red) (color blue)

    ;; adjacency (explicit both directions)
    (adj t1 t2) (adj t2 t1)
    (adj t1 t3) (adj t3 t1)
    (adj t2 t4) (adj t4 t2)
    (adj t3 t4) (adj t4 t3)

    ;; robot initial location
    (at r1 t1)

    ;; all tiles initially unpainted
    (unpainted t1) (unpainted t2) (unpainted t3) (unpainted t4)

    ;; no tiles painted initially (painted facts absent)

    ;; colors availability and robot-held color
    (available blue)
    ;; red is initially held by the robot; therefore red is not available
    (holding r1 red)
    (not (available red))

    ;; robot hands state
    (not (empty r1))

    ;; numeric initial total cost
    (= (total-cost) 0)
  )

  ;; Goal: specific tiles must be painted with specified colors.
  (:goal (and
           (painted t2 red)
           (painted t3 blue)
         ))

  ;; Minimize the accumulated total-cost.
  (:metric minimize (total-cost))
)