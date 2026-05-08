(define (problem meets_joseph_san_francisco)
  (:domain san_francisco_visit)
  (:objects
    financial_district union_square - location
    you - agent
    joseph - friend
    time_9_00am time_after_travel_to_union_square time_9_30pm time_10_00pm - time
  )
  (:init
    (at you financial_district)
    (current_time time_9_00am)
    (available joseph union_square time_9_30pm time_10_00pm)
  )
  (:goal
    (met you joseph)
  )
)