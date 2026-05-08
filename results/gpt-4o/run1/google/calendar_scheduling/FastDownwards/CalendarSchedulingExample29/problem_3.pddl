(define (problem schedule_meeting_instance)
  (:domain meeting_scheduling)
  (:objects 
    madison diana shirley - person
    slot_9_30_to_10_00 slot_10_00_to_11_00
    slot_11_30_to_12_00 slot_12_00_to_13_00
    slot_13_00_to_14_00 slot_14_00_to_15_00
    slot_15_00_to_16_00 slot_16_00_to_17_00 - time_slot
  )
  (:init
    (busy madison slot_9_30_to_10_00)
    (busy madison slot_11_30_to_12_00)
    (busy diana slot_11_00_to_11_30)
    (busy diana slot_13_00_to_13_30)
    (busy shirley slot_9_00_to_12_00)
    (busy shirley slot_13_30_to_15_00)
    (busy shirley slot_15_30_to_17_00)
    (slot_before slot_9_30_to_10_00 slot_10_00_to_11_00)
    (slot_before slot_10_00_to_11_00 slot_11_30_to_12_00)
    (slot_before slot_12_00_to_13_00 slot_13_00_to_14_00)
    (slot_before slot_13_00_to_14_00 slot_14_00_to_15_00)
    (slot_before slot_14_00_to_15_00 slot_15_00_to_16_00)
    (slot_before slot_15_00_to_16_00 slot_16_00_to_17_00)
  )
  (:goal
    (meeting_scheduled)
  )
)