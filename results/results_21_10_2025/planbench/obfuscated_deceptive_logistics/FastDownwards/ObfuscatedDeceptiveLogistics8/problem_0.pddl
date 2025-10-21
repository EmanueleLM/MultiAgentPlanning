(define (problem scenario1-problem)
  (:domain orchestrator-domain)
  (:objects
    obj0 obj1 obj2 obj3 obj4 obj5 obj6 obj7 obj8 obj9 obj10 - object
  )
  (:init
    ;; unary facts
    (cats obj0)
    (sneeze obj3)
    (sneeze obj4)
    (hand obj10)
    (hand obj9)
    (spring obj5)
    (spring obj7)
    (stupendous obj1)
    (stupendous obj2)
    (texture obj5)
    (texture obj6)
    (texture obj7)
    (texture obj8)

    ;; binary facts
    (collect obj5 obj1)
    (collect obj6 obj1)
    (collect obj7 obj2)
    (collect obj8 obj2)

    (next obj0 obj7)
    (next obj10 obj5)
    (next obj3 obj5)
    (next obj4 obj8)
    (next obj9 obj8)
  )
  (:goal (and
    (next obj10 obj5)
    (next obj9 obj7)
  ))
)