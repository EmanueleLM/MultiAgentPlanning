(define (problem schedule-monday)
  (:domain meeting-scheduler)
  (:objects
    joyce christine alexander - participant
    slot-0900-0930 slot-0930-1000 slot-1000-1030 slot-1030-1100
    slot-1100-1130 slot-1130-1200 slot-1200-1230 slot-1230-1300
    slot-1300-1330 slot-1330-1400 slot-1400-1430 slot-1430-1500
    slot-1500-1530 slot-1530-1600 slot-1600-1630 slot-1630-1700 - slot
    monday - day
  )

  (:init
    (day monday)
    (participant joyce) (participant christine) (participant alexander)

    (is-slot slot-0900-0930) (is-slot slot-0930-1000) (is-slot slot-1000-1030) (is-slot slot-1030-1100)
    (is-slot slot-1100-1130) (is-slot slot-1130-1200) (is-slot slot-1200-1230) (is-slot slot-1230-1300)
    (is-slot slot-1300-1330) (is-slot slot-1330-1400) (is-slot slot-1400-1430) (is-slot slot-1430-1500)
    (is-slot slot-1500-1530) (is-slot slot-1530-1600) (is-slot slot-1600-1630) (is-slot slot-1630-1700)

    (slot-of-day slot-0900-0930 monday) (slot-of-day slot-0930-1000 monday)
    (slot-of-day slot-1000-1030 monday) (slot-of-day slot-1030-1100 monday)
    (slot-of-day slot-1100-1130 monday) (slot-of-day slot-1130-1200 monday)
    (slot-of-day slot-1200-1230 monday) (slot-of-day slot-1230-1300 monday)
    (slot-of-day slot-1300-1330 monday) (slot-of-day slot-1330-1400 monday)
    (slot-of-day slot-1400-1430 monday) (slot-of-day slot-1430-1500 monday)
    (slot-of-day slot-1500-1530 monday) (slot-of-day slot-1530-1600 monday)
    (slot-of-day slot-1600-1630 monday) (slot-of-day slot-1630-1700 monday)

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

    ; Joyce busy: 11:00-11:30, 13:30-14:00, 14:30-16:30
    (available joyce slot-0900-0930) (available joyce slot-0930-1000)
    (available joyce slot-1000-1030) (available joyce slot-1030-1100)
    (available joyce slot-1130-1200) (available joyce slot-1200-1230)
    (available joyce slot-1230-1300) (available joyce slot-1300-1330)
    (available joyce slot-1400-1430) (available joyce slot-1630-1700)

    ; Christine: no meetings but cannot meet before 12:00
    (available christine slot-1200-1230) (available christine slot-1230-1300)
    (available christine slot-1300-1330) (available christine slot-1330-1400)
    (available christine slot-1400-1430) (available christine slot-1430-1500)
    (available christine slot-1500-1530) (available christine slot-1530-1600)
    (available christine slot-1600-1630) (available christine slot-1630-1700)

    ; Alexander busy: 09:00-11:00, 12:00-12:30, 13:30-15:00, 15:30-16:00, 16:30-17:00
    (available alexander slot-1100-1130) (available alexander slot-1130-1200)
    (available alexander slot-1230-1300) (available alexander slot-1300-1330)
    (available alexander slot-1500-1530) (available alexander slot-1600-1630)

    ; Auditor-selected slot (exact audited selection)
    (audited-slot slot-1230-1300)
  )

  (:goal (and
    (scheduled-on slot-1230-1300)
  ))
)