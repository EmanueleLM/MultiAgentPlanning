(define (problem scenario_b)
  (:domain logistics9)
  (:objects
    d1 d2 d3
  )
  (:init
    (next d1 d2)
    (next d2 d3)
    (texture d1)
    (spring d1)
  )
  (:goal (and
    (hand d3)
    (cats d3)
    (sneeze d3)
    (stupendous d3)
    (vase d1 d2)
    (vase d2 d3)
    (collect d2 d3)
  ))
)