(define (problem schedule_meeting_instance)
  (:domain meeting_scheduler)
  (:objects
    gerald roy barbara - participant
    timeslot_9_00 timeslot_9_30 timeslot_10_00 timeslot_10_30 
    timeslot_11_00 timeslot_11_30 timeslot_12_00 timeslot_12_30
    timeslot_13_00 timeslot_13_30 timeslot_14_00 timeslot_14_30
    timeslot_15_00 timeslot_15_30 timeslot_16_00 timeslot_16_30 - timeslot
    meeting_gerald_roy_barbara - meeting
  )
  (:init
    (next_timeslot timeslot_9_00 timeslot_9_30)
    (next_timeslot timeslot_9_30 timeslot_10_00)
    (next_timeslot timeslot_10_00 timeslot_10_30)
    (next_timeslot timeslot_10_30 timeslot_11_00)
    (next_timeslot timeslot_11_00 timeslot_11_30)
    (next_timeslot timeslot_11_30 timeslot_12_00)
    (next_timeslot timeslot_12_00 timeslot_12_30)
    (next_timeslot timeslot_12_30 timeslot_13_00)
    (next_timeslot timeslot_13_00 timeslot_13_30)
    (next_timeslot timeslot_13_30 timeslot_14_00)
    (next_timeslot timeslot_14_00 timeslot_14_30)
    (next_timeslot timeslot_14_30 timeslot_15_00)
    (next_timeslot timeslot_15_00 timeslot_15_30)
    (next_timeslot timeslot_15_30 timeslot_16_00)
    (next_timeslot timeslot_16_00 timeslot_16_30)
    
    (is_free gerald timeslot_9_30)
    (is_free gerald timeslot_10_00)
    (is_free gerald timeslot_10_30)
    (is_free gerald timeslot_11_00)
    (is_free gerald timeslot_11_30)
    (is_free gerald timeslot_12_00)
    (is_free gerald timeslot_12_30)
    (is_free gerald timeslot_14_00)
    (is_free gerald timeslot_14_30)
    (is_free gerald timeslot_15_00)
    (is_free gerald timeslot_15_30)

    (is_free roy timeslot_9_00)
    (is_free roy timeslot_9_30)
    (is_free roy timeslot_10_00)
    (is_free roy timeslot_10_30)
    (is_free roy timeslot_11_00)
    (is_free roy timeslot_11_30)
    (is_free roy timeslot_12_00)
    (is_free roy timeslot_12_30)
    (is_free roy timeslot_13_00)
    (is_free roy timeslot_13_30)
    (is_free roy timeslot_14_00)
    (is_free roy timeslot_14_30)
    (is_free roy timeslot_15_00)
    (is_free roy timeslot_15_30)
    (is_free roy timeslot_16_00)
    (is_free roy timeslot_16_30)

    (is_free barbara timeslot_10_00)
    (is_free barbara timeslot_10_30)
    (is_free barbara timeslot_11_00)
    (is_free barbara timeslot_14_00)
    (is_free barbara timeslot_14_30)
    (is_free barbara timeslot_15_00)

    (prefers_not_to_meet_before gerald timeslot_13_00)
  )
  (:goal
    (exists (?t - timeslot) (meeting_scheduled_for meeting_gerald_roy_barbara ?t))
  )
)