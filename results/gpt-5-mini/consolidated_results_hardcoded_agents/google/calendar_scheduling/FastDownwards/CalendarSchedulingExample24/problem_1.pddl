(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects
    Benjamin Hannah Brenda - participant
    s09_00_09_30 s09_30_10_00 s10_00_10_30 s10_30_11_00 s11_00_11_30
    s11_30_12_00 s12_00_12_30 s12_30_13_00 s13_00_13_30 s13_30_14_00
    s14_00_14_30 s14_30_15_00 s15_00_15_30 s15_30_16_00 s16_00_16_30 s16_30_17_00 - slot
  )

  (:init
    ;; All listed slots are inside the Monday 09:00-17:00 work window
    (slot-in-window s09_00_09_30)
    (slot-in-window s09_30_10_00)
    (slot-in-window s10_00_10_30)
    (slot-in-window s10_30_11_00)
    (slot-in-window s11_00_11_30)
    (slot-in-window s11_30_12_00)
    (slot-in-window s12_00_12_30)
    (slot-in-window s12_30_13_00)
    (slot-in-window s13_00_13_30)
    (slot-in-window s13_30_14_00)
    (slot-in-window s14_00_14_30)
    (slot-in-window s14_30_15_00)
    (slot-in-window s15_00_15_30)
    (slot-in-window s15_30_16_00)
    (slot-in-window s16_00_16_30)
    (slot-in-window s16_30_17_00)

    ;; Benjamin's expressed preference (audited and enforced): he does not want to meet after 09:30.
    ;; This is encoded as a final constraint restricting allowed slots for Benjamin to those ending no later than 09:30.
    (benjamin-allowed s09_00_09_30)

    ;; Participant availabilities:
    ;; Benjamin: free the entire day -> available on all listed slots
    (available Benjamin s09_00_09_30)
    (available Benjamin s09_30_10_00)
    (available Benjamin s10_00_10_30)
    (available Benjamin s10_30_11_00)
    (available Benjamin s11_00_11_30)
    (available Benjamin s11_30_12_00)
    (available Benjamin s12_00_12_30)
    (available Benjamin s12_30_13_00)
    (available Benjamin s13_00_13_30)
    (available Benjamin s13_30_14_00)
    (available Benjamin s14_00_14_30)
    (available Benjamin s14_30_15_00)
    (available Benjamin s15_00_15_30)
    (available Benjamin s15_30_16_00)
    (available Benjamin s16_00_16_30)
    (available Benjamin s16_30_17_00)

    ;; Hannah: free the entire day -> available on all listed slots
    (available Hannah s09_00_09_30)
    (available Hannah s09_30_10_00)
    (available Hannah s10_00_10_30)
    (available Hannah s10_30_11_00)
    (available Hannah s11_00_11_30)
    (available Hannah s11_30_12_00)
    (available Hannah s12_00_12_30)
    (available Hannah s12_30_13_00)
    (available Hannah s13_00_13_30)
    (available Hannah s13_30_14_00)
    (available Hannah s14_00_14_30)
    (available Hannah s14_30_15_00)
    (available Hannah s15_00_15_30)
    (available Hannah s15_30_16_00)
    (available Hannah s16_00_16_30)
    (available Hannah s16_30_17_00)

    ;; Brenda: busy 09:30-10:00, 11:30-12:30 (covers 11:30-12:00 and 12:00-12:30),
    ;; and 14:00-16:30 (covers 14:00-14:30 ... 16:00-16:30).
    ;; Therefore Brenda is available only on slots that do not overlap those busy intervals.
    (available Brenda s09_00_09_30)
    (available Brenda s10_00_10_30)
    (available Brenda s10_30_11_00)
    (available Brenda s11_00_11_30)
    (available Brenda s12_30_13_00)
    (available Brenda s13_00_13_30)
    (available Brenda s13_30_14_00)
    (available Brenda s16_30_17_00)
  )

  ;; Goal: require that some slot is scheduled (the action will set meeting-scheduled).
  ;; The goal does not name a particular slot explicitly.
  (:goal (meeting-scheduled))
)