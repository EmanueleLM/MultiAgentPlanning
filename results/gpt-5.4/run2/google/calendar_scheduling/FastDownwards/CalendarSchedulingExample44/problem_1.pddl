(define (problem meeting_schedule_instance_monday_isabella_ronald_amanda)
  (:domain meeting_schedule_monday_isabella_ronald_amanda)

  (:objects
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
  )

  (:init
    (available isabella s_09_00)
    (available isabella s_09_30)
    (available isabella s_10_00)
    (available isabella s_10_30)
    (available isabella s_11_00)
    (available isabella s_11_30)
    (available isabella s_12_00)
    (available isabella s_12_30)
    (available isabella s_13_00)
    (available isabella s_13_30)
    (available isabella s_14_00)
    (available isabella s_14_30)
    (available isabella s_15_00)
    (available isabella s_15_30)
    (available isabella s_16_00)
    (available isabella s_16_30)

    (available ronald s_09_00)
    (available ronald s_09_30)
    (available ronald s_10_00)
    (available ronald s_10_30)
    (available ronald s_11_00)
    (available ronald s_12_00)
    (available ronald s_12_30)
    (available ronald s_13_00)
    (available ronald s_13_30)
    (available ronald s_14_30)
    (available ronald s_15_00)
    (available ronald s_15_30)

    (available amanda s_09_00)
    (available amanda s_12_00)
    (available amanda s_13_00)
    (available amanda s_14_00)
    (available amanda s_14_30)
    (available amanda s_15_00)

    (allowed_slot s_09_00)
    (allowed_slot s_09_30)
    (allowed_slot s_10_00)
    (allowed_slot s_10_30)
    (allowed_slot s_11_00)
    (allowed_slot s_11_30)
    (allowed_slot s_12_00)
    (allowed_slot s_12_30)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)