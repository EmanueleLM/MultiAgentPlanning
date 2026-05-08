(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    benjamin hannah brenda - person
    meeting1 - meeting

    s_09_00 s_10_00 s_10_30 s_11_00 s_12_30 s_13_00 s_13_30 s_16_30 - slot

    monday - day
  )

  (:init
    ;; slot and day membership
    (slot s_09_00) (slot s_10_00) (slot s_10_30) (slot s_11_00)
    (slot s_12_30) (slot s_13_00) (slot s_13_30) (slot s_16_30)
    (day monday)

    ;; all slots are on Monday (meeting day)
    (slot-on-day s_09_00 monday)
    (slot-on-day s_10_00 monday)
    (slot-on-day s_10_30 monday)
    (slot-on-day s_11_00 monday)
    (slot-on-day s_12_30 monday)
    (slot-on-day s_13_00 monday)
    (slot-on-day s_13_30 monday)
    (slot-on-day s_16_30 monday)

    ;; explicit chronological successor chain (ordering of start slots)
    (slot-successor s_09_00 s_10_00)
    (slot-successor s_10_00 s_10_30)
    (slot-successor s_10_30 s_11_00)
    (slot-successor s_11_00 s_12_30)
    (slot-successor s_12_30 s_13_00)
    (slot-successor s_13_00 s_13_30)
    (slot-successor s_13_30 s_16_30)

    ;; Normalized, validated availability AND hard preferences encoded as constraints:
    ;; Meeting duration is 30 minutes; the listed slots correspond to feasible 30-min starts
    ;; computed by intersecting availabilities and subtracting the duration.
    ;;
    ;; Benjamin: availability 09:00-17:00 but natural-language preferences are treated
    ;; as strict constraints: "Strong preference for 09:00-09:30" and "Prefer not to meet after 09:30"
    ;; are encoded as a hard constraint: meeting must start at 09:00 (the only slot fully finishing by 09:30).
    (available benjamin s_09_00)

    ;; Hannah: available at all feasible start slots resulting from the intersection
    ;; (Hannah's record also specified global constraints that are applied globally).
    (available hannah s_09_00)
    (available hannah s_10_00)
    (available hannah s_10_30)
    (available hannah s_11_00)
    (available hannah s_12_30)
    (available hannah s_13_00)
    (available hannah s_13_30)
    (available hannah s_16_30)

    ;; Brenda: availability from validated free intervals yielded feasible starts
    (available brenda s_09_00)
    (available brenda s_10_00)
    (available brenda s_10_30)
    (available brenda s_11_00)
    (available brenda s_12_30)
    (available brenda s_13_00)
    (available brenda s_13_30)
    (available brenda s_16_30)
  )

  ;; Goal: the single 30-minute meeting on Monday must be scheduled and start at 09:00,
  ;; with all required attendees (Benjamin, Hannah, Brenda) recorded as having accepted.
  (:goal
    (and
      (meeting-scheduled meeting1)
      (meeting-start meeting1 s_09_00)
      (accepted meeting1 benjamin)
      (accepted meeting1 hannah)
      (accepted meeting1 brenda)
      (slot-on-day s_09_00 monday)
    )
  )
)