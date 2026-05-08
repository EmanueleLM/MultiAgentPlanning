(define (problem meet-sam-and-margaret)
  (:domain meetup)

  (:objects
    traveler - agent
    mission_district haight_ashbury - location
    t0900 t0912 t0930 t0942 t1012 t1545 t1800 - time
  )

  (:init
    (at traveler mission_district t0900)

    (can_travel_md_haight t0900 t0912)
    (can_travel_md_haight t0930 t0942)

    (can_meet_sam t0900 t0930)

    (can_meet_margaret t0912 t0942)
    (can_meet_margaret t0942 t1012)
    (can_meet_margaret t0912 t1012)
  )

  (:goal (and (met_sam) (met_margaret)))
)