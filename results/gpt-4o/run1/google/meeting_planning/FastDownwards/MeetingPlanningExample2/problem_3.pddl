```lisp
(define (problem sf_visit_problem)
  (:domain sf_visit)
  
  (:objects
    haight_ashbury sunset_district - location
    you jessica - person
    time_900am time_915am time_1030am time_315pm time_445pm time_815pm - time)
  
  (:init
    (at you haight_ashbury)
    (time_stage time_900am)
    (next_time time_900am time_915am)
    (next_time time_915am time_1030am)
    (next_time time_315pm time_445pm)
    (next_time time_445pm time_815pm)
    
    (can_meet you jessica)
  )
  
  (:goal
    (meeting_scheduled you jessica))
)
```