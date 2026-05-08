(define (problem schedule_meeting_monday)
  (:domain jack_of_all_trades)

  (:objects
    slot_9_00 slot_9_30 slot_10_00 slot_10_30 slot_11_00 slot_11_30
    slot_12_00 slot_12_30 slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - timeslot
  )

  (:init
    ;; required attendees for the meeting
    (required_to_attend bradley meeting_m1)
    (required_to_attend zachary meeting_m1)
    (required_to_attend teresa meeting_m1)

    ;; meeting initial status
    (meeting_unscheduled meeting_m1)

    ;; Bradley: free entire workday but does NOT want to meet before 14:30.
    ;; Represented by availability only from 14:30 onward.
    (available bradley slot_14_30)
    (available bradley slot_15_00)
    (available bradley slot_15_30)
    (available bradley slot_16_00)
    (available bradley slot_16_30)

    ;; Zachary: meetings at 10:00-10:30 and 15:00-15:30 -> those slots unavailable.
    ;; Available all other listed slots.
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

    ;; Teresa: blocked 9:00-10:30, 11:00-12:30, 13:00-14:00, 14:30-16:30.
    ;; Available slots are those not in the blocked intervals below.
    (available teresa slot_10_30)
    (available teresa slot_12_30)
    (available teresa slot_14_00)
    (available teresa slot_16_30)
  )

  (:goal (and
    (meeting_scheduled meeting_m1)
  ))
)