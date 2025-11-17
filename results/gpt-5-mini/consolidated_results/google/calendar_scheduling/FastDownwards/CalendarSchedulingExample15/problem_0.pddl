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
    ; slot, participant, day declarations
    (slot slot-0900-0930) (slot slot-0930-1000) (slot slot-1000-1030) (slot slot-1030-1100)
    (slot slot-1100-1130) (slot slot-1130-1200) (slot slot-1200-1230) (slot slot-1230-1300)
    (slot slot-1300-1330) (slot slot-1330-1400) (slot slot-1400-1430) (slot slot-1430-1500)
    (slot slot-1500-1530) (slot slot-1530-1600) (slot slot-1600-1630) (slot slot-1630-1700)
    (participant Joyce) (participant Christine) (participant Alexander)
    (day Monday)

    ; map every slot to Monday
    (slot-of-day slot-0900-0930 Monday) (slot-of-day slot-0930-1000 Monday)
    (slot-of-day slot-1000-1030 Monday) (slot-of-day slot-1030-1100 Monday)
    (slot-of-day slot-1100-1130 Monday) (slot-of-day slot-1130-1200 Monday)
    (slot-of-day slot-1200-1230 Monday) (slot-of-day slot-1230-1300 Monday)
    (slot-of-day slot-1300-1330 Monday) (slot-of-day slot-1330-1400 Monday)
    (slot-of-day slot-1400-1430 Monday) (slot-of-day slot-1430-1500 Monday)
    (slot-of-day slot-1500-1530 Monday) (slot-of-day slot-1530-1600 Monday)
    (slot-of-day slot-1600-1630 Monday) (slot-of-day slot-1630-1700 Monday)

    ; successor links to enforce ordering/contiguity
    (next slot-0900-0930 slot-0930-1000)
    (next slot-0930-1000 slot-1000-1030)
    (next slot-1000-1030 slot-1030-1100)
    (next slot-1030-1100 slot-1100-1130)
    (next slot-1100-1130 slot-1130-1200)
    (next slot-1130-1200 slot-1200-1230)
    (next slot-1200-1230 slot-1230-1300)
    (next slot-1230-1300 slot-1300-1330)
    (next slot-1300-1330 slot-1330-1400)
    (next slot-1330-1400 slot-1400-1430)
    (next slot-1400-1430 slot-1430-1500)
    (next slot-1430-1500 slot-1500-1530)
    (next slot-1500-1530 slot-1530-1600)
    (next slot-1530-1600 slot-1600-1630)
    (next slot-1600-1630 slot-1630-1700)

    ; availability facts derived from provided free_slots_by_participant
    ; Joyce free slots
    (available Joyce slot-0900-0930) (available Joyce slot-0930-1000)
    (available Joyce slot-1000-1030) (available Joyce slot-1030-1100)
    (available Joyce slot-1130-1200) (available Joyce slot-1200-1230)
    (available Joyce slot-1230-1300) (available Joyce slot-1300-1330)
    (available Joyce slot-1400-1430) (available Joyce slot-1630-1700)

    ; Christine free slots
    (available Christine slot-1200-1230) (available Christine slot-1230-1300)
    (available Christine slot-1300-1330) (available Christine slot-1330-1400)
    (available Christine slot-1400-1430) (available Christine slot-1430-1500)
    (available Christine slot-1500-1530) (available Christine slot-1530-1600)
    (available Christine slot-1600-1630) (available Christine slot-1630-1700)

    ; Alexander free slots
    (available Alexander slot-1100-1130) (available Alexander slot-1130-1200)
    (available Alexander slot-1230-1300) (available Alexander slot-1300-1330)
    (available Alexander slot-1500-1530) (available Alexander slot-1600-1630)

    ; audited selection: only this slot is permitted to be scheduled (strict constraint)
    (audited slot-1230-1300)
  )
  (:goal (and
    (scheduled slot-1230-1300)
    (not (scheduled slot-0900-0930)) (not (scheduled slot-0930-1000))
    (not (scheduled slot-1000-1030)) (not (scheduled slot-1030-1100))
    (not (scheduled slot-1100-1130)) (not (scheduled slot-1130-1200))
    (not (scheduled slot-1200-1230)) ;; 12:00-12:30 must not be scheduled
    (not (scheduled slot-1300-1330)) (not (scheduled slot-1330-1400))
    (not (scheduled slot-1400-1430)) (not (scheduled slot-1430-1500))
    (not (scheduled slot-1500-1530)) (not (scheduled slot-1530-1600))
    (not (scheduled slot-1600-1630)) (not (scheduled slot-1630-1700))
  ))
)