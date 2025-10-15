(define (domain meeting-scheduling)
  (:requirements :typing :quantified-preconditions)
  (:types participant slot)

  (:predicates
    (free ?p - participant ?s - slot)        ; participant ?p is free in slot ?s
    (attended ?p - participant ?s - slot)    ; participant ?p has been marked as attending slot ?s
    (scheduled ?s - slot)                   ; meeting has been scheduled in slot ?s (goal)
  )

  ;; Each participant can take an explicit attend action for a given slot,
  ;; which requires that participant be free in that slot.
  (:action attend
    :parameters (?p - participant ?s - slot)
    :precondition (free ?p ?s)
    :effect (attended ?p ?s)
  )

  ;; Finalize/confirm the meeting in a slot only when every participant has attended that slot.
  ;; This uses a quantified (universal) precondition over participants.
  (:action finalize
    :parameters (?s - slot)
    :precondition (forall (?p - participant) (attended ?p ?s))
    :effect (scheduled ?s)
  )
)