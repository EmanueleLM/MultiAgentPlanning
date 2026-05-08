(define (problem calendar_scheduling_example17_problem)
  (:domain calendar_scheduling_example17)

  (:objects
    meeting_margaret_donna_helen - meeting
    margaret donna helen - participant
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - timeslot
  )

  (:init
    (meeting_unscheduled meeting_margaret_donna_helen)

    (required meeting_margaret_donna_helen margaret)
    (required meeting_margaret_donna_helen donna)
    (required meeting_margaret_donna_helen helen)

    (allowed meeting_margaret_donna_helen t_09_00)
    (allowed meeting_margaret_donna_helen t_09_30)
    (allowed meeting_margaret_donna_helen t_10_00)
    (allowed meeting_margaret_donna_helen t_10_30)
    (allowed meeting_margaret_donna_helen t_11_00)
    (allowed meeting_margaret_donna_helen t_11_30)
    (allowed meeting_margaret_donna_helen t_12_00)
    (allowed meeting_margaret_donna_helen t_12_30)
    (allowed meeting_margaret_donna_helen t_13_00)
    (allowed meeting_margaret_donna_helen t_13_30)

    (free margaret t_10_00)
    (free margaret t_11_00)
    (free margaret t_12_00)
    (free margaret t_12_30)
    (free margaret t_13_30)
    (free margaret t_14_00)
    (free margaret t_14_30)
    (free margaret t_15_30)
    (free margaret t_16_00)
    (free margaret t_16_30)

    (free donna t_09_00)
    (free donna t_09_30)
    (free donna t_10_00)
    (free donna t_10_30)
    (free donna t_11_00)
    (free donna t_11_30)
    (free donna t_12_00)
    (free donna t_12_30)
    (free donna t_13_00)
    (free donna t_13_30)
    (free donna t_14_00)
    (free donna t_15_00)
    (free donna t_15_30)
    (free donna t_16_30)

    (free helen t_09_30)
    (free helen t_11_30)
    (free helen t_12_00)
    (free helen t_12_30)
    (free helen t_14_00)
    (free helen t_15_00)
  )

  (:goal
    (exists (?t - timeslot)
      (meeting_scheduled meeting_margaret_donna_helen ?t)
    )
  )
)