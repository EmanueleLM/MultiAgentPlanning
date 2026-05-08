(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types person meeting slot)

  ;; participants as domain constants
  (:constants teresa kathleen patricia - person)

  (:predicates
    (busy ?p - person ?s - slot)        ; person p is busy at slot s
    (early_slot ?s - slot)              ; slot s respects kathleen's pref (no after 14:30)
    (meeting_confirmed ?m - meeting)    ; meeting m has been scheduled
    (meeting_at ?m - meeting ?s - slot) ; meeting m is scheduled at slot s
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (meeting_confirmed ?m))      ; meeting not already scheduled
      (early_slot ?s)                   ; respect kathleen's preference
      (not (busy teresa ?s))            ; all three participants must be free at chosen slot
      (not (busy kathleen ?s))
      (not (busy patricia ?s))
    )
    :effect (and
      (meeting_confirmed ?m)
      (meeting_at ?m ?s)
    )
  )
)