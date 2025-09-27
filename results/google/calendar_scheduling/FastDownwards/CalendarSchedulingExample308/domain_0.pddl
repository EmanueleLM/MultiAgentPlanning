(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (available ?p - participant ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
    (attends ?p - participant)
    (id-adam ?p - participant)
    (id-frances ?p - participant)
    (id-natalie ?p - participant)
    (id-patrick ?p - participant)
    (id-willie ?p - participant)
    (id-diana ?p - participant)
    (room-available ?s - slot)
  )

  ; A single generic scheduling action that requires each named participant to be available
  ; at the chosen slot. The identity predicates (id-*) bind the action parameters to the
  ; exact participants named in the problem instance (Adam, Frances, Natalie, Patrick, Willie, Diana).
  ; Effects mark the meeting scheduled at that slot and each participant attending; the room and
  ; participant availability for that slot are cleared to reflect the reservation.
  (:action schedule-meeting
    :parameters (?s - slot
                 ?a - participant
                 ?f - participant
                 ?n - participant
                 ?p - participant
                 ?w - participant
                 ?d - participant)
    :precondition (and
      (not (meeting-scheduled))
      (id-adam ?a) (id-frances ?f) (id-natalie ?n) (id-patrick ?p) (id-willie ?w) (id-diana ?d)
      (available ?a ?s) (available ?f ?s) (available ?n ?s) (available ?p ?s) (available ?w ?s) (available ?d ?s)
      (room-available ?s)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
      (attends ?a) (attends ?f) (attends ?n) (attends ?p) (attends ?w) (attends ?d)
      (not (room-available ?s))
      (not (available ?a ?s)) (not (available ?f ?s)) (not (available ?n ?s))
      (not (available ?p ?s)) (not (available ?w ?s)) (not (available ?d ?s))
    )
  )
)