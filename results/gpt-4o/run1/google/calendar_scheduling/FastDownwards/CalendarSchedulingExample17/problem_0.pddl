(define (problem schedule_meeting_instance)
  (:domain meeting_scheduling)
  (:objects
    margaret donna helen - participant
    slot_9_00_to_9_30 slot_9_30_to_10_00 slot_10_00_to_10_30
    slot_10_30_to_11_00 slot_11_00_to_11_30 slot_11_30_to_12_00
    slot_12_00_to_12_30 slot_12_30_to_13_00 slot_13_00_to_13_30
    slot_13_30_to_14_00 slot_14_00_to_14_30 slot_14_30_to_15_00
    slot_15_00_to_15_30 slot_15_30_to_16_00 slot_16_00_to_16_30
    slot_16_30_to_17_00 - time_slot
  )
  (:init
    ;; Margaret's availability - only list available times
    (available margaret slot_9_30_to_10_00)
    (available margaret slot_10_00_to_10_30)
    (available margaret slot_11_00_to_11_30)
    (available margaret slot_12_00_to_12_30)
    (available margaret slot_12_30_to_13_00)
    (available margaret slot_13_30_to_14_00)
    (available margaret slot_14_00_to_14_30)
    (available margaret slot_15_30_to_16_00)
    (available margaret slot_16_30_to_17_00)

    ;; Donna's availability
    (available donna slot_9_00_to_9_30)
    (available donna slot_9_30_to_10_00)
    (available donna slot_10_00_to_10_30)
    (available donna slot_10_30_to_11_00)
    (available donna slot_11_00_to_11_30)
    (available donna slot_11_30_to_12_00)
    (available donna slot_12_00_to_12_30)
    (available donna slot_12_30_to_13_00)
    (available donna slot_13_00_to_13_30)
    (available donna slot_13_30_to_14_00)
    (available donna slot_15_00_to_15_30)
    (available donna slot_15_30_to_16_00)
    (available donna slot_16_30_to_17_00)

    ;; Helen's availability
    (available helen slot_9_30_to_10_00)
    (available helen slot_11_30_to_12_00)
    (available helen slot_12_00_to_12_30)
    (available helen slot_12_30_to_13_00)
    (available helen slot_13_00_to_13_30)
    
    ;; Helen's preference not to meet after 13:30
    (not (available helen slot_13_30_to_14_00))
    (not (available helen slot_14_00_to_14_30))
    (not (available helen slot_14_30_to_15_00))
    (not (available helen slot_15_00_to_15_30))
    (not (available helen slot_15_30_to_16_00))
    (not (available helen slot_16_00_to_16_30))
    (not (available helen slot_16_30_to_17_00))
  )

  (:goal
    (exists (?t - time_slot) (meeting_scheduled ?t))
  )
)