(define (problem schedule_meeting)
  (:domain meeting_scheduler)
  (:objects
    diane kelly deborah - participant
    slot_1 slot_2 slot_3 slot_4 slot_5
    slot_6 slot_7 slot_8 slot_9 slot_10
    slot_11 slot_12 slot_13 slot_14 slot_15 slot_16 - time_slot
  )
  (:init
    (is_busy diane slot_1)
    (is_busy diane slot_5)
    (is_busy diane slot_9)
    (is_busy kelly slot_2)
    (is_busy kelly slot_4)
    (is_busy deborah slot_1)
    (is_busy deborah slot_3)
    (is_busy deborah slot_4)
    (is_busy deborah slot_5)
    (is_busy deborah slot_6)
    (is_busy deborah slot_7)
    (is_busy deborah slot_8)
    (is_busy deborah slot_10)
    (is_busy deborah slot_11)
    (is_busy deborah slot_12)
    (is_busy deborah slot_14)
    (is_busy deborah slot_15)
    (is_busy deborah slot_16)
  )
  (:goal (meeting_scheduled))
)