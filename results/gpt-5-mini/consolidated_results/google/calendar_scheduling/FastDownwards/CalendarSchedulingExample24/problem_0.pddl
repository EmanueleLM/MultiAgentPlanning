(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects
    Benjamin Hannah Brenda - participant
    s09_00_09_30 s09_30_10_00 s11_30_12_00 s12_00_12_30
    s14_00_14_30 s14_30_15_00 s15_00_15_30 s15_30_16_00 s16_00_16_30 - slot
  )

  (:init
    ;; All listed slots lie inside the work window 09:00-17:00
    (slot-in-window s09_00_09_30)
    (slot-in-window s09_30_10_00)
    (slot-in-window s11_30_12_00)
    (slot-in-window s12_00_12_30)
    (slot-in-window s14_00_14_30)
    (slot-in-window s14_30_15_00)
    (slot-in-window s15_00_15_30)
    (slot-in-window s15_30_16_00)
    (slot-in-window s16_00_16_30)

    ;; Benjamin's hard preference treated as a strict constraint:
    ;; meeting must end no later than 09:30 -> only s09_00_09_30 is allowed for him
    (benjamin-allowed s09_00_09_30)

    ;; Participant availabilities (explicit facts)
    ;; Benjamin: free the entire day -> available on all listed slots
    (available Benjamin s09_00_09_30)
    (available Benjamin s09_30_10_00)
    (available Benjamin s11_30_12_00)
    (available Benjamin s12_00_12_30)
    (available Benjamin s14_00_14_30)
    (available Benjamin s14_30_15_00)
    (available Benjamin s15_00_15_30)
    (available Benjamin s15_30_16_00)
    (available Benjamin s16_00_16_30)

    ;; Hannah: free the entire day -> available on all listed slots
    (available Hannah s09_00_09_30)
    (available Hannah s09_30_10_00)
    (available Hannah s11_30_12_00)
    (available Hannah s12_00_12_30)
    (available Hannah s14_00_14_30)
    (available Hannah s14_30_15_00)
    (available Hannah s15_00_15_30)
    (available Hannah s15_30_16_00)
    (available Hannah s16_00_16_30)

    ;; Brenda: busy on the listed intervals; therefore only explicitly available slots are allowed.
    ;; Busy: 09:30-10:00, 11:30-12:30 (covers two 30-min slots), 14:00-16:30 (covers many 30-min slots).
    ;; From the provided data, only 09:00-09:30 is guaranteed free for Brenda among the enumerated slots.
    (available Brenda s09_00_09_30)
    ;; Note: other slots for Brenda are not asserted available because they overlap her busy intervals
    ;; (explicitly encoding the hard participant-availability constraints).
  )

  (:goal (and
    ;; Meeting scheduled in the chosen 30-minute slot and all participants attend.
    (scheduled s09_00_09_30)
    (attended Benjamin s09_00_09_30)
    (attended Hannah s09_00_09_30)
    (attended Brenda s09_00_09_30)
  ))
)