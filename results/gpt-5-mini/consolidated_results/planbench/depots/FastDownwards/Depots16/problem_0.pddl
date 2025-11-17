(define (problem integrated-problem)
  (:domain integrated-domain)

  (:objects
    object_0 object_1 - agent
    object_2 object_3 object_4 - location
    object_5 object_6 object_7 object_10 object_11 object_12 object_13 - item
    object_8 object_9 - tool
  )

  (:init
    ;; agent locations
    (at object_0 object_2)
    (at object_1 object_3)

    ;; items initially at locations
    (item-at object_5 object_2)
    (item-at object_6 object_2)
    (item-at object_7 object_3)
    (item-at object_11 object_3)
    (item-at object_12 object_3)
    ;; panel (object_10) not assembled yet - no item-at initially
    (item-at object_13 object_2) ;; powerunit at location object_2

    ;; tools at locations
    (tool-at object_8 object_2)
    (tool-at object_9 object_2)
  )

  (:goal (and
    (assembled object_10)
    (powered object_13)
  ))
)