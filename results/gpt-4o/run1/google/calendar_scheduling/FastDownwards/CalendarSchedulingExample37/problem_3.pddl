(define (problem meeting_scheduling_instance)
  (:domain meeting_scheduling)
  (:objects
    gregory teresa carol - participant
    slot_9_9_30 slot_9_30_10 slot_10_10_30 slot_10_30_11
    slot_11_11_30 slot_11_30_12 slot_12_12_30 slot_12_30_13
    slot_13_13_30 slot_13_30_14 slot_14_14_30 slot_14_30_15
    slot_15_15_30 slot_15_30_16 slot_16_16_30 slot_16_30_17 - time_slot
  )
  (:init
    (available slot_9_9_30)
    (available slot_9_30_10)
    (available slot_10_10_30)
    (available slot_10_30_11)

    (occupied gregory slot_11_11_30)
    (occupied gregory slot_12_12_30)
    (occupied gregory slot_15_30_16)

    (occupied carol slot_9_9_30)
    (occupied carol slot_9_30_10)
    (occupied carol slot_10_10_30)
    (occupied carol slot_11_11_30)
    (occupied carol slot_11_30_12)
    (occupied carol slot_12_12_30)
    (occupied carol slot_12_30_13)
    (occupied carol slot_13_13_30)
    (occupied carol slot_13_30_14)
    (occupied carol slot_14_14_30)
    (occupied carol slot_14_30_15)
    (occupied carol slot_15_15_30)
    (occupied carol slot_15_30_16)
    (occupied carol slot_16_16_30)
    (occupied carol slot_16_30_17)

    (available slot_11_30_12)
    (available slot_12_30_13)
    (available slot_13_13_30)
    (available slot_13_30_14)
    (available slot_14_14_30)
    (available slot_16_16_30)
    (available slot_16_30_17)
  )
  (:goal (exists (?s - time_slot) (scheduled ?s)))
)