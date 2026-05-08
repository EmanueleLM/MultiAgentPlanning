(define (problem meeting-planning-problem)
  (:domain meeting-planning)
  (:objects
    me - agent
    union_square chinatown - location
    t540 t1073 t1080 t1155 - time
  )

  (:init
    ;; initial arrival at Union Square at 09:00 (540 minutes)
    (at_time me union_square t540)

    ;; explicit ordered stage progression (succ defines contiguous intervals used by actions)
    ;; t540 -> t1073 : idle interval 09:00 -> 17:53
    ;; t1073 -> t1080 : travel interval 17:53 -> 18:00 (7 minutes)
    ;; t1080 -> t1155 : meeting interval 18:00 -> 19:15 (75 minutes)
    (succ t540 t1073)
    (succ t1073 t1080)
    (succ t1080 t1155)

    ;; directed travel edges (both directions available in environment)
    (travel_edge union_square chinatown)
    (travel_edge chinatown union_square)

    ;; Joshua availability for the exact interval used by the audited plan (18:00 -> 19:15)
    ;; This enforces that the meeting action must consume a contiguous interval that matches Joshua's presence.
    (joshua_available chinatown t1080 t1155)
  )

  ;; Mandatory goal: meet Joshua (the planner must execute the contiguous meeting interval that sets met_joshua)
  (:goal (met_joshua))
)