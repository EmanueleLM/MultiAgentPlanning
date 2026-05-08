(define (problem monday_meeting_scheduling_instance_problem)
  (:domain monday_meeting_scheduling_instance)

  (:objects
    joyce christine alexander - participant
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
  )

  (:init
    (required joyce)
    (required christine)
    (required alexander)

    (available joyce s_09_00)
    (available joyce s_09_30)
    (available joyce s_10_00)
    (available joyce s_10_30)
    (available joyce s_11_30)
    (available joyce s_12_00)
    (available joyce s_12_30)
    (available joyce s_13_00)
    (available joyce s_14_00)
    (available joyce s_16_30)

    (available christine s_12_00)
    (available christine s_12_30)
    (available christine s_13_00)
    (available christine s_13_30)
    (available christine s_14_00)
    (available christine s_14_30)
    (available christine s_15_00)
    (available christine s_15_30)
    (available christine s_16_00)
    (available christine s_16_30)

    (available alexander s_11_00)
    (available alexander s_11_30)
    (available alexander s_12_30)
    (available alexander s_13_00)
    (available alexander s_15_00)
    (available alexander s_16_00)
  )

  (:goal
    (and
      (scheduled)
    )
  )
)