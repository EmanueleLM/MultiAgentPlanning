(define (problem schedule-meeting-2025-10-21)
  (:domain meeting-scheduling)
  (:objects
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430 slot-1500 slot-1530 slot-1600 slot-1630 - slot
    alice bob carol - agent
  )
  (:init
    (alice-available slot-0900)
    (alice-available slot-0930)
    (alice-available slot-1000)
    (alice-available slot-1030)
    (alice-available slot-1300)
    (alice-available slot-1330)
    (alice-available slot-1400)
    (alice-available slot-1430)
    (alice-available slot-1500)
    (alice-available slot-1530)

    (bob-available slot-1030)
    (bob-available slot-1100)
    (bob-available slot-1130)
    (bob-available slot-1400)
    (bob-available slot-1430)
    (bob-available slot-1500)

    (carol-available slot-0930)
    (carol-available slot-1000)
    (carol-available slot-1100)
    (carol-available slot-1130)
    (carol-available slot-1200)
    (carol-available slot-1500)
    (carol-available slot-1530)
    (carol-available slot-1600)
    (carol-available slot-1630)

    (slot-free slot-1500)

    (interrupts-bob-morning slot-0900)
    (interrupts-bob-morning slot-0930)
    (interrupts-bob-morning slot-1000)
  )
  (:goal (meeting-done))
)