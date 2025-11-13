(define (problem calendar-scheduling-problem23)
  (:domain calendar-scheduling)
  (:objects
    ;; 30-minute boundary start times for 60-minute meetings between 09:00 and 16:00 inclusive
    slot_09_00 slot_09_30 slot_10_00 slot_10_30 slot_11_00 slot_11_30
    slot_12_00 slot_12_30 slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 - slot
  )

  (:init
    ;; declare all slots
    (slot slot_09_00) (slot slot_09_30) (slot slot_10_00) (slot slot_10_30)
    (slot slot_11_00) (slot slot_11_30) (slot slot_12_00) (slot slot_12_30)
    (slot slot_13_00) (slot slot_13_30) (slot slot_14_00) (slot slot_14_30)
    (slot slot_15_00) (slot slot_15_30) (slot slot_16_00)

    ;; Billy's availability (60-minute windows starting on 30-min boundaries)
    ;; Billy busy: 11:30-12:00, 13:00-15:00, 16:00-16:30
    (available-billy slot_09_00)
    (available-billy slot_09_30)
    (available-billy slot_10_00)
    (available-billy slot_10_30)
    (available-billy slot_12_00)
    (available-billy slot_15_00)

    ;; Maria's availability
    ;; Maria busy: 09:00-09:30, 10:00-10:30, 13:00-13:30, 14:00-14:30
    (available-maria slot_10_30)
    (available-maria slot_11_00)
    (available-maria slot_11_30)
    (available-maria slot_12_00)
    (available-maria slot_12_30)
    (available-maria slot_14_30)
    (available-maria slot_15_00)
    (available-maria slot_15_30)
    (available-maria slot_16_00)

    ;; William's availability
    ;; William busy: 09:30-10:00, 12:00-12:30, 13:30-15:00, 15:30-17:00
    (available-william slot_10_00)
    (available-william slot_10_30)
    (available-william slot_11_00)
    (available-william slot_12_30)

    ;; single-use token enforces exactly one scheduling action
    (token)
  )

  ;; Goal: a single meeting is scheduled (the domain forces that it must be a slot
  ;; where all three participants are available; token ensures only one can be chosen)
  (:goal (meeting-scheduled))
)