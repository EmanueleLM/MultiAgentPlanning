(define (problem meet-william-instance)
  (:domain multiagent-travel-meet)

  (:objects
    traveler william - agent
    nob_hill castro - location
  )

  ; Time framing note:
  ; - We take time 0 to correspond to 9:00 AM (traveler start time).
  ; - William is available at The Castro from 12:15 PM to 22:00.
  ;   12:15 PM is 3 hours 15 minutes after 9:00 AM = 195 minutes.
  ;   22:00   is 13 hours after 9:00 AM = 780 minutes.
  ; Timed initial literals below assert William's location and availability accordingly.

  (:init
    ; initial locations
    (at traveler nob_hill)
    ; William is not at castro initially; he becomes there at t=195.
    ; numeric initializations
    (= (total-cost) 0)
    (= (met-duration) 0)
    (= (travelled) 0)
  )

  ; William availability and presence at The Castro is modeled with timed initial literals.
  ; At time 195 (which is 12:15 PM), William appears at The Castro and becomes available.
  ; At time 780 (which is 22:00), William is no longer at The Castro and availability ends.
  :tinit
    (at 195 (at william castro))
    (at 195 (william-available))
    (at 780 (not (at william castro)))
    (at 780 (not (william-available)))
  )

  ; Goal: ensure we have at least 75 minutes of meeting time with William (hard constraint).
  (:goal (and
           (>= (met-duration) 75)
         )
  )

  ; Objective: minimize total-cost = travel minutes + waiting minutes - meeting minutes (larger meeting reduces cost).
  (:metric minimize (total-cost))
)