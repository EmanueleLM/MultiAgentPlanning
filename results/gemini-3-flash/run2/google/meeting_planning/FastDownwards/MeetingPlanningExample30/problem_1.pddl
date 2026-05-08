(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects
    richmond_district north_beach - location
    t_0900 t_0917 t_0930 t_1130 t_1148 t_1615 - time_point
    stephanie - person
  )
  (:init
    ;; Initial state
    (at richmond_district)
    (time t_0900)

    ;; Connectivity and Travel times
    ;; Richmond to North Beach (17 mins)
    (connected richmond_district north_beach t_0900 t_0917)
    
    ;; North Beach to Richmond (18 mins) - available after a possible meeting
    (connected north_beach richmond_district t_1130 t_1148)

    ;; Stephanie availability: North Beach, 9:30 AM to 4:15 PM
    ;; Required meeting duration: 120 minutes
    ;; Earliest possible 120-minute meeting window
    (available stephanie north_beach t_0930 t_1130)

    ;; Waiting possibilities (to handle arrival before Stephanie or end of day)
    (before t_0917 t_0930)
    (before t_1130 t_1615)
    (before t_1148 t_1615)
    
    ;; Initial status of meeting goal
    ;; (not (met stephanie)) - implied by absence
  )
  (:goal
    (and
      (met stephanie)
    )
  )
)