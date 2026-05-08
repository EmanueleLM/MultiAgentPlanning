(define (problem schedule_meeting_instance)
  (:domain meeting_scheduling)

  (:objects
    theresa charles betty - participant
    time_slot_9_00_10_00 time_slot_10_00_11_00 time_slot_11_00_12_00
    time_slot_12_00_13_00 time_slot_13_00_14_00 time_slot_14_00_15_00
    time_slot_15_00_16_00 time_slot_16_00_17_00 - time_slot
    meeting - event
  )

  (:init
    (conflicts_with theresa time_slot_9_00_10_00)
    (conflicts_with theresa time_slot_12_00_13_00)
    (conflicts_with theresa time_slot_14_00_15_00)
    (conflicts_with theresa time_slot_16_00_17_00)
    (conflicts_with charles time_slot_10_00_11_00)
    (conflicts_with charles time_slot_11_00_12_00)
    (conflicts_with charles time_slot_14_00_15_00)
    (conflicts_with betty time_slot_9_00_10_00)
    (conflicts_with betty time_slot_12_00_13_00)
    (conflicts_with betty time_slot_13_00_14_00)
    (conflicts_with betty time_slot_15_00_16_00)
    (possible_slot time_slot_10_00_11_00)
    (possible_slot time_slot_15_00_16_00)

    (available theresa time_slot_10_00_11_00)
    (available theresa time_slot_11_00_12_00)
    (available theresa time_slot_13_00_14_00)
    (available theresa time_slot_15_00_16_00)

    (available charles time_slot_9_00_10_00)
    (available charles time_slot_12_00_13_00)
    (available charles time_slot_13_00_14_00)
    (available charles time_slot_15_00_16_00)
    (available charles time_slot_16_00_17_00)

    (available betty time_slot_10_00_11_00)
    (available betty time_slot_11_00_12_00)
    (available betty time_slot_12_00_13_00)
    (available betty time_slot_14_00_15_00)
    (available betty time_slot_16_00_17_00)
  )
  
  (:goal
    (exists (?t - time_slot) (scheduled meeting ?t))
  )
)