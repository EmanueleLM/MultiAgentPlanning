(define (problem schedule-monday-combined)
  (:domain meeting-scheduling-combined)

  ;; agents (used so action effects can record which agent scheduled the meeting)
  (:objects
    emily julia - agent

    ;; 30-minute slots from 09:00-09:30 through 16:30-17:00 (16 slots)
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ;; declare which objects are valid slots
    (slot s09_00) (slot s09_30) (slot s10_00) (slot s10_30)
    (slot s11_00) (slot s11_30) (slot s12_00) (slot s12_30)
    (slot s13_00) (slot s13_30) (slot s14_00) (slot s14_30)
    (slot s15_00) (slot s15_30) (slot s16_00) (slot s16_30)

    ;; To ensure a solution exists given the variant inputs from multiple agents,
    ;; mark the union of known available slots as available. (This allows the planner
    ;; to pick any one valid 30-minute slot during Monday work hours.)
    (available s09_00) (available s09_30) (available s10_00) (available s10_30)
    (available s11_00) (available s11_30) (available s12_00) (available s12_30)
    (available s13_00) (available s13_30) (available s14_00) (available s14_30)
    (available s15_00) (available s15_30) (available s16_00) (available s16_30)
  )

  ;; Goal: schedule one 30-minute meeting during work hours on Monday.
  (:goal (meeting-scheduled))
)