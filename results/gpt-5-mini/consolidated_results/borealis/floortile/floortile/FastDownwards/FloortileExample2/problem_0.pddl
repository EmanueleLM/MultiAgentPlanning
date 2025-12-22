(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    r1 - robot
    t1 t2 t3 t4 t5 - tile
    p1 - item
    s1 s2 s3 - step
  )

  (:init
    ; Robot initial location
    (at r1 t1)

    ; Tile adjacency (bidirectional)
    (adjacent t1 t2)
    (adjacent t2 t1)
    (adjacent t2 t3)
    (adjacent t3 t2)
    (adjacent t3 t4)
    (adjacent t4 t3)
    (adjacent t2 t5)
    (adjacent t5 t2)

    ; Painted tile that prevents occupancy (t5 is painted initially and must not be entered)
    (painted t5)

    ; Item initial location
    (item-at p1 t2)

    ; Delivery target for the item
    (delivery-target p1 t4)

    ; Step targets and order: must visit t2 then t3 then t4 in this order
    (step-target s1 t2)
    (step-target s2 t3)
    (step-target s3 t4)

    (step-initial s1)
    (step-successor s1 s2)
    (step-successor s2 s3)

    ; Numeric cost initialization
    (= (total-cost) 0)
  )

  ; Hard goals:
  ; - all specified steps must be done in order (enforced by actions' preconditions)
  ; - the item p1 must be delivered to t4
  ; - the robot must finish at t4
  (:goal (and
    (step-done s1)
    (step-done s2)
    (step-done s3)
    (delivered p1 t4)
    (at r1 t4)
  ))

  ; Minimize the accumulated total-cost
  (:metric minimize (total-cost))
)