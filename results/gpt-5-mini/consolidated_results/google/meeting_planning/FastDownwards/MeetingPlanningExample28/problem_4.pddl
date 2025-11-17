(define (problem meeting-planning-problem)
  (:domain meeting-planning)
  (:objects
    me - agent
    union_square chinatown - location
    t540 t1073 t1080 t1155 t1162 - time
  )

  (:init
    ;; Arrival at Union Square at 09:00 (540 minutes from midnight)
    (at_time me union_square t540)

    ;; Ordered stage progression (discrete stages used to enforce contiguous occupancy/durations)
    (succ t540 t1073)   ;; idle from 09:00 until stage before travel
    (succ t1073 t1080)  ;; travel stage: depart t1073 arrive t1080 (18:00)
    (succ t1080 t1155)  ;; meeting stage end at t1155 (19:15)
    (succ t1155 t1162)  ;; optional post-meeting stage (return arrival)

    ;; Travel allowances matching exact stage pairs (7-minute travel)
    (travel_allowed union_square chinatown t1073 t1080)
    (travel_allowed chinatown union_square t1155 t1162)

    ;; Joshua's availability is encoded as explicit allowed meeting intervals.
    ;; Here the audited schedule requires Joshua present from 18:00 (t1080) to 19:15 (t1155).
    (joshua_present chinatown t1080 t1155)
  )

  (:goal (and
    (met_joshua)
  ))
)