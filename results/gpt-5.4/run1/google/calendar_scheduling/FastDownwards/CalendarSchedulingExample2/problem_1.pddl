(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    meeting_1 - meeting
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - timeslot
  )

  (:init
    (meeting_unscheduled meeting_1)

    (allowed_slot meeting_1 t_09_00)
    (allowed_slot meeting_1 t_09_30)
    (allowed_slot meeting_1 t_10_00)
    (allowed_slot meeting_1 t_10_30)
    (allowed_slot meeting_1 t_11_00)
    (allowed_slot meeting_1 t_11_30)
    (allowed_slot meeting_1 t_12_00)
    (allowed_slot meeting_1 t_12_30)
    (allowed_slot meeting_1 t_13_00)
    (allowed_slot meeting_1 t_13_30)
    (allowed_slot meeting_1 t_14_00)
    (allowed_slot meeting_1 t_14_30)
    (allowed_slot meeting_1 t_15_00)
    (allowed_slot meeting_1 t_15_30)

    (participant_available roy t_09_30)
    (participant_available roy t_10_30)
    (participant_available roy t_11_30)
    (participant_available roy t_12_00)
    (participant_available roy t_13_00)
    (participant_available roy t_13_30)
    (participant_available roy t_14_00)
    (participant_available roy t_14_30)
    (participant_available roy t_15_00)
    (participant_available roy t_15_30)
    (participant_available roy t_16_00)
    (participant_available roy t_16_30)

    (participant_available kathryn t_09_00)
    (participant_available kathryn t_10_00)
    (participant_available kathryn t_10_30)
    (participant_available kathryn t_11_00)
    (participant_available kathryn t_11_30)
    (participant_available kathryn t_12_00)
    (participant_available kathryn t_12_30)
    (participant_available kathryn t_13_00)
    (participant_available kathryn t_13_30)
    (participant_available kathryn t_14_00)
    (participant_available kathryn t_14_30)
    (participant_available kathryn t_15_00)
    (participant_available kathryn t_15_30)
    (participant_available kathryn t_16_00)

    (participant_available amy t_14_30)
    (participant_available amy t_16_00)
  )

  (:goal
    (and
      (not (meeting_unscheduled meeting_1))
    )
  )
)