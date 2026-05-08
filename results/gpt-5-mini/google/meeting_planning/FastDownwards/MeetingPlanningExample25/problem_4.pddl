(define (problem meeting-planning-instance)
  (:domain meeting-planning)
  (:objects
    traveler david - agent
    ggp chinatown - location
    t0900 t1537 t1600 t1745 t1937 t2000 t2145 - time
  )

  (:init
    (at traveler ggp t0900)
    (at david chinatown t1600)
    (at david chinatown t1745)
    (at david chinatown t2000)
    (at david chinatown t2145)
    (next t0900 t1537)
    (next t1537 t1600)
    (next t1600 t1745)
    (next t1745 t1937)
    (next t1937 t2000)
    (next t2000 t2145)
    (travel-edge t1537 t1600)
    (travel-edge t1937 t2000)
    (meeting-allowed t1600 t1745)
    (meeting-allowed t2000 t2145)
  )

  (:goal (meeting-done))
)