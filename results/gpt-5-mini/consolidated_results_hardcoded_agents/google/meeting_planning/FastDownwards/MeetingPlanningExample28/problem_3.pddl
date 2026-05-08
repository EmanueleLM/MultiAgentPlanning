(define (problem meeting-planning-problem)
  (:domain meeting-planning)
  (:objects
    me - agent
    UNION_SQUARE CHINATOWN - location
    t540 t1073 t1080 t1155 - time
  )

  (:init
    ;; Arrival at Union Square at 09:00 (540 minutes from midnight)
    (at_time me UNION_SQUARE t540)

    ;; Minimal explicit, ordered time points needed for the audited schedule:
    (succ t540 t1073)   ;; idle until just before travel
    (succ t1073 t1080)  ;; 7-minute travel arrives at 18:00
    (succ t1080 t1155)  ;; 75-minute meeting interval end at 19:15

    ;; Only the necessary travel and availability facts are enumerated:
    (travel_allowed UNION_SQUARE CHINATOWN t1073 t1080)
    (joshua_present CHINATOWN t1080 t1155)
  )

  (:goal (and
    (met_joshua)
  ))
)