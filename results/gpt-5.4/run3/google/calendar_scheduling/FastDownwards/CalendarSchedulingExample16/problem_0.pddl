(define (problem monday_meeting_instance_scott_gabriel_christine)
  (:domain monday_meeting_scheduling)

  (:objects
    scott gabriel christine - participant
    t_09_00 t_09_30 t_10_00 t_10_30
    t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30
    t_15_00 t_15_30 t_16_00 t_16_30 - timeslot
  )

  (:init
    (required scott)
    (required gabriel)
    (required christine)

    (busy scott t_09_30)
    (busy scott t_10_00)
    (busy scott t_13_30)
    (busy scott t_14_30)
    (busy scott t_15_30)
    (busy scott t_16_30)

    (busy christine t_09_00)
    (busy christine t_09_30)
    (busy christine t_10_30)
    (busy christine t_11_00)
    (busy christine t_11_30)
    (busy christine t_12_00)
    (busy christine t_13_00)
    (busy christine t_13_30)
    (busy christine t_14_00)
    (busy christine t_14_30)
    (busy christine t_15_00)
    (busy christine t_15_30)
    (busy christine t_16_00)
    (busy christine t_16_30)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)