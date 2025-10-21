(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; Slots represent 30-minute meeting start times from 09:00 up to 16:30 inclusive.
  (:objects
    slot0900 slot0930 slot1000 slot1030 slot1100 slot1130 slot1200 slot1230
    slot1300 slot1330 slot1400 slot1430 slot1500 slot1530 slot1600 slot1630 - slot
  )

  (:init
    ;; No meeting scheduled initially
    (unscheduled)

    ;; Benjamin: free entire day 09:00-17:00 but does not want to meet after 09:30.
    ;; Interpreted as allowed start times: 09:00 and 09:30 only.
    (available benjamin slot0900)
    (available benjamin slot0930)

    ;; Hannah: free entire day 09:00-17:00 (all slots allowed)
    (available hannah slot0900)
    (available hannah slot0930)
    (available hannah slot1000)
    (available hannah slot1030)
    (available hannah slot1100)
    (available hannah slot1130)
    (available hannah slot1200)
    (available hannah slot1230)
    (available hannah slot1300)
    (available hannah slot1330)
    (available hannah slot1400)
    (available hannah slot1430)
    (available hannah slot1500)
    (available hannah slot1530)
    (available hannah slot1600)
    (available hannah slot1630)

    ;; Brenda: busy during 09:30-10:00, 11:30-12:30, and 14:00-16:30.
    ;; Busy slots (start times) removed: 09:30, 11:30, 12:00, 14:00, 14:30, 15:00, 15:30, 16:00.
    ;; Remaining available start times:
    (available brenda slot0900)
    (available brenda slot1000)
    (available brenda slot1030)
    (available brenda slot1100)
    (available brenda slot1230)
    (available brenda slot1300)
    (available brenda slot1330)
    (available brenda slot1630)
  )

  ;; Goal: produce a concrete start time that is feasible for all participants.
  ;; Given the hard constraints above, the only common feasible start is 09:00.
  (:goal (scheduled slot0900))
)