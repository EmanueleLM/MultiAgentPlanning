(define (problem MeetingPlanningExample15-problem)
  (:domain MeetingPlanningExample15)
  (:objects
    traveler - agent
    russian_hill golden_gate_park - location
    time_0 time_219 time_240 time_555 time_574 - time
  )
  (:init
    ;; Initial location: arrival at Russian Hill at 09:00 represented by time_0
    (at traveler russian_hill time_0)

    ;; Explicit ordered stages (successor chain), encoding exact stage-to-stage transitions that reflect travel and meeting durations.
    ;; 09:00 -> 12:39 (waiting/slack)
    (next time_0 time_219)
    ;; 12:39 -> 13:00 (21 minutes travel from Russian Hill to Golden Gate Park)
    (next time_219 time_240)
    ;; 13:00 -> 18:15 (contiguous meeting interval of 315 minutes)
    (next time_240 time_555)
    ;; 18:15 -> 18:34 (19 minutes travel from Golden Gate Park to Russian Hill)
    (next time_555 time_574)

    ;; Direction-aware travel allowances (asymmetric durations encoded by specific start->end pairs)
    ;; Russian Hill -> Golden Gate Park = 21 minutes: depart at time_219, arrive at time_240
    (travel-allowed russian_hill golden_gate_park time_219 time_240)
    ;; Golden Gate Park -> Russian Hill = 19 minutes: depart at time_555, arrive at time_574
    (travel-allowed golden_gate_park russian_hill time_555 time_574)

    ;; Designate Golden Gate Park as the authorized meeting site for John.
    (meeting-site golden_gate_park)

    ;; Declare the single contiguous meeting interval that is fully within John's availability [13:00, 18:15]
    ;; and that meets the minimum meeting duration requirement (>= 90 minutes). This is a structural encoding:
    ;; meeting-interval time_240 time_555 corresponds to 13:00 - 18:15 (315 minutes).
    (meeting-interval time_240 time_555)
  )
  (:goal (and
    (met-john)
  ))
)