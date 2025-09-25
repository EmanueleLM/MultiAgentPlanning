(define (problem schedule-diane-kelly-deborah)
  (:domain multi_agent_meeting)
  (:objects
    diane kelly deborah - person
    slot_9_00 slot_9_30 slot_10_00 slot_10_30 slot_11_00 slot_11_30
    slot_12_00 slot_12_30 slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - slot
  )
  (:init
    (unscheduled)

    (free diane slot_9_30) (free diane slot_10_00) (free diane slot_10_30) (free diane slot_11_00)
    (free diane slot_11_30) (free diane slot_12_30) (free diane slot_13_00) (free diane slot_13_30)
    (free diane slot_14_00) (free diane slot_15_30) (free diane slot_16_00) (free diane slot_16_30)

    (free kelly slot_9_00) (free kelly slot_10_00) (free kelly slot_11_00) (free kelly slot_11_30)
    (free kelly slot_12_00) (free kelly slot_12_30) (free kelly slot_13_00) (free kelly slot_13_30)
    (free kelly slot_14_00) (free kelly slot_14_30) (free kelly slot_15_00) (free kelly slot_15_30)
    (free kelly slot_16_00) (free kelly slot_16_30)

    (free deborah slot_9_30) (free deborah slot_14_00)
  )
  (:goal (and (scheduled) (meeting_at slot_14_00)))
)