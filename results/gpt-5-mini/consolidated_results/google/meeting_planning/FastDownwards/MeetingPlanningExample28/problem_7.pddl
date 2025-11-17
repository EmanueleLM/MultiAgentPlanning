(define (problem meeting-planning-problem)
  (:domain meeting-planning)
  (:objects
    me - agent
    union_square chinatown - location
    t540 t1073 t1080 t1155 - time
  )

  (:init
    (at_time me union_square t540)

    ;; Succession chain encoding the audited schedule intervals:
    ;; 09:00 (t540) -> 17:53 (t1073) [idle],
    ;; 17:53 (t1073) -> 18:00 (t1080) [7-min travel],
    ;; 18:00 (t1080) -> 19:15 (t1155) [75-min meeting]
    (succ t540 t1073)
    (succ t1073 t1080)
    (succ t1080 t1155)

    ;; Travel link needed for the planned outbound trip (Union Square -> Chinatown)
    (travel_edge union_square chinatown)

    ;; Joshua is available for the meeting interval used by the plan
    (joshua_present chinatown t1080 t1155)
  )

  (:goal (met_joshua))
)