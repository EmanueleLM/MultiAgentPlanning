(define (problem schedule-meeting-monday-09-10)
  (:domain meeting-scheduling)
  (:objects
    bobby scott kimberly - participant

    stage_09_00 stage_09_30 stage_10_00 stage_10_30 stage_11_00 - timepoint

    slot_09_00_10_00 slot_09_30_10_30 slot_10_00_11_00 - slot
  )

  (:init
    ;; meeting not yet scheduled
    (unscheduled)

    ;; explicit ordered stages (half-hour granularity)
    (succ stage_09_00 stage_09_30)
    (succ stage_09_30 stage_10_00)
    (succ stage_10_00 stage_10_30)
    (succ stage_10_30 stage_11_00)

    ;; duration facts: these pairs represent exactly 60 minutes (two successive half-hour steps)
    (duration-60 stage_09_00 stage_10_00)
    (duration-60 stage_09_30 stage_10_30)
    (duration-60 stage_10_00 stage_11_00)

    ;; slot definitions (start and end timepoints)
    (slot-start slot_09_00_10_00 stage_09_00)
    (slot-end   slot_09_00_10_00 stage_10_00)
    (available slot_09_00_10_00)

    (slot-start slot_09_30_10_30 stage_09_30)
    (slot-end   slot_09_30_10_30 stage_10_30)
    (available slot_09_30_10_30)

    (slot-start slot_10_00_11_00 stage_10_00)
    (slot-end   slot_10_00_11_00 stage_11_00)
    (available slot_10_00_11_00)

    ;; free facts: each participant must be free for the exact slot interval [start,end)
    ;; Bobby is free entire work window, so free for all candidate slots
    (free bobby stage_09_00 stage_10_00)
    (free bobby stage_09_30 stage_10_30)
    (free bobby stage_10_00 stage_11_00)

    ;; Scott's busy blocks are 11:30-12:00 and 15:30-16:00; these slots are before 11:30 so Scott is free
    (free scott stage_09_00 stage_10_00)
    (free scott stage_09_30 stage_10_30)
    (free scott stage_10_00 stage_11_00)

    ;; Kimberly's free window for 60-minute meetings is within 09:00-11:00; these three slots fit entirely
    (free kimberly stage_09_00 stage_10_00)
    (free kimberly stage_09_30 stage_10_30)
    (free kimberly stage_10_00 stage_11_00)
  )

  ;; Goal: select the earliest feasible one-hour slot (09:00-10:00)
  (:goal (chosen slot_09_00_10_00))
)