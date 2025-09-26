(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)

  (:objects
    ; participants
    elijah janet brian carl timothy - participant
    ; 30-minute slots from 09:00 to 17:00
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430 slot-1500 slot-1530 slot-1600 slot-1630 - slot
    meeting1 - meeting
  )

  (:init
    ; declare types
    (participant elijah) (participant janet) (participant brian) (participant carl) (participant timothy)
    (slot slot-0900) (slot slot-0930) (slot slot-1000) (slot slot-1030) (slot slot-1100) (slot slot-1130)
    (slot slot-1200) (slot slot-1230) (slot slot-1300) (slot slot-1330) (slot slot-1400) (slot slot-1430)
    (slot slot-1500) (slot slot-1530) (slot slot-1600) (slot slot-1630)
    (meeting meeting1)

    ; Availability (free) facts derived strictly from participants' stated busy intervals.
    ; Elijah busy: 10:00-11:00 (slot-1000, slot-1030), 12:00-12:30 (slot-1200), 15:00-15:30 (slot-1500)
    ; Elijah free slots:
    (free elijah slot-0900) (free elijah slot-0930)
    (free elijah slot-1100) (free elijah slot-1130)
    (free elijah slot-1230) (free elijah slot-1300) (free elijah slot-1330)
    (free elijah slot-1400) (free elijah slot-1430)
    (free elijah slot-1530) (free elijah slot-1600) (free elijah slot-1630)

    ; Janet busy: 09:30-10:30 (slot-0930, slot-1000), 13:30-15:30 (slot-1330, slot-1400, slot-1430, slot-1500)
    ; Janet free slots:
    (free janet slot-0900)
    (free janet slot-1030) (free janet slot-1100) (free janet slot-1130)
    (free janet slot-1200) (free janet slot-1230) (free janet slot-1300)
    (free janet slot-1530) (free janet slot-1600) (free janet slot-1630)

    ; Brian: "No meetings on Monday" -> no free slots are asserted for Brian (treated as hard constraint)

    ; Carl busy: 09:30-16:30 (slots starting at 0930 up to 1600 are unavailable)
    ; Carl free slots:
    (free carl slot-0900) (free carl slot-1630)

    ; Timothy busy: 10:30-12:00 (slot-1030, slot-1100, slot-1130), 13:30-14:00 (slot-1330),
    ; 14:30-16:00 (slot-1430, slot-1500, slot-1530), 16:30-17:00 (slot-1630)
    ; Timothy free slots:
    (free timothy slot-0900) (free timothy slot-0930) (free timothy slot-1000)
    (free timothy slot-1200) (free timothy slot-1230) (free timothy slot-1300)
    (free timothy slot-1400) (free timothy slot-1600)
  )

  ; Goal: schedule the single meeting (meeting1) (i.e., assign it to some slot).
  ; The action enforces that all participants must be free at the chosen slot.
  (:goal (assigned meeting1))

  (:metric maximize (total-time)) ; placeholder metric (ignored by planners that don't use it)
)