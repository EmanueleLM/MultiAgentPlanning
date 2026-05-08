(define (problem schedule_meeting_instance)
  (:domain meeting_scheduling)
  (:objects 
    madison diana shirley - person
    slot_9_00_to_10_00 slot_10_00_to_11_00
    slot_11_00_to_12_00 slot_12_00_to_13_00
    slot_13_00_to_14_00 slot_14_00_to_15_00
    slot_15_00_to_16_00 slot_16_00_to_17_00 - time_slot
  )
  (:init
    (busy madison slot_9_00_to_10_00)
    (busy madison slot_11_00_to_12_00)
    (busy diana slot_11_00_to_12_00)
    (busy diana slot_13_00_to_14_00)
    (busy shirley slot_9_00_to_12_00)
    (busy shirley slot_13_00_to_15_00)
    (busy shirley slot_15_00_to_17_00)
    (next_slot slot_9_00_to_10_00 slot_10_00_to_11_00)
    (next_slot slot_10_00_to_11_00 slot_11_00_to_12_00)
    (next_slot slot_11_00_to_12_00 slot_12_00_to_13_00)
    (next_slot slot_12_00_to_13_00 slot_13_00_to_14_00)
    (next_slot slot_13_00_to_14_00 slot_14_00_to_15_00)
    (next_slot slot_14_00_to_15_00 slot_15_00_to_16_00)
    (next_slot slot_15_00_to_16_00 slot_16_00_to_17_00)
  )
  (:goal
    (meeting_scheduled)
  )
)