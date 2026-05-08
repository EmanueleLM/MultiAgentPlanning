(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    bobby scott kimberly - participant

    ; discrete half-hour timepoints used to construct contiguous 60-minute slots
    stage_09_00 stage_09_30 stage_10_00 stage_10_30 stage_11_00 - timepoint

    ; candidate one-hour slots (exactly 60 minutes each)
    slot_09_00_10_00 slot_09_30_10_30 slot_10_00_11_00 - slot
  )

  (:init
    ; explicit successor relationships (discrete contiguous stages)
    (succ stage_09_00 stage_09_30)
    (succ stage_09_30 stage_10_00)
    (succ stage_10_00 stage_10_30)
    (succ stage_10_30 stage_11_00)

    ; explicit 60-minute duration facts (structural enforcement)
    (duration-60 stage_09_00 stage_10_00)
    (duration-60 stage_09_30 stage_10_30)
    (duration-60 stage_10_00 stage_11_00)

    ; map slots to their start and end timepoints
    (slot-start slot_09_00_10_00 stage_09_00)
    (slot-end   slot_09_00_10_00 stage_10_00)

    (slot-start slot_09_30_10_30 stage_09_30)
    (slot-end   slot_09_30_10_30 stage_10_30)

    (slot-start slot_10_00_11_00 stage_10_00)
    (slot-end   slot_10_00_11_00 stage_11_00)

    ; free facts: participant is free for the entire slot
    ; Bobby: free entire work window -> free for all candidate one-hour slots
    (free bobby slot_09_00_10_00)
    (free bobby slot_09_30_10_30)
    (free bobby slot_10_00_11_00)

    ; Scott: busy later, so free for early slots within work window
    (free scott slot_09_00_10_00)
    (free scott slot_09_30_10_30)
    (free scott slot_10_00_11_00)

    ; Kimberly: busy starting 11:00, so free for slots that end by 11:00
    (free kimberly slot_09_00_10_00)
    (free kimberly slot_09_30_10_30)
    (free kimberly slot_10_00_11_00)
  )

  ; Goal: select the earliest feasible one-hour slot and ensure meeting is scheduled.
  (:goal (and
    (chosen slot_09_00_10_00)
    (meeting-scheduled)
  ))
)