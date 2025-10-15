(define (problem schedule-meeting-2025-10-21)
  (:domain meeting-scheduling)

  (:objects
    ;; 30-minute slots from 09:00 to 16:30
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430 slot-1500 slot-1530 slot-1600 slot-1630 - slot

    alice bob carol - agent
  )

  (:init
    ;; declare slots
    (slot slot-0900) (slot slot-0930) (slot slot-1000) (slot slot-1030)
    (slot slot-1100) (slot slot-1130) (slot slot-1200) (slot slot-1230)
    (slot slot-1300) (slot slot-1330) (slot slot-1400) (slot slot-1430)
    (slot slot-1500) (slot slot-1530) (slot slot-1600) (slot slot-1630)

    ;; Per-agent availability (explicit, namespaced).
    ;; Alice: Available 09:00-11:00 => slots 09:00,09:30,10:00,10:30
    (alice-available slot-0900)
    (alice-available slot-0930)
    (alice-available slot-1000)
    (alice-available slot-1030)
    ;; Alice: Available 13:00-16:00 => slots 13:00,13:30,14:00,14:30,15:00,15:30
    (alice-available slot-1300)
    (alice-available slot-1330)
    (alice-available slot-1400)
    (alice-available slot-1430)
    (alice-available slot-1500)
    (alice-available slot-1530)

    ;; Bob: Available 10:30-12:00 => 10:30,11:00,11:30
    (bob-available slot-1030)
    (bob-available slot-1100)
    (bob-available slot-1130)
    ;; Bob: Available 14:00-15:30 => 14:00,14:30,15:00
    (bob-available slot-1400)
    (bob-available slot-1430)
    (bob-available slot-1500)

    ;; Carol: Available 09:30-10:30 => 09:30,10:00
    (carol-available slot-0930)
    (carol-available slot-1000)
    ;; Carol: Available 11:00-12:30 => 11:00,11:30,12:00
    (carol-available slot-1100)
    (carol-available slot-1130)
    (carol-available slot-1200)
    ;; Carol: Available 15:00-17:00 => 15:00,15:30,16:00,16:30
    (carol-available slot-1500)
    (carol-available slot-1530)
    (carol-available slot-1600)
    (carol-available slot-1630)

    ;; Mark slots that are free for all participants (precomputed intersection)
    ;; Intersection of alice-available, bob-available, carol-available yields only slot-1500
    (slot-free slot-1500)

    ;; Mark slots that would interrupt Bob's morning commitments (starts before 10:30)
    ;; Bob has important morning commitments before 10:30 => slots starting at 09:00,09:30,10:00 are interrupting
    (interrupts-bob-morning slot-0900)
    (interrupts-bob-morning slot-0930)
    (interrupts-bob-morning slot-1000)

    ;; Note: no other slot-free facts are added; the "no earlier slot-free" preconditions
    ;; ensure the planner picks the earliest feasible slot (here: slot-1500).
  )

  ;; Goal: achieve meeting-done (any schedule action that enforces earliest slot will satisfy it)
  (:goal (meeting-done))
)