(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    katherine nicole kevin - participant
    slot_9_10 slot_10_11 slot_11_12 slot_12_13 slot_13_14 slot_14_15 slot_15_16 slot_16_17 - timeslot
    meeting_1 - meeting
  )

  (:init
    (available katherine slot_9_10)
    (available katherine slot_10_11)
    (available katherine slot_11_12)
    (available katherine slot_12_13)
    (available katherine slot_13_14)
    (available katherine slot_14_15)
    (available katherine slot_15_16)
    (available katherine slot_16_17)

    (available nicole slot_9_10)
    (available nicole slot_10_11)
    (available nicole slot_11_12)
    (available nicole slot_12_13)
    (available nicole slot_13_14)
    (available nicole slot_14_15)
    (available nicole slot_15_16)
    (available nicole slot_16_17)
  )

  (:goal
    (and
      (scheduled meeting_1)
    )
  )
)