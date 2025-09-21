(define (problem integrated-schedule-monday-30min)
  (:domain integrated-scheduling)

  (:objects
    ;; participants / meeting
    diana ethan janet - person
    meeting1 - meeting

    ;; Unified 30-minute timeslots from 09:00 to 16:30 (start times)
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )

  (:init
    ;; Declare meeting and slots
    (meeting meeting1)
    (slot t0900) (slot t0930) (slot t1000) (slot t1030)
    (slot t1100) (slot t1130) (slot t1200) (slot t1230)
    (slot t1300) (slot t1330) (slot t1400) (slot t1430)
    (slot t1500) (slot t1530) (slot t1600) (slot t1630)

    ;; --- Diana's information (agent1) ---
    ;; All slots within 09:00-17:00 were initially marked available
    (slot-available t0900) (slot-available t0930) (slot-available t1000) (slot-available t1030)
    (slot-available t1100) (slot-available t1130) (slot-available t1200) (slot-available t1230)
    (slot-available t1300) (slot-available t1330) (slot-available t1400) (slot-available t1430)
    (slot-available t1500) (slot-available t1530) (slot-available t1600) (slot-available t1630)

    ;; Diana's free slots on Monday (30-minute slots).
    ;; Known busy intervals (from agent1):
    ;; - busy 11:30 (t1130) is NOT free
    ;; - busy 13:00 (t1300) is NOT free
    ;; All other listed slots are free for Diana:
    (free-diana t0900) (free-diana t0930) (free-diana t1000) (free-diana t1030)
    (free-diana t1100)
    ;; (free-diana t1130) omitted -> busy
    (free-diana t1200) (free-diana t1230)
    ;; (free-diana t1300) omitted -> busy
    (free-diana t1330) (free-diana t1400) (free-diana t1430)
    (free-diana t1500) (free-diana t1530) (free-diana t1600) (free-diana t1630)

    ;; --- Ethan's information (agent2) ---
    ;; Ethan has no meetings on Monday -> available for all slots between 09:00 and 17:00
    (available-ethan t0900) (available-ethan t0930) (available-ethan t1000) (available-ethan t1030)
    (available-ethan t1100) (available-ethan t1130) (available-ethan t1200) (available-ethan t1230)
    (available-ethan t1300) (available-ethan t1330) (available-ethan t1400) (available-ethan t1430)
    (available-ethan t1500) (available-ethan t1530) (available-ethan t1600) (available-ethan t1630)

    ;; --- Janet's information (agent3) ---
    ;; All slots are within the allowed window 09:00-17:00
    (within-window t0900) (within-window t0930) (within-window t1000) (within-window t1030)
    (within-window t1100) (within-window t1130) (within-window t1200) (within-window t1230)
    (within-window t1300) (within-window t1330) (within-window t1400) (within-window t1430)
    (within-window t1500) (within-window t1530) (within-window t1600) (within-window t1630)

    ;; Preferred slots for Janet: prefers slots that start before 12:00
    (preferred-janet t0900) (preferred-janet t0930) (preferred-janet t1000)
    (preferred-janet t1030) (preferred-janet t1100) (preferred-janet t1130)

    ;; Janet's busy times (agent3):
    ;; Busy 09:00-10:00 (t0900, t0930) -> those not listed as free
    ;; Busy 12:30-13:00 (t1230)
    ;; Busy 14:00-15:00 (t1400, t1430)
    ;; Busy 15:30-17:00 (t1530, t1600, t1630)
    ;; Free slots for Janet (all slots except the busy ones above)
    (free-janet t1000) (free-janet t1030) (free-janet t1100) (free-janet t1130)
    (free-janet t1200) (free-janet t1300) (free-janet t1330) (free-janet t1500)

    ;; Allow Janet to make a reservation once
    (can-schedule-janet)
  )

  ;; Goal:
  ;; Schedule meeting1 at a slot that is acceptable to all participants.
  ;; We choose t1000 (10:00-10:30) as a representative slot that is:
  ;; - within 09:00-17:00
  ;; - free for Diana (free-diana t1000)
  ;; - available for Ethan (available-ethan t1000)
  ;; - free and preferred for Janet (free-janet t1000 and preferred-janet t1000)
  ;; The plan should execute the three agent-specific reserve actions for t1000 and then finalize.
  (:goal (meeting-scheduled meeting1 t1000))
)