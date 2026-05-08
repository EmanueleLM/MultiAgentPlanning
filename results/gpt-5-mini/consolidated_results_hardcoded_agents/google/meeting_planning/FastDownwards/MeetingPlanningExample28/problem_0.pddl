(define (problem mapper-problem)
  (:domain mapper)
  (:objects
    me - agent
    joshua - person
    UNION_SQUARE CHINATOWN - location
    t540 t1073 t1080 t1290 t1297 - time
  )

  (:init
    ;; Initial agent location at arrival time 09:00 (540) -- ARRIVAL_UNION_SQUARE_0900 honored.
    (at_time me UNION_SQUARE t540)
    (arrival0900_honored)

    ;; Explicit contiguous time-point chain reflecting the audited schedule:
    ;; 540 -> 1073 (idle), 1073 -> 1080 (travel), 1080 -> 1290 (meeting), 1290 -> 1297 (return travel)
    (succ t540 t1073)
    (succ t1073 t1080)
    (succ t1080 t1290)
    (succ t1290 t1297)

    ;; Directed travel-time matrix entries (only the provided directed pairs are allowed).
    ;; The travel_allowed facts encode the exact start/end time pairs that respect the travel durations.
    ;; UNION_SQUARE -> CHINATOWN: 1073 -> 1080 (7 minutes)
    (travel_allowed UNION_SQUARE CHINATOWN t1073 t1080)
    ;; CHINATOWN -> UNION_SQUARE: 1290 -> 1297 (7 minutes)
    (travel_allowed CHINATOWN UNION_SQUARE t1290 t1297)

    ;; Joshua availability window encoded as the single allowed meeting interval (exactly 1080 -> 1290).
    ;; This enforces Joshua being at Chinatown for the whole meeting interval and ensures the meeting length
    ;; meets the mandatory minimum (1080->1290 = 210 minutes >= 75).
    (joshua_present CHINATOWN t1080 t1290)
  )

  ;; Goals: mandatory meeting with Joshua and final agent location per the audited schedule.
  (:goal (and
    (met_joshua)
    (at_time me UNION_SQUARE t1297)
    (arrival0900_honored)
  ))
)