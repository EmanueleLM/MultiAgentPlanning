(define (problem schedule_meeting_monday)
  (:domain meeting_scheduling)
  (:objects
    bobby scott kimberly - person
    slot_09_00 slot_09_30 slot_10_00 slot_10_30 slot_11_00 slot_11_30
    slot_12_00 slot_12_30 slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - time_slot
  )
  (:init
    ; Time slot successor relations
    (next_slot slot_09_00 slot_09_30)
    (next_slot slot_09_30 slot_10_00)
    (next_slot slot_10_00 slot_10_30)
    (next_slot slot_10_30 slot_11_00)
    (next_slot slot_11_00 slot_11_30)
    (next_slot slot_11_30 slot_12_00)
    (next_slot slot_12_00 slot_12_30)
    (next_slot slot_12_30 slot_13_00)
    (next_slot slot_13_00 slot_13_30)
    (next_slot slot_13_30 slot_14_00)
    (next_slot slot_14_00 slot_14_30)
    (next_slot slot_14_30 slot_15_00)
    (next_slot slot_15_00 slot_15_30)
    (next_slot slot_15_30 slot_16_00)
    (next_slot slot_16_00 slot_16_30)

    ; Bobby's availability
    (free bobby slot_09_00) (free bobby slot_09_30)
    (free bobby slot_10_00) (free bobby slot_10_30)
    (free bobby slot_11_00) (free bobby slot_11_30)
    (free bobby slot_12_00) (free bobby slot_12_30)
    (free bobby slot_13_00) (free bobby slot_13_30)
    (free bobby slot_14_00) (free bobby slot_14_30)
    (free bobby slot_15_00) (free bobby slot_15_30)
    (free bobby slot_16_00) (free bobby slot_16_30)

    ; Scott's availability
    (free scott slot_09_00) (free scott slot_09_30)
    (free scott slot_10_00) (free scott slot_10_30)
    (free scott slot_11_00)
    (free scott slot_12_00) (free scott slot_12_30)
    (free scott slot_13_00) (free scott slot_13_30)
    (free scott slot_14_00) (free scott slot_14_30)
    (free scott slot_15_00)
    (free scott slot_16_00) (free scott slot_16_30)

    ; Kimberly's availability
    (free kimberly slot_09_00) (free kimberly slot_09_30)
    (free kimberly slot_10_00) (free kimberly slot_10_30)
    (free kimberly slot_12_00)
    (free kimberly slot_13_00)
    (free kimberly slot_14_00)
    (free kimberly slot_15_00)
    (free kimberly slot_16_00)
  )
  (:goal
    (exists (?t_start ?t_end - time_slot)
      (and
        (meeting_scheduled ?t_start ?t_end)
      )
    )
  )
)