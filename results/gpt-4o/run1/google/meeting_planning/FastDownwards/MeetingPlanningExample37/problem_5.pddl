(define (problem visit_jeffrey)
  (:domain san_francisco_meeting)
  (:objects 
    bayview financial_district - location
    you - person
    t0 t1 t2 t3 - time-stage
  )
  (:init
    (at you bayview)
    (can_travel bayview financial_district)
    (can_travel financial_district bayview)
    (current_time_stage t0)
    (valid_time_stage t0 t1)
    (valid_time_stage t1 t2)
    (valid_time_stage t2 t3)
  )
  (:goal
    (and
      (visited_jeffrey you))
  )
)