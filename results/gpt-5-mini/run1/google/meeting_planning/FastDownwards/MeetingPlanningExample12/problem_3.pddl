(define (problem meeting_barbara_instance)
  (:domain meeting_planning_instance)

  (:objects
    ;; Discrete timepoints representing relevant clock times for this instance
    t09_00 t17_44 t18_00 t19_30 t19_45 t21_30 - timepoint

    north_beach alamo_square - location

    traveler barbara - person
  )

  (:init
    ;; start time and traveler's start location
    (current_time t09_00)
    (at traveler north_beach t09_00)

    ;; Barbara's presence at key timepoints within her availability window:
    ;; Barbara is at Alamo Square at 18:00, 19:30 and 21:30 (these endpoints are used to
    ;; satisfy meet preconditions that require the friend to be present at start and end).
    (at barbara alamo_square t18_00)
    (at barbara alamo_square t19_30)
    (at barbara alamo_square t21_30)

    ;; Role/type markers
    (is_agent traveler)
    (is_friend barbara)

    ;; Allowed waiting intervals (coarse steps). The traveler can wait from arrival till just
    ;; before the travel departure used below.
    (allowed_wait t09_00 t17_44)
    ;; Allow waiting while at the meeting location before/after meeting if useful
    (allowed_wait t18_00 t19_30)
    (allowed_wait t19_30 t21_30)

    ;; Explicit travel legs matching the provided travel durations:
    ;; north_beach -> alamo_square takes 16 minutes: depart at t17_44 arrive at t18_00
    (allowed_travel north_beach alamo_square t17_44 t18_00)
    ;; alamo_square -> north_beach takes 15 minutes: depart at t19_30 arrive at t19_45
    (allowed_travel alamo_square north_beach t19_30 t19_45)

    ;; Meeting interval encoding: enforce a 90-minute meeting with Barbara inside her availability.
    ;; The interval t18_00 -> t19_30 is exactly 90 minutes and lies in Barbara's availability window.
    (allowed_meeting_interval t18_00 t19_30)
  )

  ;; Hard goal: ensure Barbara is met (the domain/problem structure enforces that any meeting
  ;; that establishes (met barbara) must use an allowed_meeting_interval of at least 90 minutes).
  (:goal (and
    (met barbara)
  ))
)