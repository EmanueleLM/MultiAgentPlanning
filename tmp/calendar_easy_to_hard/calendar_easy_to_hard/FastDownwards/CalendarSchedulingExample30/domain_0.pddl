(define (domain integrated-meeting-scheduling)
  (:requirements :typing :adl :negative-preconditions :universal-preconditions)
  (:types participant slot)

  ;; Predicates (union of predicates used by contributors)
  (:predicates
    (participant ?p - participant)       ; declared participant objects
    (slot ?s - slot)                    ; declared slot objects (30-min start times)
    (allowed_slot ?s - slot)            ; slot is within Mon 09:00-17:00 window
    (busy ?p - participant ?s - slot)   ; participant is busy at that slot (cannot attend)
    (available ?p - participant ?s - slot) ; explicit availability facts (Joe uses)
    (scheduled-for ?p - participant ?s - slot) ; intermediate scheduling per-person (Joe)
    (attending ?p - participant ?s - slot)     ; participant attends meeting at slot
    (meeting-scheduled)                 ; global flag: meeting scheduled
    (meeting-at ?s - slot)              ; meeting is scheduled at slot
  )

  ;; Eric-style explicit action: checks explicitly-named participants are not busy.
  (:action schedule-by-eric
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (not (meeting-scheduled))
      ;; Eric's original action required explicit non-busy for each participant
      (not (busy eric ?s))
      (not (busy jeremy ?s))
      (not (busy joe ?s))
      (not (busy brian ?s))
      (not (busy brittany ?s))
      (not (busy julia ?s))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      ;; mark attending for all participants
      (forall (?p - participant) (attending ?p ?s))
    )
  )

  ;; Jeremy-style action: uses universal precondition ensuring no participant is busy at the slot.
  (:action schedule-by-jeremy
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (not (meeting-scheduled))
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (forall (?p - participant) (attending ?p ?s))
    )
  )

  ;; Brian-style action: same universal precondition pattern (keeps action distinct).
  (:action schedule-by-brian
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (not (meeting-scheduled))
      (forall (?p - participant) (not (busy ?p ?s)))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (forall (?p - participant) (attending ?p ?s))
    )
  )

  ;; Brittany-style action: ensures Brittany is available (only Brittany's busy info known explicitly).
  ;; Keeps action distinct (as required). This action will succeed only if Brittany is free; it does not
  ;; explicitly require others to be free (but other actions do).
  (:action schedule-by-brittany
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (not (meeting-scheduled))
      (not (busy brittany ?s))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (forall (?p - participant) (attending ?p ?s))
    )
  )

  ;; Julia-style action: requires allowed_slot (within Monday 09:00-17:00) and Julia not busy.
  (:action schedule-by-julia
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (allowed_slot ?s)
      (not (busy julia ?s))
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (forall (?p - participant) (attending ?p ?s))
    )
  )

  ;; Joe-style actions: allow building per-person scheduled-for facts (Joe declared explicit availability).
  ;; These actions are kept distinct to reflect Joe's model.
  (:action joe-schedule-for
    :parameters (?p - participant ?s - slot)
    :precondition (and
      (participant ?p)
      (slot ?s)
      (available ?p ?s)
    )
    :effect (and
      (scheduled-for ?p ?s)
    )
  )

  (:action joe-finalize
    :parameters (?s - slot ?p1 - participant ?p2 - participant ?p3 - participant
                 ?p4 - participant ?p5 - participant ?p6 - participant)
    :precondition (and
      (slot ?s)
      (not (meeting-scheduled))
      (scheduled-for ?p1 ?s)
      (scheduled-for ?p2 ?s)
      (scheduled-for ?p3 ?s)
      (scheduled-for ?p4 ?s)
      (scheduled-for ?p5 ?s)
      (scheduled-for ?p6 ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (attending ?p1 ?s)
      (attending ?p2 ?s)
      (attending ?p3 ?s)
      (attending ?p4 ?s)
      (attending ?p5 ?s)
      (attending ?p6 ?s)
    )
  )
)