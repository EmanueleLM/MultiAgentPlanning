(define (problem calendar-scheduling-problem)
  (:domain calendar-scheduling)
  (:objects
    slot_09_00 slot_09_30 slot_10_00 slot_10_30 slot_11_00 slot_11_30
    slot_12_00 slot_12_30 slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - slot
  )
  (:init
    ; 09:00
    (available donna slot_09_00)
    ; 09:30
    (available donna slot_09_30)
    (available helen slot_09_30)
    ; 10:00
    (available margaret slot_10_00)
    (available donna slot_10_00)
    ; 10:30
    (available donna slot_10_30)
    ; 11:00
    (available margaret slot_11_00)
    (available donna slot_11_00)
    ; 11:30
    (available donna slot_11_30)
    (available helen slot_11_30)
    ; 12:00
    (available margaret slot_12_00)
    (available donna slot_12_00)
    (available helen slot_12_00)
    ; 12:30
    (available margaret slot_12_30)
    (available donna slot_12_30)
    (available helen slot_12_30)
    ; 13:00
    (available donna slot_13_00)
    ; 13:30
    (available margaret slot_13_30)
    (available donna slot_13_30)
    ; 14:00
    (available margaret slot_14_00)
    (available donna slot_14_00)
    ; 14:30
    (available margaret slot_14_30)
    ; 15:00
    (available donna slot_15_00)
    ; 15:30
    (available margaret slot_15_30)
    (available donna slot_15_30)
    ; 16:00
    (available margaret slot_16_00)
    ; 16:30
    (available margaret slot_16_30)
    (available donna slot_16_30)
  )
  (:goal (meeting_scheduled))
)