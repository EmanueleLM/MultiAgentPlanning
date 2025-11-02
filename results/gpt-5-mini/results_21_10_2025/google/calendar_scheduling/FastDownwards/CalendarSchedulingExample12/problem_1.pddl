(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; Objects: participants and discrete 60-min start times from 09:00 to 16:00 inclusive
  (:objects
    david debra kevin - person
    t0900 t1000 t1100 t1200 t1300 t1400 t1500 t1600 - time
  )

  (:init
    ;; David: free entire workday -> can start a 60-min meeting any hour 09:00-16:00
    (available david t0900) (available david t1000) (available david t1100) (available david t1200)
    (available david t1300) (available david t1400) (available david t1500) (available david t1600)

    ;; Debra: busy 09:30-10:00, 11:00-11:30, 12:00-13:00, 14:00-14:30, 16:00-16:30
    ;; For 60-min meeting starts on the hour, these busy intervals forbid starts at: 09:00, 11:00, 12:00, 14:00, 16:00
    ;; Therefore Debra is available at: 10:00, 13:00, 15:00
    (available debra t1000)
    (available debra t1300)
    (available debra t1500)

    ;; Kevin: busy 09:00-12:00 and 14:00-17:00
    ;; This forbids starts 09:00,10:00,11:00,14:00,15:00,16:00 -> Kevin available at 12:00 and 13:00
    (available kevin t1200)
    (available kevin t1300)

    ;; No meeting scheduled/confirmed at start
    ;; (meeting-scheduled ...) and (meeting-confirmed) are absent initially
  )

  ;; Goal: ensure that some valid meeting is confirmed (no explicit start time in the goal).
  ;; The encoding of available start times makes only one common feasible start (t1300).
  (:goal (meeting-confirmed))
)