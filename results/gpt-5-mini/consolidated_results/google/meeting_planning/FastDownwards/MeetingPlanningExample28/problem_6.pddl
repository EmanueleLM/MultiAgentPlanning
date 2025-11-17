(define (problem meeting-planning-problem)
  (:domain meeting-planning)
  (:objects
    me - agent
    union_square chinatown - location
    ;; time points used as discrete stages (minutes-from-midnight encoded as distinct time objects)
    t540 t1073 t1080 t1155 t1162 - time
  )

  (:init
    ;; arrival at Union Square at 09:00 (540)
    (at_time me union_square t540)

    ;; Explicit ordered stage progression required by the audited schedule:
    ;; - wait/idle from arrival until departure-preparation stage (09:00 -> 17:53)
    ;; - travel stage (17:53 -> 18:00) corresponds to the 7-minute travel interval
    ;; - meeting stage (18:00 -> 19:15) corresponds to the 75-minute contiguous meeting
    ;; - optional return travel stage (19:15 -> 19:22) corresponds to 7-minute travel back
    (succ t540 t1073)   ;; 09:00 -> 17:53 (idle interval)
    (succ t1073 t1080)  ;; 17:53 -> 18:00 (travel interval of 7 minutes)
    (succ t1080 t1155)  ;; 18:00 -> 19:15 (meeting interval of 75 minutes)
    (succ t1155 t1162)  ;; 19:15 -> 19:22 (return travel interval of 7 minutes)

    ;; travel graph (directed edges both ways as given in the public info)
    (travel_edge union_square chinatown)
    (travel_edge chinatown union_square)

    ;; Joshua's audited presence for the exact meeting interval used in the plan:
    ;; Joshua is present at Chinatown from 18:00 (t1080) to 19:15 (t1155).
    ;; This enforces the required contiguous meeting duration structurally by making that interval available.
    (joshua_present chinatown t1080 t1155)
  )

  ;; Goal: ensure Joshua is met (the audited schedule requires meeting Joshua for the specified contiguous interval)
  (:goal (and
    (met_joshua)
  ))
)