(define (problem schedule_meeting)
  (:domain meeting_scheduler)

  (:objects
    anthony pamela zachary - participant
    slot_9_10 slot_10_11 slot_11_12 slot_12_13
    slot_13_14 slot_14_15 slot_15_16 slot_16_17 - time_slot
  )

  (:init
    (busy anthony slot_9_10)
    (busy anthony slot_12_13)
    (busy anthony slot_16_17)

    (busy pamela slot_9_10)
    (busy pamela slot_16_17)
    (preference_not_after_1430 pamela)

    (busy zachary slot_9_10)
    (busy zachary slot_10_11)
    (busy zachary slot_11_12)
    (busy zachary slot_12_13)
    (busy zachary slot_14_15)
    (busy zachary slot_16_17)

    (consecutive slot_9_10 slot_10_11)
    (consecutive slot_10_11 slot_11_12)
    (consecutive slot_11_12 slot_12_13)
    (consecutive slot_13_14 slot_14_15)
    (consecutive slot_14_15 slot_15_16)
    (consecutive slot_15_16 slot_16_17)

    (after_1430 slot_14_15)
    (after_1430 slot_15_16)
    (after_1430 slot_16_17)

    (forall (?p - participant ?s - time_slot)
      (not (busy ?p ?s)) => (free ?p ?s))
  )

  (:goal (exists (?s1 ?s2 - time_slot)
    (and
      (scheduled_meeting ?s1)
      (scheduled_meeting ?s2)
      (consecutive ?s1 ?s2))))
)