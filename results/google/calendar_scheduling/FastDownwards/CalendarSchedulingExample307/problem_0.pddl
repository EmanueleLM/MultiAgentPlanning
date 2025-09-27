(define (problem schedule-meeting-monday-template)
  (:domain meeting-scheduling)

  ;; Objects: every half-hour slot from 09:00 to 16:30 on Monday (inclusive).
  ;; Interpretation: each slot denotes the 30-minute interval starting at that time.
  (:objects
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
    ;; Add person objects here, for example:
    ;; alice bob carol - person
  )

  (:init
    ;; Slot facts (present for clarity; not strictly necessary for FastDownward
    ;; but explicit here to show allowed slot objects)
    (slot s09_00) (slot s09_30) (slot s10_00) (slot s10_30)
    (slot s11_00) (slot s11_30) (slot s12_00) (slot s12_30)
    (slot s13_00) (slot s13_30) (slot s14_00) (slot s14_30)
    (slot s15_00) (slot s15_30) (slot s16_00) (slot s16_30)

    ;; Participant availability facts go here. Example (commented out):
    ;; (person alice) (available alice s09_00) (available alice s09_30) ...
    ;; (person bob)   (available bob s09_30) (available bob s10_00) ...
    ;;
    ;; IMPORTANT: Do not invent availability. I will add these facts exactly
    ;; from the availability you supply.
  )

  ;; Goal: meeting scheduled at some allowed slot.
  ;; The planner will set (meeting-scheduled) and a specific (scheduled ?s).
  (:goal (meeting-scheduled))
)