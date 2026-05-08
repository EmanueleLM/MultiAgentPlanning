(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    david debra kevin - participant
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - timeslot
    meeting_1 - meeting
  )

  (:init
    (unscheduled meeting_1)

    (next_slot t_09_00 t_09_30)
    (next_slot t_09_30 t_10_00)
    (next_slot t_10_00 t_10_30)
    (next_slot t_10_30 t_11_00)
    (next_slot t_11_00 t_11_30)
    (next_slot t_11_30 t_12_00)
    (next_slot t_12_00 t_12_30)
    (next_slot t_12_30 t_13_00)
    (next_slot t_13_00 t_13_30)
    (next_slot t_13_30 t_14_00)
    (next_slot t_14_00 t_14_30)
    (next_slot t_14_30 t_15_00)
    (next_slot t_15_00 t_15_30)
    (next_slot t_15_30 t_16_00)
    (next_slot t_16_00 t_16_30)

    (free david t_09_00)
    (free david t_09_30)
    (free david t_10_00)
    (free david t_10_30)
    (free david t_11_00)
    (free david t_11_30)
    (free david t_12_00)
    (free david t_12_30)
    (free david t_13_00)
    (free david t_13_30)
    (free david t_14_00)
    (free david t_14_30)
    (free david t_15_00)
    (free david t_15_30)
    (free david t_16_00)
    (free david t_16_30)

    (free debra t_09_00)
    (free debra t_10_00)
    (free debra t_10_30)
    (free debra t_11_30)
    (free debra t_13_00)
    (free debra t_13_30)
    (free debra t_14_30)
    (free debra t_15_00)
    (free debra t_15_30)
    (free debra t_16_30)

    (free kevin t_12_00)
    (free kevin t_12_30)
    (free kevin t_13_00)
    (free kevin t_13_30)
  )

  (:goal
    (and
      (scheduled meeting_1)
      (starts_at meeting_1 t_13_00)
    )
  )
)