(define (problem san_francisco_visit_problem)
  (:domain san_francisco_visit)
  (:objects
    time_9am time_930am time_1110am time_1115am time_415pm - time
  )

  (:init
    (at you richmond_district time_9am)
    (at stephanie north_beach time_930am)
    (time_less time_9am time_930am)
    (time_less time_930am time_1110am)
    (time_less time_1110am time_1115am)
    (time_less time_1115am time_415pm)
  )

  (:goal (and
    (visited you north_beach)
    (can_meet you stephanie north_beach)
    (visited you richmond_district)
  ))
)