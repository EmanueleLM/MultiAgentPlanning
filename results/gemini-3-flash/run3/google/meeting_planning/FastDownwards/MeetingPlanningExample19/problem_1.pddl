(define (problem meet_john_in_sf)
  (:domain meeting_planning)
  (:objects
    golden_gate_park pacific_heights - location
    t0900 t0916 t1945 t2030 t2045 - time
  )

  (:init
    ;; Starting state: 9:00 AM at Golden Gate Park
    (at_location golden_gate_park)
    (time_at t0900)

    ;; Travel possibilities
    ;; GGP to PH takes 16 minutes
    (can_travel golden_gate_park pacific_heights t0900 t0916)
    
    ;; PH to GGP takes 15 minutes
    (can_travel pacific_heights golden_gate_park t2030 t2045)

    ;; Waiting possibilities
    ;; Wait between 9:16 AM and 7:45 PM (19:45)
    (next t0916 t1945)
    ;; Wait between 7:45 PM and 8:30 PM (to allow for other actions or just passage of time)
    (next t1945 t2030)
    ;; Wait between 8:30 PM and 8:45 PM
    (next t2030 t2045)

    ;; Meeting possibilities
    ;; John is at Pacific Heights from 7:45 PM (19:45) to 8:45 PM (20:45)
    ;; Meeting him for 45 minutes starting at 19:45 takes us to 20:30
    (can_meet_john pacific_heights t1945 t2030)
  )

  (:goal
    (and
      (met_john)
    )
  )
)