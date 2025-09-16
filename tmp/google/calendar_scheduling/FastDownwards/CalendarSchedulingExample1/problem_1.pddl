(define (problem calendar-scheduling-problem)
  (:domain calendar-scheduling)
  (:objects
    raymond billy donald - person
    slot_9_00 slot_9_30 slot_10_00 slot_10_30 slot_11_00 slot_11_30 slot_12_00 slot_12_30 slot_13_00 slot_13_30 slot_14_00 slot_14_30 slot_15_00 slot_15_30 slot_16_00 slot_16_30 - time
  )
  (:init
    (blocked raymond slot_9_00)
    (blocked raymond slot_11_30)
    (blocked raymond slot_13_00)
    (blocked raymond slot_15_00)
    (blocked billy slot_10_00)
    (blocked billy slot_12_00)
    (blocked billy slot_12_30)
    (blocked billy slot_16_30)
    (blocked donald slot_9_00)
    (blocked donald slot_10_00)
    (blocked donald slot_10_30)
    (blocked donald slot_12_00)
    (blocked donald slot_12_30)
    (blocked donald slot_14_00)
    (blocked donald slot_16_00)
    (blocked donald slot_16_30)
  )
  (:goal
    (and
      (meeting_at slot_9_30)
      (attends raymond slot_9_30)
      (attends billy slot_9_30)
      (attends donald slot_9_30)
    )
  )
)