(define (problem schedule_meeting_instance)
  (:domain meeting_scheduling)

  (:objects
    theresa charles betty - participant
    time_slot_10_00 time_slot_11_00 time_slot_13_00 time_slot_15_00 - time_slot
  )

  (:init
    (conflicts theresa time_slot_9_00)
    (conflicts theresa time_slot_12_00)
    (conflicts theresa time_slot_14_00)
    (conflicts theresa time_slot_16_00)
    (conflicts charles time_slot_10_00)
    (conflicts charles time_slot_11_00)
    (conflicts charles time_slot_14_00)
    (conflicts betty time_slot_9_00)
    (conflicts betty time_slot_12_00)
    (conflicts betty time_slot_13_00)
    (conflicts betty time_slot_15_00)

    (free_slot time_slot_10_00)
    (free_slot time_slot_11_00)
    (free_slot time_slot_13_00)
    (free_slot time_slot_15_00)

    ; Available slots for each participant
    (available theresa time_slot_10_00)
    (available theresa time_slot_11_00)
    (available theresa time_slot_13_00)
    (available theresa time_slot_15_00)

    (available charles time_slot_9_00)
    (available charles time_slot_11_00)
    (available charles time_slot_13_00)
    (available charles time_slot_15_00)
    (available charles time_slot_16_00)

    (available betty time_slot_10_00)
    (available betty time_slot_11_00)
    (available betty time_slot_12_00)
    (available betty time_slot_14_00)
    (available betty time_slot_16_00)
  )

  (:goal
    (exists (?t - time_slot) (and 
      (scheduled theresa ?t)
      (scheduled charles ?t)
      (scheduled betty ?t))
    )
  )