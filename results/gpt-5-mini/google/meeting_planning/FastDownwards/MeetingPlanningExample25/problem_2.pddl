(define (problem orchestrator-problem)
  (:domain orchestrator-domain)
  (:objects
    traveler - agent
    chinatown ggp - location
    t0900 t1537 t1600 t1607 t1630 t1737 t1745 t1800 t1900 t1937 t1945 t2000 t2145 - time
  )

  (:init
    (at traveler ggp t0900)

    (next t0900 t1537) (next t1537 t1600) (next t1600 t1607) (next t1607 t1630)
    (next t1630 t1737) (next t1737 t1745) (next t1745 t1800) (next t1800 t1900)
    (next t1900 t1937) (next t1937 t1945) (next t1945 t2000) (next t2000 t2145)

    (travel-edge t1537 t1600)
    (travel-edge t1607 t1630)
    (travel-edge t1737 t1800)
    (travel-edge t1937 t2000)

    (meeting-allowed t1600 t1745)
    (meeting-allowed t1630 t1900)
    (meeting-allowed t1800 t1945)
    (meeting-allowed t2000 t2145)

    (david-location chinatown)
  )

  (:goal (meeting-done))
)