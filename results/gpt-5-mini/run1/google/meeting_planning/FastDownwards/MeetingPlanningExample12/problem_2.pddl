(define (problem meeting_barbara_instance)
  (:domain meeting_planning_instance)

  (:objects
    ;; Symbolic timepoints chosen to represent the relevant clock times for this instance.
    t09_00 t17_44 t18_00 t19_30 t21_30 - timepoint

    north_beach alamo_square - location

    traveler barbara - person
  )

  (:init
    ;; start time and traveler's start location
    (current_time t09_00)
    (at traveler north_beach t09_00)

    ;; Barbara is present at Alamo Square at the meeting boundary points we will use.
    ;; Including both start and end timepoints for the meeting ensures the meet action's
    ;; preconditions (friend present at both endpoints) can be satisfied.
    (at barbara alamo_square t18_00)
    (at barbara alamo_square t19_30)
    (at barbara alamo_square t21_30)

    ;; Role markers to prevent unintended bindings (ensure only the traveler acts as agent).
    (is_agent traveler)
    (is_friend barbara)

    ;; Allowed coarse waits advancing the global time from morning toward the travel departure.
    (allowed_wait t09_00 t17_44)
    ;; Optionally allow waiting after the main meeting (coarse).
    (allowed_wait t19_30 t21_30)

    ;; Explicit travel leg that respects the provided travel duration:
    ;; north_beach -> alamo_square takes 16 minutes: depart at t17_44, arrive at t18_00.
    (allowed_travel north_beach alamo_square t17_44 t18_00)

    ;; Meeting interval encoding: Barbara must be met for at least 90 minutes;
    ;; the 18:00-19:30 interval is a 90-minute slot inside Barbara's availability window.
    (allowed_meeting_interval t18_00 t19_30)
  )

  ;; Hard goal: record that Barbara is met (the domain/problem enforce the 90-minute meeting).
  (:goal (and
    (met barbara)
  ))
)