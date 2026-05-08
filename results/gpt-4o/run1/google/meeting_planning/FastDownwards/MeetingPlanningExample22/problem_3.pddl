(define (problem san_francisco_meetup)
  (:domain san_francisco_scheduling)

  (:objects
    presidio union_square - location
    self andrew - person
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 - stage
  )

  (:init
    (at self presidio)
    (can_travel_to presidio union_square)
    (can_travel_to union_square presidio)
    (current_time_stage stage_0)
    (not (visited union_square))
    (not (met andrew))
  )

  (:goal (and
    (met andrew)
    (visited union_square)
    (current_time_stage stage_6) ; Ensure that we have passed the required interaction time with Andrew
  ))
)