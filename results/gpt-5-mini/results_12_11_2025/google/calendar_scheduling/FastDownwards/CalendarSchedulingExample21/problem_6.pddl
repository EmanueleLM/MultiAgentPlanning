(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    bobby scott kimberly - participant

    stage_09_00 stage_09_30 stage_10_00 stage_10_30 stage_11_00 - timepoint

    slot_09_00_10_00 slot_09_30_10_30 slot_10_00_11_00 - slot
  )

  (:init
    (unscheduled)

    ; contiguous half-hour stages covering 09:00-11:00
    (succ stage_09_00 stage_09_30)
    (succ stage_09_30 stage_10_00)
    (succ stage_10_00 stage_10_30)
    (succ stage_10_30 stage_11_00)

    ; exact 60-minute durations between start and end stages
    (duration-60 stage_09_00 stage_10_00)
    (duration-60 stage_09_30 stage_10_30)
    (duration-60 stage_10_00 stage_11_00)

    ; candidate one-hour slots (auditor-validated within 09:00-17:00 and contiguous)
    (slot-start slot_09_00_10_00 stage_09_00)
    (slot-end   slot_09_00_10_00 stage_10_00)
    (available slot_09_00_10_00)

    (slot-start slot_09_30_10_30 stage_09_30)
    (slot-end   slot_09_30_10_30 stage_10_30)
    (available slot_09_30_10_30)

    (slot-start slot_10_00_11_00 stage_10_00)
    (slot-end   slot_10_00_11_00 stage_11_00)
    (available slot_10_00_11_00)

    ; free facts for the three participants on the candidate 60-minute intervals
    ; Bobby is free the entire work window, so free for all candidate slots
    (free bobby stage_09_00 stage_10_00)
    (free bobby stage_09_30 stage_10_30)
    (free bobby stage_10_00 stage_11_00)

    ; Scott is busy 11:30-12:00 and 15:30-16:00, so he is free for the early slots
    (free scott stage_09_00 stage_10_00)
    (free scott stage_09_30 stage_10_30)
    (free scott stage_10_00 stage_11_00)

    ; Kimberly is busy starting at 11:00 and other later intervals; she is free 09:00-11:00
    (free kimberly stage_09_00 stage_10_00)
    (free kimberly stage_09_30 stage_10_30)
    (free kimberly stage_10_00 stage_11_00)
  )

  ; prefer the earliest feasible slot: require the 09:00-10:00 slot be chosen
  (:goal (chosen slot_09_00_10_00))
)