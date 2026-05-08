(define (domain meeting_planning_example_30)
  (:requirements :strips :typing)
  (:types location time)
  (:constants
    richmond_district north_beach - location
    time_0900am time_0917am time_0930am time_1130am - time
  )
  (:predicates
    (at_loc ?l - location)
    (time_at ?t - time)
    (has_met_stephanie)
  )

  ;; Travel from Richmond District to North Beach takes 17 minutes.
  ;; Starting from 9:00 AM arrival at Richmond District, arrival at North Beach is 9:17 AM.
  (:action travel_richmond_to_north_beach
    :precondition (and (at_loc richmond_district) (time_at time_0900am))
    :effect (and (not (at_loc richmond_district)) (at_loc north_beach) (not (time_at time_0900am)) (time_at time_0917am))
  )

  ;; Wait at North Beach from arrival (9:17 AM) until Stephanie arrives (9:30 AM).
  (:action wait_at_north_beach_for_stephanie
    :precondition (and (at_loc north_beach) (time_at time_0917am))
    :effect (and (not (time_at time_0917am)) (time_at time_0930am))
  )

  ;; Meet Stephanie at North Beach for the minimum required 120 minutes.
  ;; Stephanie is available from 9:30 AM to 4:15 PM. 
  ;; A 120-minute meeting starting at 9:30 AM concludes at 11:30 AM, well within her window.
  (:action meet_stephanie_at_north_beach
    :precondition (and (at_loc north_beach) (time_at time_0930am))
    :effect (and (not (time_at time_0930am)) (time_at time_1130am) (has_met_stephanie))
  )
)