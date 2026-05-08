(define (problem MeetingPlanningExample8)
  (:domain meeting_planning)
  (:objects
    chinatown marina_district - location
    t0900 t0912 t1057 - timestamp
    stephanie - person
  )

  (:init
    ;; The user starts at Chinatown at 9:00 AM
    (is_at chinatown)
    (time_at t0900)

    ;; Travel from Chinatown to Marina District takes 12 minutes
    ;; Arriving at Marina District at 9:12 AM
    (can_travel chinatown marina_district t0900 t0912)

    ;; Stephanie is at Marina District from 8:00 AM to 3:00 PM
    ;; The goal requires a meeting of at least 105 minutes.
    ;; A meeting from 9:12 AM to 10:57 AM satisfies the 105-minute requirement.
    ;; 10:57 AM is before her departure time of 3:00 PM.
    (can_meet stephanie marina_district t0912 t1057)
  )

  (:goal
    (and
      (met stephanie)
    )
  )
)