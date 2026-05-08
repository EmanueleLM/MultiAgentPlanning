(define (problem schedule-monday)
  (:domain meeting-scheduler)
  (:objects
    Joyce Christine Alexander - participant
    slot-0900-0930 slot-0930-1000 slot-1000-1030 slot-1030-1100
    slot-1100-1130 slot-1130-1200 slot-1200-1230 slot-1230-1300
    slot-1300-1330 slot-1330-1400 slot-1400-1430 slot-1430-1500
    slot-1500-1530 slot-1530-1600 slot-1600-1630 slot-1630-1700 - slot
    Monday - day
  )

  (:init
    ;; slot, participant, day declarations
    (slot slot-0900-0930) (slot slot-0930-1000) (slot slot-1000-1030) (slot slot-1030-1100)
    (slot slot-1100-1130) (slot slot-1130-1200) (slot slot-1200-1230) (slot slot-1230-1300)
    (slot slot-1300-1330) (slot slot-1330-1400) (slot slot-1400-1430) (slot slot-1430-1500)
    (slot slot-1500-1530) (slot slot-1530-1600) (slot slot-1600-1630) (slot slot-1630-1700)

    (participant Joyce) (participant Christine) (participant Alexander)
    (day Monday)

    ;; map every slot to Monday (work window 09:00-17:00)
    (slot-of-day slot-0900-0930 Monday) (slot-of-day slot-0930-1000 Monday)
    (slot-of-day slot-1000-1030 Monday) (slot-of-day slot-1030-1100 Monday)
    (slot-of-day slot-1100-1130 Monday) (slot-of-day slot-1130-1200 Monday)
    (slot-of-day slot-1200-1230 Monday) (slot-of-day slot-1230-1300 Monday)
    (slot-of-day slot-1300-1330 Monday) (slot-of-day slot-1330-1400 Monday)
    (slot-of-day slot-1400-1430 Monday) (slot-of-day slot-1430-1500 Monday)
    (slot-of-day slot-1500-1530 Monday) (slot-of-day slot-1530-1600 Monday)
    (slot-of-day slot-1600-1630 Monday) (slot-of-day slot-1630-1700 Monday)

    ;; Availability facts derived from participants' schedules and Christine's not-before-12:00 constraint.
    ;; Joyce free slots (busy: 11:00-11:30, 13:30-14:00, 14:30-16:30)
    (available Joyce slot-0900-0930) (available Joyce slot-0930-1000)
    (available Joyce slot-1000-1030) (available Joyce slot-1030-1100)
    (available Joyce slot-1130-1200) (available Joyce slot-1200-1230)
    (available Joyce slot-1230-1300) (available Joyce slot-1300-1330)
    (available Joyce slot-1400-1430) (available Joyce slot-1630-1700)

    ;; Christine free slots: no meetings but cannot meet before 12:00
    (available Christine slot-1200-1230) (available Christine slot-1230-1300)
    (available Christine slot-1300-1330) (available Christine slot-1330-1400)
    (available Christine slot-1400-1430) (available Christine slot-1430-1500)
    (available Christine slot-1500-1530) (available Christine slot-1530-1600)
    (available Christine slot-1600-1630) (available Christine slot-1630-1700)

    ;; Alexander free slots (busy: 09:00-11:00, 12:00-12:30, 13:30-15:00, 15:30-16:00, 16:30-17:00)
    (available Alexander slot-1100-1130) (available Alexander slot-1130-1200)
    (available Alexander slot-1230-1300) (available Alexander slot-1300-1330)
    (available Alexander slot-1500-1530) (available Alexander slot-1600-1630)

    ;; Audited (allowed) slot: only the selected solution is permitted by the auditor.
    (audited slot-1230-1300)
  )

  ;; Goal: a meeting has been scheduled. The audited fact and per-participant availability
  ;; force the only executable schedule action to be the selected 12:30-13:00 slot with all three participants.
  (:goal (and
    (scheduled)
  ))
)