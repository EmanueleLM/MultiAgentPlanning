(define (problem sf_visit_problem)
  (:domain sf_visit)
  
  (:objects
    haight_ashbury sunset_district - location
    you jessica - person
    time_900am time_315pm time_815pm time_1030pm - time)

  (:init
    (at you haight_ashbury)
    (before time_900am time_315pm)
    (before time_315pm time_815pm)
    (before time_815pm time_1030pm)
    (can_meet you jessica time_315pm)
    (can_meet you jessica time_815pm))

  (:goal
    (and (meeting_scheduled you jessica)))
)