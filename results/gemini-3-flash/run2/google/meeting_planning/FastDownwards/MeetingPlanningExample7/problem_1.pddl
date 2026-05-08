(define (problem meeting_planning_example_7)
  (:domain meeting_planning)
  (:objects
    richmond_district north_beach - location
    john - person
    t0900 t0917 t1515 t1630 - time
  )
  (:init
    (at_loc richmond_district)
    (current_time t0900)
    (travel_possible richmond_district north_beach t0900 t0917)
    (next_time t0917 t1515)
    (meeting_possible john north_beach t1515 t1630)
  )
  (:goal
    (met john)
  )
)