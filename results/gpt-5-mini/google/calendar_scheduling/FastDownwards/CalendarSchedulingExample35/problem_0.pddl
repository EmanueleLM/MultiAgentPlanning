(define (problem schedule_meeting_monday)
  (:domain jack_of_all_trades)

  (:objects
    slot_9_00 slot_9_30 slot_10_00 slot_10_30 slot_11_00 slot_11_30
    slot_12_00 slot_12_30 slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - timeslot
  )

  (:init
    ;; required attendees
    (required_to_attend bradley meeting_m1)
    (required_to_attend zachary meeting_m1)
    (required_to_attend teresa meeting_m1)

    ;; meeting initial status
    (meeting_unscheduled meeting_m1)

    ;; Bradley availability (blocked before 14:30, available from 14:30 onward)
    (blocked bradley slot_9_00)
    (blocked bradley slot_9_30)
    (blocked bradley slot_10_00)
    (blocked bradley slot_10_30)
    (blocked bradley slot_11_00)
    (blocked bradley slot_11_30)
    (blocked bradley slot_12_00)
    (blocked bradley slot_12_30)
    (blocked bradley slot_13_00)
    (blocked bradley slot_13_30)
    (blocked bradley slot_14_00)
    (available bradley slot_14_30)
    (available bradley slot_15_00)
    (available bradley slot_15_30)
    (available bradley slot_16_00)
    (available bradley slot_16_30)

    ;; Zachary availability (blocked at 10:00 and 15:00, available otherwise)
    (blocked zachary slot_10_00)
    (blocked zachary slot_15_00)
    (available zachary slot_9_00)
    (available zachary slot_9_30)
    (available zachary slot_10_30)
    (available zachary slot_11_00)
    (available zachary slot_11_30)
    (available zachary slot_12_00)
    (available zachary slot_12_30)
    (available zachary slot_13_00)
    (available zachary slot_13_30)
    (available zachary slot_14_00)
    (available zachary slot_14_30)
    (available zachary slot_15_30)
    (available zachary slot_16_00)
    (available zachary slot_16_30)

    ;; Teresa availability (blocked as specified, available for listed slots)
    (blocked teresa slot_9_00)
    (blocked teresa slot_9_30)
    (blocked teresa slot_10_00)
    (available teresa slot_10_30)
    (blocked teresa slot_11_00)
    (blocked teresa slot_11_30)
    (blocked teresa slot_12_00)
    (available teresa slot_12_30)
    (blocked teresa slot_13_00)
    (blocked teresa slot_13_30)
    (available teresa slot_14_00)
    (blocked teresa slot_14_30)
    (blocked teresa slot_15_00)
    (blocked teresa slot_15_30)
    (blocked teresa slot_16_00)
    (available teresa slot_16_30)
  )

  (:goal (and
    (meeting_scheduled meeting_m1)
  ))
)