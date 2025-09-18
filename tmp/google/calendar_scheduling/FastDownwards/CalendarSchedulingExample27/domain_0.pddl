(define (domain integrated-meeting-schedule)
  (:requirements :strips :typing)
  (:types person slot)

  (:predicates
    ;; participant availability: (free ?p ?s) means person ?p is free at slot ?s
    (free ?p - person ?s - slot)

    ;; precomputed helper: (free-for-all ?s) is true iff all participants are free at ?s
    (free-for-all ?s - slot)

    ;; precomputed helper encoding earliest preference:
    ;; (earliest-precond ?s) is true iff there is no earlier slot that is free-for-all
    ;; (i.e. ?s is the earliest slot that could be scheduled given calendars)
    (earliest-precond ?s - slot)

    ;; meeting lifecycle flags
    (meeting-available)         ;; no meeting scheduled yet; used as a positive precondition
    (meeting-scheduled)         ;; meeting has been scheduled
    (meeting-at ?s - slot)      ;; meeting is scheduled at slot ?s
  )

  ;; One scheduling action per slot. Each action requires:
  ;;  - that the slot is free for all participants (free-for-all ?s)
  ;;  - that the slot satisfies the earliest-precond (no earlier slot was free-for-all)
  ;;  - that a meeting is still available to schedule (meeting-available)
  ;; Effects:
  ;;  - mark meeting scheduled and meeting-at that slot
  ;;  - remove meeting-available so no other schedule action is applicable
  (:action schedule-s1
    :precondition (and (free-for-all s1) (earliest-precond s1) (meeting-available))
    :effect (and (not (meeting-available)) (meeting-scheduled) (meeting-at s1))
  )

  (:action schedule-s2
    :precondition (and (free-for-all s2) (earliest-precond s2) (meeting-available))
    :effect (and (not (meeting-available)) (meeting-scheduled) (meeting-at s2))
  )

  (:action schedule-s3
    :precondition (and (free-for-all s3) (earliest-precond s3) (meeting-available))
    :effect (and (not (meeting-available)) (meeting-scheduled) (meeting-at s3))
  )

  (:action schedule-s4
    :precondition (and (free-for-all s4) (earliest-precond s4) (meeting-available))
    :effect (and (not (meeting-available)) (meeting-scheduled) (meeting-at s4))
  )

  (:action schedule-s5
    :precondition (and (free-for-all s5) (earliest-precond s5) (meeting-available))
    :effect (and (not (meeting-available)) (meeting-scheduled) (meeting-at s5))
  )

  (:action schedule-s6
    :precondition (and (free-for-all s6) (earliest-precond s6) (meeting-available))
    :effect (and (not (meeting-available)) (meeting-scheduled) (meeting-at s6))
  )

  (:action schedule-s7
    :precondition (and (free-for-all s7) (earliest-precond s7) (meeting-available))
    :effect (and (not (meeting-available)) (meeting-scheduled) (meeting-at s7))
  )

  (:action schedule-s8
    :precondition (and (free-for-all s8) (earliest-precond s8) (meeting-available))
    :effect (and (not (meeting-available)) (meeting-scheduled) (meeting-at s8))
  )

  (:action schedule-s9
    :precondition (and (free-for-all s9) (earliest-precond s9) (meeting-available))
    :effect (and (not (meeting-available)) (meeting-scheduled) (meeting-at s9))
  )

  (:action schedule-s10
    :precondition (and (free-for-all s10) (earliest-precond s10) (meeting-available))
    :effect (and (not (meeting-available)) (meeting-scheduled) (meeting-at s10))
  )

  (:action schedule-s11
    :precondition (and (free-for-all s11) (earliest-precond s11) (meeting-available))
    :effect (and (not (meeting-available)) (meeting-scheduled) (meeting-at s11))
  )

  (:action schedule-s12
    :precondition (and (free-for-all s12) (earliest-precond s12) (meeting-available))
    :effect (and (not (meeting-available)) (meeting-scheduled) (meeting-at s12))
  )

  (:action schedule-s13
    :precondition (and (free-for-all s13) (earliest-precond s13) (meeting-available))
    :effect (and (not (meeting-available)) (meeting-scheduled) (meeting-at s13))
  )

  (:action schedule-s14
    :precondition (and (free-for-all s14) (earliest-precond s14) (meeting-available))
    :effect (and (not (meeting-available)) (meeting-scheduled) (meeting-at s14))
  )

  (:action schedule-s15
    :precondition (and (free-for-all s15) (earliest-precond s15) (meeting-available))
    :effect (and (not (meeting-available)) (meeting-scheduled) (meeting-at s15))
  )

  (:action schedule-s16
    :precondition (and (free-for-all s16) (earliest-precond s16) (meeting-available))
    :effect (and (not (meeting-available)) (meeting-scheduled) (meeting-at s16))
  )

)