(define (problem meeting-planning-problem)
  (:domain meeting-planning)
  (:objects
    me - agent
    UNION_SQUARE CHINATOWN - location
    t540 t1073 t1080 t1155 t1162 - time
  )

  (:init
    ;; Arrival at Union Square at 09:00 (540 minutes from midnight)
    (at_time me UNION_SQUARE t540)

    ;; Explicit, ordered time points (contiguous successor relations used to enforce intervals)
    (succ t540 t1073)
    (succ t1073 t1080)
    (succ t1080 t1155)
    (succ t1155 t1162)

    ;; Explicit travel_allowed facts encode the 7-minute directed travel durations
    ;; for the chosen start/end time pairs.
    (travel_allowed UNION_SQUARE CHINATOWN t1073 t1080)
    (travel_allowed CHINATOWN UNION_SQUARE t1155 t1162)

    ;; Joshua's availability is encoded so the meet-joshua action may occupy 1080->1155 (75 minutes).
    ;; This enforces the meeting to be contiguous and at least the specified duration.
    (joshua_present CHINATOWN t1080 t1155)
  )

  ;; Mandatory objective: meet Joshua (the only friend specified). The schedule's time points,
  ;; travel_allowed and joshua_present facts force any plan satisfying this goal to respect
  ;; arrival time, travel durations, contiguous occupancy, and Joshua's availability window.
  (:goal (and
    (met_joshua)
  ))
)