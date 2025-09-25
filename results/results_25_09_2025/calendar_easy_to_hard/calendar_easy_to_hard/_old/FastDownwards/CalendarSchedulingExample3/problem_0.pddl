(define (problem orchestrated-schedule)
  (:domain orchestrated-meeting)
  (:objects
    ;; persons / meeting
    arthur - person
    m1 - meeting

    ;; unified slot names (30-min markers 09:00 - 16:30)
    s9_00 s9_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ;; adjacency (30-min steps)
    (next s9_00 s9_30) (next s9_30 s10_00) (next s10_00 s10_30) (next s10_30 s11_00)
    (next s11_00 s11_30) (next s11_30 s12_00) (next s12_00 s12_30) (next s12_30 s13_00)
    (next s13_00 s13_30) (next s13_30 s14_00) (next s14_00 s14_30) (next s14_30 s15_00)
    (next s15_00 s15_30) (next s15_30 s16_00) (next s16_00 s16_30)

    ;; Participant 1: Arthur's availability (from first participant)
    ;; Busy: s9_00, s10_30, s11_00, s11_30, s16_00, s16_30
    (free_person arthur s9_30) (free_person arthur s10_00)
    (free_person arthur s12_00) (free_person arthur s12_30)
    (free_person arthur s13_00) (free_person arthur s13_30)
    (free_person arthur s14_00) (free_person arthur s14_30)
    (free_person arthur s15_00) (free_person arthur s15_30)

    ;; Participant 2: Michael's data (translated to unified slot names)
    ;; Within work hours for all relevant slots
    (within_work s9_00) (within_work s9_30) (within_work s10_00) (within_work s10_30)
    (within_work s11_00) (within_work s11_30) (within_work s12_00) (within_work s12_30)
    (within_work s13_00) (within_work s13_30) (within_work s14_00) (within_work s14_30)
    (within_work s15_00) (within_work s15_30) (within_work s16_00) (within_work s16_30)

    ;; Michael's busy slots (from second participant)
    (busy_slot s13_00)
    (busy_slot s14_00)

    ;; meeting m1 is initially unscheduled
    (unscheduled m1)

    ;; Participant 3: free half-hour markers (from third participant)
    ;; Free: s9_00, s9_30, s10_00, s11_00, s11_30, s15_00
    (free_slot s9_00)
    (free_slot s9_30)
    (free_slot s10_00)
    (free_slot s11_00)
    (free_slot s11_30)
    (free_slot s15_00)
  )

  ;; Combined goal: satisfy all three participants' goals for the same start slot.
  ;; From integration we pick the joint feasible start s9_30 (09:30-10:30).
  (:goal (and
    ;; Arthur's goal: meeting scheduled starting at s9_30
    (meeting_scheduled s9_30)

    ;; Michael's goal: meeting m1 scheduled (start at s9_30)
    (scheduled_michael m1 s9_30)

    ;; Participant 3's goal: global scheduled marker and meeting-start at s9_30
    (scheduled_global)
    (meeting-start s9_30)
  ))
)