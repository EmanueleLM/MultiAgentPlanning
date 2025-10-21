(define (problem orchestrated_problem)
  (:domain orchestrated_domain)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5
    object_6 object_7 object_8 object_9 object_10 object_11
    object_12 object_13 object_14 - item
  )

  ;; Combined initial facts (consistent union of planner_a and planner_b facts)
  (:init
    ;; Most items start available
    (available object_0)
    (available object_1)
    (available object_2)
    (available object_3)
    (available object_4)
    (available object_5)
    (available object_6)
    (available object_7)
    (available object_8)
    (available object_9)

    ;; Some facts present initially from planners, consistent with availability
    (processed object_9)         ;; planner_a had object_9 already processed
    (active object_12)           ;; planner_b had object_12 already active

    ;; An existing connection between object_10 and object_11 recorded by one planner
    (connected object_10 object_11)
    (connected object_11 object_10)
  )

  ;; Combined goals from planner_a and planner_b (treated as hard constraints)
  (:goal
    (and
      ;; Goals from planner_a:
      (processed object_1)
      (connected object_2 object_3)

      ;; Goals from planner_b:
      (active object_4)
      (available object_5)

      ;; Preserve a planner_a legacy goal that must remain true:
      (processed object_9)
    )
  )
)