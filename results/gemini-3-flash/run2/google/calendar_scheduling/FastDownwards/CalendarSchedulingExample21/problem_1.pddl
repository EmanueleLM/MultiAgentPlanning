(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling)
  (:objects
    slot_1 slot_2 slot_3 slot_4 slot_5 slot_6 slot_7 slot_8
    slot_9 slot_10 slot_11 slot_12 slot_13 slot_14 slot_15 slot_16 - slot
  )
  (:init
    ;; Time slot sequence from 09:00 to 17:00 (30-min intervals)
    (next slot_1 slot_2)
    (next slot_2 slot_3)
    (next slot_3 slot_4)
    (next slot_4 slot_5)
    (next slot_5 slot_6)
    (next slot_6 slot_7)
    (next slot_7 slot_8)
    (next slot_8 slot_9)
    (next slot_9 slot_10)
    (next slot_10 slot_11)
    (next slot_11 slot_12)
    (next slot_12 slot_13)
    (next slot_13 slot_14)
    (next slot_14 slot_15)
    (next slot_15 slot_16)

    ;; Bobby's availability: wide open the entire day
    (free bobby slot_1)
    (free bobby slot_2)
    (free bobby slot_3)
    (free bobby slot_4)
    (free bobby slot_5)
    (free bobby slot_6)
    (free bobby slot_7)
    (free bobby slot_8)
    (free bobby slot_9)
    (free bobby slot_10)
    (free bobby slot_11)
    (free bobby slot_12)
    (free bobby slot_13)
    (free bobby slot_14)
    (free bobby slot_15)
    (free bobby slot_16)

    ;; Scott's availability: busy 11:30-12:00 (slot 6), 15:30-16:00 (slot 14)
    (free scott slot_1)
    (free scott slot_2)
    (free scott slot_3)
    (free scott slot_4)
    (free scott slot_5)
    ;; slot 6 is busy
    (free scott slot_7)
    (free scott slot_8)
    (free scott slot_9)
    (free scott slot_10)
    (free scott slot_11)
    (free scott slot_12)
    (free scott slot_13)
    ;; slot 14 is busy
    (free scott slot_15)
    (free scott slot_16)

    ;; Kimberly's availability: 
    ;; busy 11:00-12:00 (slots 5, 6), 12:30-13:00 (slot 8), 13:30-14:00 (slot 10), 
    ;; 14:30-15:00 (slot 12), 15:30-17:00 (slots 14, 15, 16)
    (free kimberly slot_1)
    (free kimberly slot_2)
    (free kimberly slot_3)
    (free kimberly slot_4)
    ;; slots 5, 6 are busy
    (free kimberly slot_7)
    ;; slot 8 is busy
    (free kimberly slot_9)
    ;; slot 10 is busy
    (free kimberly slot_11)
    ;; slot 12 is busy
    (free kimberly slot_13)
    ;; slots 14, 15, 16 are busy
  )
  (:goal
    (scheduled)
  )
)