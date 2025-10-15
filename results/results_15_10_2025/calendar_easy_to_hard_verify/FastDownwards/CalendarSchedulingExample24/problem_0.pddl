(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; Objects: the 16 half-hour slots from 09:00-09:30 up to 16:30-17:00
  (:objects
    s09_00_09_30 s09_30_10_00 s10_00_10_30 s10_30_11_00
    s11_00_11_30 s11_30_12_00 s12_00_12_30 s12_30_13_00
    s13_00_13_30 s13_30_14_00 s14_00_14_30 s14_30_15_00
    s15_00_15_30 s15_30_16_00 s16_00_16_30 s16_30_17_00
    ;; Add participant objects here, for example:
    ;; alice bob carol - participant
  )

  ;; Initial facts:
  ;; IMPORTANT: Replace the following comment block with actual participant objects
  ;; in the :objects list and concrete (free <participant> <slot>) facts below,
  ;; according to each participant's availability summaries.
  ;;
  ;; Example (when participants are alice and bob and both free from 09:00-09:30 and 09:30-10:00):
  ;;   (free alice s09_00_09_30)
  ;;   (free alice s09_30_10_00)
  ;;   (free bob   s09_00_09_30)
  ;;   (free bob   s09_30_10_00)
  ;;
  ;; DO NOT invent availability: supply the facts exactly as provided by participants.
  ;; Remove these comments and add the actual (free ...) facts here.

  (:init
    ; << Insert (free <participant> <slot>) facts here, one per available slot per participant >>
    ; Example placeholders (remove when you add real data):
    ; (free alice s09_00_09_30)
    ; (free alice s09_30_10_00)
    ; (free bob   s09_00_09_30)
    ; (free bob   s09_30_10_00)
  )

  ;; Goal: schedule the meeting in a concrete slot. When you provide availability,
  ;; I will set the goal to the earliest slot that is free for every participant.
  ;; For now this is a placeholder: replace with (scheduled <chosen-slot>) after availability is known.
  (:goal
    ; Replace with the chosen slot, e.g. (scheduled s09_00_09_30)
    ; (scheduled s09_00_09_30)
    (and)
  )
)