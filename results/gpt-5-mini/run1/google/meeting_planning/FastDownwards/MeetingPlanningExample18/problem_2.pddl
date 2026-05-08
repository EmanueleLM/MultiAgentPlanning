(define (problem meeting-problem)
  (:domain meeting-domain)

  ;; instance-specific encoding for MeetingPlanningExample18
  ;; time objects are discrete symbolic timepoints (not numeric).
  ;; chosen feasible schedule encoded in initial delta relations:
  ;;  - wait t0 -> t694
  ;;  - travel marina_district t694 -> t705 (11 minutes)
  ;;  - meet at t705 -> t780 (75 minutes), which lies within betty's availability
  (:objects
    traveler_obj - traveler
    betty_obj - friend

    marina_district richmond_district - loc

    ;; only the explicit timepoints needed for this instance
    t0 t694 t705 t780 - time
  )

  (:init
    ;; initial time: arrival at marina at 09:00 is t0
    (current_time t0)

    ;; initial locations
    (at_traveler marina_district)
    (at_betty richmond_district)

    ;; travel relation: marina_district -> richmond_district takes 11 minutes (t694 -> t705)
    (delta_travel marina_district richmond_district t694 t705)

    ;; contiguous meeting interval of 75 minutes encoded as t705 -> t780
    (delta_meet75 t705 t780)

    ;; a wait delta to move from initial arrival time t0 to the chosen departure t694
    (delta_wait t0 t694)

    ;; betty's availability includes the chosen meeting interval [t705,t780]
    (available_betty t705 t780)
  )

  ;; goal: achieve the required contiguous meeting with betty (at least 75 minutes)
  (:goal (and
    (met_betty)
  ))
)