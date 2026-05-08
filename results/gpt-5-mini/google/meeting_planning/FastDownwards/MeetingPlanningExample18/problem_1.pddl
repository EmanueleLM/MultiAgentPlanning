(define (problem meeting-problem)
  (:domain meeting-domain)

  ;; Comments describing the concrete, instance-specific encoding:
  ;; - Time unit: 1 minute per time object.
  ;; - Reference: t0 corresponds to 09:00 (traveler arrival at Marina).
  ;; - Chosen feasible schedule encoded here (planner can find this):
  ;;     - Wait at Marina from t0 until t694 (traveler waits off-problem until 11:34 PM relative minutes — symbolic).
  ;;       (This models waiting until the departure minute that yields on-time arrival for the meeting.)
  ;;     - Depart Marina at t694, travel 11 minutes (delta_m_to_r t694 -> t705), arrive Richmond at t705.
  ;;     - Start meeting at t705, contiguous 75 minutes -> ends at t780 (t705 -> t780 is delta_meet75).
  ;;     - Betty is available for the interval [t705,t780] (fits Betty's real availability 20:30..22:00).
  ;;   This schedule satisfies: arrival at Marina at 09:00 (t0), travel feasibility, and Betty's minimum 75-minute contiguous meeting.
  (:objects
    traveler_obj - traveler
    betty_obj - friend

    marina richmond - loc

    ;; Only the specific timepoints needed for this instance are declared.
    t0 t694 t705 t780 - time
  )

  (:init
    ;; initial time at arrival to Marina (09:00)
    (current-time t0)

    ;; initial locations
    (at_traveler marina)
    (at_betty richmond)

    ;; delta relations used by the domain actions (instance-specific)
    ;; travel Marina -> Richmond takes 11 minutes: t694 -> t705
    (delta_m_to_r t694 t705)

    ;; meeting contiguous duration 75 minutes: t705 -> t780
    (delta_meet75 t705 t780)

    ;; a single wait/jump is provided so the planner can advance from t0 to the chosen departure time t694
    (delta_wait t0 t694)

    ;; Betty's availability includes the chosen meeting interval [t705,t780].
    ;; (This enforces the meeting interval must be contained in Betty's availability.)
    (available_betty t705 t780)
  )

  ;; Goal: achieve a contiguous 75-minute meeting with Betty (met_betty set by meeting action).
  (:goal (and
    (met_betty)
  ))
)