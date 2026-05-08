(define (problem visit_3_cities)
    (:domain travel_planning)

    (:objects 
      brussels valencia nice - city
      day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 - day
    )

    (:init
      (current_city brussels day_1)
      (direct_flight brussels valencia)
      (direct_flight valencia brussels)
      (direct_flight nice brussels)
      (direct_flight brussels nice)
      (successor day_1 day_2)
      (successor day_2 day_3)
      (successor day_3 day_4)
      (successor day_4 day_5)
      (successor day_5 day_6)
      (successor day_6 day_7)
      (successor day_7 day_8)
      (successor day_8 day_9)
    )

    (:goal (and 
      (goal_visit brussels day_1)
      (goal_visit brussels day_2)
      (goal_visit valencia day_3)
      (goal_visit valencia day_4)
      (goal_visit valencia day_5)
      (goal_visit nice day_6)
      (goal_visit nice day_7)
      (goal_visit nice day_8)
      (goal_visit nice day_9)
    ))
)