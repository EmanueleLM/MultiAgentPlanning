(define (problem meeting-planning-instance)
  (:domain meeting-planning)
  (:objects
    traveler david - agent
    ggp chinatown - location
    t0900 t1537 t1600 t1745 t1930 t2000 t2145 - time
  )

  (:init
    ;; initial locations / times
    (at traveler ggp t0900)

    ;; David's presence at Chinatown across his availability window (16:00-21:45)
    (at david chinatown t1600)
    (at david chinatown t1745)
    (at david chinatown t1930)
    (at david chinatown t2000)
    (at david chinatown t2145)

    ;; ordered time points (discrete stages)
    (next t0900 t1537)
    (next t1537 t1600)
    (next t1600 t1745)
    (next t1745 t1930)
    (next t1930 t2000)
    (next t2000 t2145)

    ;; travel edges encode the known 23-minute travel time:
    ;; departing Golden Gate Park at 15:37 arrives Chinatown at 16:00
    (travel-edge t1537 t1600)

    ;; meeting-allowed pairs: end >= start + 105 minutes and within David's availability
    (meeting-allowed t1600 t1745)
    (meeting-allowed t1600 t1930)
    (meeting-allowed t1600 t2000)
    (meeting-allowed t1600 t2145)
    (meeting-allowed t1745 t1930)
    (meeting-allowed t1745 t2000)
    (meeting-allowed t1745 t2145)
    (meeting-allowed t1930 t2145)
    (meeting-allowed t2000 t2145)
  )

  (:goal (meeting-done))
)