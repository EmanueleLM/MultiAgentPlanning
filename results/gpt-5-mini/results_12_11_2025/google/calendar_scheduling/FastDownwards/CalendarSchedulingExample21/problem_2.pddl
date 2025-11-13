(define (problem schedule-meeting-monday-09-10)
  (:domain meeting-scheduling)
  (:objects
    bobby scott kimberly - participant
    stage_09_00 stage_10_00 - timepoint
    slot_09_00_10_00 - slot
  )
  (:init
    (unscheduled)
    (succ stage_09_00 stage_10_00)
    (duration-60 stage_09_00 stage_10_00)
    (slot-from slot_09_00_10_00 stage_09_00)
    (slot-to   slot_09_00_10_00 stage_10_00)
    (available slot_09_00_10_00)
    (free bobby stage_09_00 stage_10_00)
    (free scott stage_09_00 stage_10_00)
    (free kimberly stage_09_00 stage_10_00)
  )
  (:goal (chosen slot_09_00_10_00))
)