(define (problem schedule_for_emily_melissa_frank)
  (:domain meeting_scheduling)
  (:objects
    emily melissa frank - person
    slot_9_0_to_9_30 slot_9_30_to_10_0 slot_10_0_to_10_30 - time_slot
  )
  (:init
    (busy emily slot_10_0_to_10_30)
    (busy melissa slot_9_30_to_10_0)
    (busy frank slot_10_0_to_10_30)
    (can_meet emily slot_9_0_to_9_30)
    (can_meet melissa slot_9_0_to_9_30)
    (can_meet frank slot_9_0_to_9_30)
  )
  (:goal
    (exists (?t - time_slot) (meeting_scheduled ?t))
  )
)