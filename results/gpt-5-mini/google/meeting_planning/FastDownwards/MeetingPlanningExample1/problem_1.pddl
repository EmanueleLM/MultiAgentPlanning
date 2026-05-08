(define (problem meeting-instance)
  (:domain meeting_planning)

  (:objects
    traveler betty - person
    richmond financial - location
    t_0900 t_1653 t_1715 t_1815 - time
  )

  (:init
    ;; Role tags to distinguish traveler and Betty (prevents self-meetings).
    (is_traveler traveler)
    (is_betty betty)

    ;; Initial presence: traveler arrives in Richmond at 09:00.
    (at traveler richmond t_0900)

    ;; Betty's availability: she is at Financial District from 17:15 through 18:15 (and beyond).
    ;; We record presence at the timepoints that bracket the candidate meeting interval.
    (at betty financial t_1715)
    (at betty financial t_1815)

    ;; Time ordering (successor links). These are the discrete time points used in this instance.
    (consecutive t_0900 t_1653)
    (consecutive t_1653 t_1715)
    (consecutive t_1715 t_1815)

    ;; Precomputed travel possibility matching the real travel duration (Richmond -> Financial = 22 minutes).
    ;; Departing Richmond at 16:53 arrives in Financial at 17:15.
    (can_travel richmond financial t_1653 t_1715)

    ;; Location availability and Betty's minimum-meeting-duration constraint encoded for the chosen meeting interval.
    ;; We encode a 60-minute meeting as occupying the consecutive interval t_1715 -> t_1815.
    (loc_available financial t_1715 t_1815)
    (beth_min_interval t_1715 t_1815)
  )

  (:goal (and
    ;; Enforce that a meeting with Betty occurred at the Financial District covering 17:15-18:15,
    ;; and that both participants are present there at the meeting end.
    (meeting_held financial t_1715 t_1815)
    (at traveler financial t_1815)
    (at betty financial t_1815)
  ))
)