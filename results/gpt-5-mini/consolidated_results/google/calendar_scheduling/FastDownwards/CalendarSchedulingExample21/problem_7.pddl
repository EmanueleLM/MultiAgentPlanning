(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    bobby scott kimberly - participant

    stage_09_00 stage_09_30 stage_10_00 stage_10_30 stage_11_00 - timepoint

    slot_09_00_10_00 slot_09_30_10_30 slot_10_00_11_00 - slot
  )

  (:init
    ; ordered contiguous half-hour stages
    (succ stage_09_00 stage_09_30)
    (succ stage_09_30 stage_10_00)
    (succ stage_10_00 stage_10_30)
    (succ stage_10_30 stage_11_00)

    ; exact 60-minute durations between corresponding start and end stages
    (duration-60 stage_09_00 stage_10_00)
    (duration-60 stage_09_30 stage_10_30)
    (duration-60 stage_10_00 stage_11_00)

    ; candidate one-hour slots (start/end mapped to timepoints)
    (slot-start slot_09_00_10_00 stage_09_00)
    (slot-end   slot_09_00_10_00 stage_10_00)

    (slot-start slot_09_30_10_30 stage_09_30)
    (slot-end   slot_09_30_10_30 stage_10_30)

    (slot-start slot_10_00_11_00 stage_10_00)
    (slot-end   slot_10_00_11_00 stage_11_00)

    ; free facts (normalized, half-open [start,end) semantics)
    ; Bobby: free entire work window -> free for all candidate one-hour slots
    (free bobby stage_09_00 stage_10_00)
    (free bobby stage_09_30 stage_10_30)
    (free bobby stage_10_00 stage_11_00)

    ; Scott: busy 11:30-12:00 and 15:30-16:00 -> free for early slots
    (free scott stage_09_00 stage_10_00)
    (free scott stage_09_30 stage_10_30)
    (free scott stage_10_00 stage_11_00)

    ; Kimberly: free 09:00-11:00 only among intervals long enough for 60-min meeting
    (free kimberly stage_09_00 stage_10_00)
    (free kimberly stage_09_30 stage_10_30)
    (free kimberly stage_10_00 stage_11_00)

    ; auditor-validated slots where all three participants are free for the exact 60-minute interval
    (free-for-all slot_09_00_10_00)
    (free-for-all slot_09_30_10_30)
    (free-for-all slot_10_00_11_00)
  )

  (:goal (chosen slot_09_00_10_00))
)