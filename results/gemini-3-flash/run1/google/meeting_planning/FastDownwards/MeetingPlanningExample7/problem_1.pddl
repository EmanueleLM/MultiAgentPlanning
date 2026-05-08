(define (problem meet_john_problem)
  (:domain meeting_planning)
  (:objects
    richmond_district north_beach - location
    t_0900 t_0917 t_1515 t_1630 - time
    john - person
  )
  (:init
    (at richmond_district)
    (time-at t_0900)
    (can-travel richmond_district north_beach t_0900 t_0917)
    (can-wait north_beach t_0917 t_1515)
    (can-meet john north_beach t_1515 t_1630)
  )
  (:goal
    (met john)
  )
)