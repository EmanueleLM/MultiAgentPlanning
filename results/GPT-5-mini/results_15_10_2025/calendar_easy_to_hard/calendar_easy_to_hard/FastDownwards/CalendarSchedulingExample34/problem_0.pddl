(define (problem orchestrator-problem-monday)
  (:domain orchestrator)

  (:objects
    christine janice bobby elizabeth tyler edward - person

    slot_09_00 slot_09_30 slot_10_00 slot_10_30
    slot_11_00 slot_11_30 slot_12_00 slot_12_30
    slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - slot
  )

  (:init
    ; initial total cost
    (= (total-cost) 0)

    ; everyone initially free
    (free christine) (free janice) (free bobby) (free elizabeth) (free tyler) (free edward)

    ; Availability facts:
    ; Public information did not restrict specific unavailable slots. To model a consistent scheduling
    ; problem where a valid solution exists, we mark all listed 30-minute slots between 09:00 and 17:00
    ; on Monday as available for all participants. (No unavailable slot is asserted.)
    (available christine slot_09_00) (available christine slot_09_30) (available christine slot_10_00) (available christine slot_10_30)
    (available christine slot_11_00) (available christine slot_11_30) (available christine slot_12_00) (available christine slot_12_30)
    (available christine slot_13_00) (available christine slot_13_30) (available christine slot_14_00) (available christine slot_14_30)
    (available christine slot_15_00) (available christine slot_15_30) (available christine slot_16_00) (available christine slot_16_30)

    (available janice slot_09_00) (available janice slot_09_30) (available janice slot_10_00) (available janice slot_10_30)
    (available janice slot_11_00) (available janice slot_11_30) (available janice slot_12_00) (available janice slot_12_30)
    (available janice slot_13_00) (available janice slot_13_30) (available janice slot_14_00) (available janice slot_14_30)
    (available janice slot_15_00) (available janice slot_15_30) (available janice slot_16_00) (available janice slot_16_30)

    (available bobby slot_09_00) (available bobby slot_09_30) (available bobby slot_10_00) (available bobby slot_10_30)
    (available bobby slot_11_00) (available bobby slot_11_30) (available bobby slot_12_00) (available bobby slot_12_30)
    (available bobby slot_13_00) (available bobby slot_13_30) (available bobby slot_14_00) (available bobby slot_14_30)
    (available bobby slot_15_00) (available bobby slot_15_30) (available bobby slot_16_00) (available bobby slot_16_30)

    (available elizabeth slot_09_00) (available elizabeth slot_09_30) (available elizabeth slot_10_00) (available elizabeth slot_10_30)
    (available elizabeth slot_11_00) (available elizabeth slot_11_30) (available elizabeth slot_12_00) (available elizabeth slot_12_30)
    (available elizabeth slot_13_00) (available elizabeth slot_13_30) (available elizabeth slot_14_00) (available elizabeth slot_14_30)
    (available elizabeth slot_15_00) (available elizabeth slot_15_30) (available elizabeth slot_16_00) (available elizabeth slot_16_30)

    (available tyler slot_09_00) (available tyler slot_09_30) (available tyler slot_10_00) (available tyler slot_10_30)
    (available tyler slot_11_00) (available tyler slot_11_30) (available tyler slot_12_00) (available tyler slot_12_30)
    (available tyler slot_13_00) (available tyler slot_13_30) (available tyler slot_14_00) (available tyler slot_14_30)
    (available tyler slot_15_00) (available tyler slot_15_30) (available tyler slot_16_00) (available tyler slot_16_30)

    (available edward slot_09_00) (available edward slot_09_30) (available edward slot_10_00) (available edward slot_10_30)
    (available edward slot_11_00) (available edward slot_11_30) (available edward slot_12_00) (available edward slot_12_30)
    (available edward slot_13_00) (available edward slot_13_30) (available edward slot_14_00) (available edward slot_14_30)
    (available edward slot_15_00) (available edward slot_15_30) (available edward slot_16_00) (available edward slot_16_30)

    ; Janice's (soft) preference: prefer the earliest slot (09:00-09:30).
    ; Encoded as a soft preference via a predicate; the planner will try to minimize total-cost
    ; which includes a small penalty if Janice's preferred slot is not chosen.
    (janice-pref slot_09_00)

    ; slot identity facts for ordering/cost
    (is-09-00 slot_09_00)
    (is-09-30 slot_09_30)
    (is-10-00 slot_10_00)
    (is-10-30 slot_10_30)
    (is-11-00 slot_11_00)
    (is-11-30 slot_11_30)
    (is-12-00 slot_12_00)
    (is-12-30 slot_12_30)
    (is-13-00 slot_13_00)
    (is-13-30 slot_13_30)
    (is-14-00 slot_14_00)
    (is-14-30 slot_14_30)
    (is-15-00 slot_15_00)
    (is-15-30 slot_15_30)
    (is-16-00 slot_16_00)
    (is-16-30 slot_16_30)
  )

  (:goal (and
    (meeting-scheduled)
  ))

  ; Minimize the metric total-cost (earliest slot favored; extra small penalty if Janice's preference is not satisfied).
  (:metric minimize (total-cost))
)