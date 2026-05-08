(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    bobby scott kimberly - participant

    stage_09_00 stage_09_30 stage_10_00 stage_10_30 stage_11_00 - timepoint

    slot_09_00_10_00 slot_09_30_10_30 slot_10_00_11_00 - slot
  )

  (:init
    ; ordered contiguous half-hour stages (succ defines adjacency)
    (succ stage_09_00 stage_09_30)
    (succ stage_09_30 stage_10_00)
    (succ stage_10_00 stage_10_30)
    (succ stage_10_30 stage_11_00)

    ; exact 60-minute durations between corresponding start and end stages
    (duration-60 stage_09_00 stage_10_00)
    (duration-60 stage_09_30 stage_10_30)
    (duration-60 stage_10_00 stage_11_00)

    ; candidate one-hour slots mapped to start/end timepoints
    (slot-start slot_09_00_10_00 stage_09_00)
    (slot-end   slot_09_00_10_00 stage_10_00)

    (slot-start slot_09_30_10_30 stage_09_30)
    (slot-end   slot_09_30_10_30 stage_10_30)

    (slot-start slot_10_00_11_00 stage_10_00)
    (slot-end   slot_10_00_11_00 stage_11_00)

    ; free facts (participant is free for the whole slot)
    ; Bobby: free entire work window -> free for all candidate one-hour slots
    (free bobby slot_09_00_10_00)
    (free bobby slot_09_30_10_30)
    (free bobby slot_10_00_11_00)

    ; Scott: busy later, so free for early slots
    (free scott slot_09_00_10_00)
    (free scott slot_09_30_10_30)
    (free scott slot_10_00_11_00)

    ; Kimberly: free until 11:00 -> these one-hour slots are all feasible
    (free kimberly slot_09_00_10_00)
    (free kimberly slot_09_30_10_30)
    (free kimberly slot_10_00_11_00)
  )

  ; Goal: schedule the earliest feasible one-hour slot and mark meeting scheduled.
  (:goal (and
    (chosen slot_09_00_10_00)
    (meeting-scheduled)
  ))
)