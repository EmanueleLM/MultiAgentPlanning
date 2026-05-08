(define (problem visit_friends)
  (:domain san_francisco_trip)
  (:init 
    (at marina_district)
    (current_time time_9am)
    (person_at sandra chinatown)
  )
  (:goal (and (visited_sandra)))
)