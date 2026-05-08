(define (problem schedule_team_meeting_monday)
  (:domain calendar_scheduling)

  (:objects
    ;; 30-minute start slots from 09:00 to 16:30 (inclusive) — meeting duration is 30 minutes.
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )

  (:init
    ;; work-hour start slots
    (slot_within_workhours t0900) (slot_within_workhours t0930)
    (slot_within_workhours t1000) (slot_within_workhours t1030)
    (slot_within_workhours t1100) (slot_within_workhours t1130)
    (slot_within_workhours t1200) (slot_within_workhours t1230)
    (slot_within_workhours t1300) (slot_within_workhours t1330)
    (slot_within_workhours t1400) (slot_within_workhours t1430)
    (slot_within_workhours t1500) (slot_within_workhours t1530)
    (slot_within_workhours t1600) (slot_within_workhours t1630)

    ;; Bobby prefers to avoid meetings starting at or after 15:00.
    ;; Allowed slots are strictly before 15:00 (i.e., up to 14:30 inclusive).
    (allowed_by_bobby t0900) (allowed_by_bobby t0930)
    (allowed_by_bobby t1000) (allowed_by_bobby t1030)
    (allowed_by_bobby t1100) (allowed_by_bobby t1130)
    (allowed_by_bobby t1200) (allowed_by_bobby t1230)
    (allowed_by_bobby t1300) (allowed_by_bobby t1330)
    (allowed_by_bobby t1400) (allowed_by_bobby t1430)

    ;; Existing busy slots for each participant (as 30-minute start slots).
    ;; Lisa: 09:00-10:00 (t0900,t0930), 10:30-11:30 (t1030,t1100),
    ;;       12:30-13:00 (t1230), 16:00-16:30 (t1600)
    (busy_existing lisa t0900)
    (busy_existing lisa t0930)
    (busy_existing lisa t1030)
    (busy_existing lisa t1100)
    (busy_existing lisa t1230)
    (busy_existing lisa t1600)

    ;; Bobby: 09:00-09:30 (t0900), 10:00-10:30 (t1000),
    ;;        11:30-12:00 (t1130), 15:00-15:30 (t1500)
    (busy_existing bobby t0900)
    (busy_existing bobby t1000)
    (busy_existing bobby t1130)
    (busy_existing bobby t1500)

    ;; Randy: 09:30-10:00 (t0930), 10:30-11:00 (t1030),
    ;;        11:30-12:30 (t1130,t1200), 13:00-13:30 (t1300),
    ;;        14:30-15:30 (t1430,t1500), 16:00-16:30 (t1600)
    (busy_existing randy t0930)
    (busy_existing randy t1030)
    (busy_existing randy t1130)
    (busy_existing randy t1200)
    (busy_existing randy t1300)
    (busy_existing randy t1430)
    (busy_existing randy t1500)
    (busy_existing randy t1600)
  )

  ;; Goal: schedule the team meeting at some allowed slot (one action achieves this).
  (:goal (scheduled team_meeting))
)