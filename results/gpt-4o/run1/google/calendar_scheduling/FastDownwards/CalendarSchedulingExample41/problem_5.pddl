(define (problem schedule_meeting_problem)
  (:domain meeting_scheduler)

  (:objects
    monday - day
    slot_9_00 slot_9_30 slot_10_00 slot_10_30 slot_11_00
    slot_11_30 slot_12_00 slot_12_30 slot_13_00 slot_13_30
    slot_14_00 slot_14_30 slot_15_00 slot_15_30 slot_16_00 - time
    alan nancy patricia - participant
  )
  
  (:init
    (slot slot_9_00)
    (slot slot_9_30)
    (slot slot_10_00)
    (slot slot_10_30)
    (slot slot_11_00)
    (slot slot_11_30)
    (slot slot_12_00)
    (slot slot_12_30)
    (slot slot_13_00)
    (slot slot_13_30)
    (slot slot_14_00)
    (slot slot_14_30)
    (slot slot_15_00)
    (slot slot_15_30)
    (slot slot_16_00)

    ;; Alan's availability
    (available alan slot_14_30 monday)
    (available alan slot_15_00 monday)
    (available alan slot_15_30 monday)
    (available alan slot_16_00 monday)
    
    ;; Nancy's availability
    (available nancy slot_9_00 monday)
    (available nancy slot_9_30 monday)
    (available nancy slot_10_00 monday)
    (available nancy slot_10_30 monday)
    (available nancy slot_12_30 monday)
    (available nancy slot_13_30 monday)
    (available nancy slot_15_00 monday)
    (available nancy slot_15_30 monday)
    (available nancy slot_16_00 monday)

    ;; Patricia's availability
    (available patricia slot_9_00 monday)
    (available patricia slot_9_30 monday)
    (available patricia slot_12_00 monday)
    (available patricia slot_12_30 monday)
    (available patricia slot_13_00 monday)
    (available patricia slot_13_30 monday)
    (available patricia slot_16_00 monday)

    ;; Alan's preference
    (preferred_start alan slot_14_30 monday)
  )

  (:goal
    (and (meeting_scheduled alan nancy patricia slot_14_30 monday))
  )
)