(define (problem meeting-planning-problem)
  (:domain meeting-planning)
  (:objects
    me - agent
    joshua - person
    UNION_SQUARE CHINATOWN - location
    t540 t1073 t1080 t1155 t1162 - time
  )

  (:init
    ;; Arrival at Union Square at 09:00 (540)
    (at_time me UNION_SQUARE t540)
    (arrival0900_honored)

    ;; Succession chain covering the planned discrete time points:
    ;; 540 -> 1073 (idle until depart)
    ;; 1073 -> 1080 (travel, 7 minutes)
    ;; 1080 -> 1155 (meeting, 75 minutes)
    ;; 1155 -> 1162 (return travel, 7 minutes) -- optional but allowed
    (succ t540 t1073)
    (succ t1073 t1080)
    (succ t1080 t1155)
    (succ t1155 t1162)

    ;; Directed travel-time entries encoding the 7-minute travel durations for the chosen time pairs.
    (travel_allowed UNION_SQUARE CHINATOWN t1073 t1080)
    (travel_allowed CHINATOWN UNION_SQUARE t1155 t1162)

    ;; Joshua availability window contains the chosen meeting interval 1080->1155 (exactly 75 minutes).
    ;; This enforces that any meet-joshua action must occupy this entire interval (meeting >= 75).
    (joshua_present CHINATOWN t1080 t1155)
  )

  ;; Goal: ensure Joshua is met (primary, mandatory objective).
  ;; The concrete schedule is encoded in the time points and travel_allowed / joshua_present facts;
  ;; the goal only requires the mandatory outcome (met_joshua) so the planner must realize a feasible meeting.
  (:goal (and
    (met_joshua)
  ))
)