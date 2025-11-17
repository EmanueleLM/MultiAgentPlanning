(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:constants
    madison diana shirley - person
  )

  (:predicates
    (busy ?p - person ?s - slot)       ; participant busy in a slot
    (next ?s1 - slot ?s2 - slot)       ; immediate successor slot (30-min step)
    (work_slot ?s - slot)              ; slot is within working hours
    (meeting_scheduled)                ; terminal flag: meeting has been scheduled
  )

  (:action schedule-meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (work_slot ?s1) (work_slot ?s2)
      (next ?s1 ?s2)                    ; contiguous consecutive slots required
      (not (meeting_scheduled))         ; only schedule once (terminal condition)
      (not (busy madison ?s1)) (not (busy madison ?s2))
      (not (busy diana   ?s1)) (not (busy diana   ?s2))
      (not (busy shirley ?s1)) (not (busy shirley ?s2))
    )
    :effect (and
      (meeting_scheduled)               ; enforce terminal condition exactly
      (busy madison ?s1) (busy madison ?s2)
      (busy diana   ?s1) (busy diana   ?s2)
      (busy shirley ?s1) (busy shirley ?s2)
    )
  )
)