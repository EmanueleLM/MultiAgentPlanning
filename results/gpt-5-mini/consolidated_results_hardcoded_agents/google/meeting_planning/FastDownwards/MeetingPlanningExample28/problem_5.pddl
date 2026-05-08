(define (problem meeting-planning-problem)
  (:domain meeting-planning)
  (:objects
    me - agent
    union_square chinatown - location
    t540 t1073 t1080 t1155 - time
  )

  (:init
    ;; arrival at Union Square at 09:00 (540)
    (at_time me union_square t540)

    ;; minimal ordered stage progression required by the audited schedule:
    (succ t540 t1073)   ;; wait from arrival until departure-preparation stage (09:00 -> 17:53)
    (succ t1073 t1080)  ;; travel stage (17:53 -> 18:00)
    (succ t1080 t1155)  ;; meeting stage (18:00 -> 19:15)

    ;; travel graph (only the needed directed edge is declared)
    (travel_edge union_square chinatown)

    ;; Joshua's required meeting interval (exact, audited): 18:00 (t1080) -> 19:15 (t1155)
    (joshua_present chinatown t1080 t1155)
  )

  (:goal (and
    (met_joshua)
  ))
)