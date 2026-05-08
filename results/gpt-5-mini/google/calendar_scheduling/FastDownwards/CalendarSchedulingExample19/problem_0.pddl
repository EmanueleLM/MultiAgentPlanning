(define (problem schedule-monday-09-17)
  (:domain meeting-scheduling)
  (:objects
    alice bob carol - participant
    s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )

  (:init
    ;; slots representing start times 09:00..16:00 (each slot = 1 hour)
    (slot s9) (slot s10) (slot s11) (slot s12)
    (slot s13) (slot s14) (slot s15) (slot s16)

    ;; participants
    (participant alice) (participant bob) (participant carol)

    ;; explicit successor ordering for contiguity and to reflect timeline
    (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13)
    (next s13 s14) (next s14 s15) (next s15 s16)

    ;; Normalized availability intervals and auditor-corrected intersection:
    ;; All availability is encoded as strict (hard) constraints. The problem
    ;; asserts avail facts for each participant per slot and then asserts
    ;; exactly those slots that are available to every participant using
    ;; all-available. The schedule action requires all-available, so a meeting
    ;; can only be scheduled where every participant is available.
    ;;
    ;; (The following availability facts and the all-available fact represent
    ;; the integrated, audited data for Monday 09:00-17:00.)

    ;; Participant-specific availability (auditor-corrected)
    ;; Alice is available only 10:00-11:00
    (avail alice s10)
    ;; Bob is available only 10:00-11:00
    (avail bob s10)
    ;; Carol is available only 10:00-11:00
    (avail carol s10)

    ;; Intersection availability: slot s10 is available to all participants.
    ;; This is a hard constraint used by the schedule action.
    (all-available s10)
  )

  ;; Goal fixes the mandated terminal condition: a one-hour meeting must be scheduled
  ;; within Monday 09:00-17:00 that fits all participants. The goal requires the
  ;; meeting to be scheduled and fixes the exact slot (the audited intersection).
  (:goal (and
    (meeting-scheduled)
    (scheduled s10)
  ))
)