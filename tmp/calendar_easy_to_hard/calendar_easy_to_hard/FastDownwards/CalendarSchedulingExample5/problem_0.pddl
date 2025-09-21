(define (problem schedule-meeting-integrated-monday)
  (:domain integrated-scheduling)

  (:objects
    kathryn charlotte lauren - person
    m1 - meeting

    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )

  (:init
    ;; Kathryn's availability (from Kathryn's submission)
    ;; Kathryn blocked: 09:00, 10:30, 11:30, 13:30, 14:00, 16:30
    (available kathryn t0930)
    (available kathryn t1000)
    (available kathryn t1100)
    (available kathryn t1200)
    (available kathryn t1230)
    (available kathryn t1300)
    (available kathryn t1430)
    (available kathryn t1500)
    (available kathryn t1530)
    (available kathryn t1600)

    ;; Charlotte's availability (from Charlotte's submission)
    ;; Charlotte blocked t1200 and prefers not to meet after 13:30, so available up to t1330 (excluding t1200)
    (available charlotte t0900)
    (available charlotte t0930)
    (available charlotte t1000)
    (available charlotte t1030)
    (available charlotte t1100)
    (available charlotte t1130)
    (available charlotte t1230)
    (available charlotte t1300)
    (available charlotte t1330)

    ;; Lauren's availability (from Lauren's submission)
    ;; Lauren available at: 10:00, 10:30, 11:00, 11:30, 12:30, 13:00, 14:30, 16:00
    ;; (mapped to the unified time objects)
    (available lauren t1000)
    (available lauren t1030)
    (available lauren t1100)
    (available lauren t1130)
    (available lauren t1230)
    (available lauren t1300)
    (available lauren t1430)
    (available lauren t1600)

    ;; Meeting initial flags (covering the different encodings so any agent action preconditions are satisfied)
    (not-scheduled)
    (unscheduled m1)
    ;; note: meeting-scheduled is false initially (not asserted)
  )

  ;; Goal: a single meeting scheduled for the group
  (:goal (meeting-scheduled))
)