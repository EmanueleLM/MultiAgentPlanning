(define (problem schedule_meeting_instance)
  (:domain meeting_scheduling)

  (:objects
    theresa charles betty - participant
    time_slot_9_10 time_slot_10_11 time_slot_11_12
    time_slot_12_13 time_slot_13_14 time_slot_14_15
    time_slot_15_16 time_slot_16_17 - time_slot
    meeting - event
  )

  (:init
    (conflicts_with theresa time_slot_9_10)
    (conflicts_with theresa time_slot_12_13)
    (conflicts_with theresa time_slot_14_15)
    (conflicts_with theresa time_slot_16_17)
    (conflicts_with charles time_slot_10_11)
    (conflicts_with charles time_slot_11_12)
    (conflicts_with charles time_slot_14_15)
    (conflicts_with betty time_slot_9_10)
    (conflicts_with betty time_slot_12_13)
    (conflicts_with betty time_slot_13_14)
    (conflicts_with betty time_slot_15_16)

    (possible_slot time_slot_10_11)
    (possible_slot time_slot_11_12)
    (possible_slot time_slot_13_14)
    (possible_slot time_slot_15_16)

    (available theresa time_slot_10_11)
    (available theresa time_slot_11_12)
    (available theresa time_slot_13_14)
    (available theresa time_slot_15_16)

    (available charles time_slot_9_10)
    (available charles time_slot_11_12)
    (available charles time_slot_13_14)
    (available charles time_slot_15_16)
    (available charles time_slot_16_17)

    (available betty time_slot_10_11)
    (available betty time_slot_11_12)
    (available betty time_slot_12_13)
    (available betty time_slot_14_15)
    (available betty time_slot_16_17)
  )

  (:goal
    (exists (?t - time_slot) (scheduled meeting ?t))
  )
)