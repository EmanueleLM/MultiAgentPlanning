(define (problem schedule_meeting_problem)
  (:domain schedule_meeting)

  (:objects
    albert gregory benjamin - person
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30 t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - time_slot
  )

  (:init
    ;; type assertions (optional but included for clarity)
    (person albert)
    (person gregory)
    (person benjamin)

    (time_slot t_09_00)
    (time_slot t_09_30)
    (time_slot t_10_00)
    (time_slot t_10_30)
    (time_slot t_11_00)
    (time_slot t_11_30)
    (time_slot t_12_00)
    (time_slot t_12_30)
    (time_slot t_13_00)
    (time_slot t_13_30)
    (time_slot t_14_00)
    (time_slot t_14_30)
    (time_slot t_15_00)
    (time_slot t_15_30)
    (time_slot t_16_00)
    (time_slot t_16_30)

    ;; busy facts derived from participants' calendars (30-minute slots)
    ;; albert busy slots
    (busy albert t_09_30)
    (busy albert t_10_00)
    (busy albert t_12_00)
    (busy albert t_14_00)
    (busy albert t_15_00)
    (busy albert t_16_30)

    ;; gregory busy slots
    (busy gregory t_11_00)
    (busy gregory t_12_30)
    (busy gregory t_13_30)
    (busy gregory t_15_30)

    ;; benjamin busy slots
    (busy benjamin t_09_30)
    (busy benjamin t_10_30)
    (busy benjamin t_11_30)
    (busy benjamin t_12_00)
    (busy benjamin t_12_30)
    (busy benjamin t_13_00)
    (busy benjamin t_14_00)
    (busy benjamin t_14_30)
    (busy benjamin t_15_30)
    (busy benjamin t_16_30)

    ;; precomputed slot_free facts: true only when none of the three are busy at that slot
    (slot_free t_09_00)
    (slot_free t_16_00)
  )

  (:goal (and
    ;; earliest-availability requirement encoded by domain actions and initial slot_free facts
    (meeting_scheduled_at t_09_00)
  ))
)