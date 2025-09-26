(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; Objects: three agents and half-hour time slots from 09:00 to 16:30 (inclusive)
  (:objects
    raymond billy donald - agent
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )

  (:init
    ;; slots within Monday work hours (09:00-17:00, half-hour increments)
    (slot t0900) (slot t0930) (slot t1000) (slot t1030)
    (slot t1100) (slot t1130) (slot t1200) (slot t1230)
    (slot t1300) (slot t1330) (slot t1400) (slot t1430)
    (slot t1500) (slot t1530) (slot t1600) (slot t1630)

    ;; AVAILABILITIES (explicit; every busy/blocked interval from inputs has been removed)
    ;; Raymond - busy: 09:00, 11:30, 13:00, 15:00 (these are NOT listed as avail)
    (avail raymond t0930) (avail raymond t1000) (avail raymond t1030)
    (avail raymond t1100) (avail raymond t1200) (avail raymond t1230)
    (avail raymond t1330) (avail raymond t1400) (avail raymond t1430)
    (avail raymond t1530) (avail raymond t1600) (avail raymond t1630)

    ;; Billy - busy: 10:00, 12:00-13:00 (12:00 & 12:30), 16:30-17:00
    ;; Preference: avoid meetings after 15:00 -> treated as hard constraint:
    ;; disallow 15:30, 16:00, 16:30. (So these are NOT listed as avail.)
    (avail billy t0900) (avail billy t0930) (avail billy t1030)
    (avail billy t1100) (avail billy t1130) (avail billy t1300)
    (avail billy t1330) (avail billy t1400) (avail billy t1430)
    (avail billy t1500)

    ;; Donald - busy: 09:00, 10:00-11:00 (10:00 & 10:30), 12:00-13:00 (12:00 & 12:30),
    ;; 14:00, 16:00-17:00 (16:00 & 16:30)
    (avail donald t0930) (avail donald t1100) (avail donald t1130)
    (avail donald t1300) (avail donald t1330) (avail donald t1430)
    (avail donald t1500) (avail donald t1530)
  )

  ;; Goal: schedule the 30-minute meeting at the earliest feasible slot that
  ;; satisfies all hard constraints. Based on the explicit availabilities above,
  ;; the earliest feasible slot is 09:30 (t0930).
  (:goal (and (meeting-at t0930)))
)