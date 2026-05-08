(define (problem meeting-planning-instance)
  (:domain meeting-planning)
  (:objects
    traveler david - agent
    ggp chinatown - location
    t0900 t1537 t1600 t1745 t1937 t2000 t2145 - time
  )

  (:init
    ;; traveler starts at Golden Gate Park at 09:00
    (at traveler ggp t0900)

    ;; David is present at Chinatown for the times that bracket allowed meetings
    ;; (David availability: 16:00 - 21:45). We mark presence at the relevant time points.
    (at david chinatown t1600)
    (at david chinatown t1745)
    (at david chinatown t2000)
    (at david chinatown t2145)

    ;; Linear time ordering (symbolic progression)
    (next t0900 t1537)
    (next t1537 t1600)
    (next t1600 t1745)
    (next t1745 t1937)
    (next t1937 t2000)
    (next t2000 t2145)

    ;; Travel edges encode the 23-minute travel time:
    ;; departing at t1537 arrives at t1600 (to meet at 16:00)
    ;; departing at t1937 arrives at t2000 (to meet at 20:00)
    (travel-edge t1537 t1600)
    (travel-edge t1937 t2000)

    ;; Allowed meeting intervals (start time -> end time) that satisfy minimum 105 minutes
    ;; and fall within David's availability 16:00-21:45.
    (meeting-allowed t1600 t1745)  ;; 16:00 -> 17:45 (105 minutes)
    (meeting-allowed t2000 t2145)  ;; 20:00 -> 21:45 (105 minutes)
  )

  (:goal (meeting-done))
)