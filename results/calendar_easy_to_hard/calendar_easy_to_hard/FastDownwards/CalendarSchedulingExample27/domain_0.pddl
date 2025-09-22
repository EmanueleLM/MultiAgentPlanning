(define (domain multi-agent-meeting)
  (:requirements :typing :strips :negative-preconditions :equality :quantified-preconditions)
  (:types participant slot)

  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    (before ?s1 - slot ?s2 - slot)     ; s1 is earlier than s2
    (free ?p - participant ?s - slot)  ; participant p is free at slot s
    (slot-free ?s - slot)              ; slot s is free (no meeting scheduled)
    (scheduled)                        ; a meeting has been scheduled
    (scheduled-at ?s - slot)           ; meeting scheduled at slot s
  )

  ;; Schedule the meeting at a given slot if:
  ;; - the slot exists and is currently slot-free
  ;; - every participant is free at that slot
  ;; - there does NOT exist any earlier slot that is still slot-free
  ;;   (this enforces the "earliest available" preference)
  (:action schedule-at
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (slot-free ?s)
      (forall (?p - participant) (free ?p ?s))
      (not (exists (?ear - slot) (and (before ?ear ?s) (slot-free ?ear))))
    )
    :effect (and
      (not (slot-free ?s))
      (scheduled)
      (scheduled-at ?s)
    )
  )
)