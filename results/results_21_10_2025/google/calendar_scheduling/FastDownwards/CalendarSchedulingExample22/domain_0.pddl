(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)

  (:predicates
    (next ?t1 - timeslot ?t2 - timeslot)    ; successor half-hour timeslots
    (free ?p - person ?t - timeslot)        ; person is free during the half-hour starting at ?t
    (meeting-scheduled)                      ; one meeting has been scheduled
    (meeting-start ?t - timeslot)            ; meeting starts at timeslot ?t
  )

  (:action schedule-meeting
    :parameters (?t - timeslot ?t2 - timeslot ?a - person ?b - person ?c - person)
    :precondition (and
                    (not (meeting-scheduled))
                    (next ?t ?t2)
                    (free ?a ?t) (free ?a ?t2)
                    (free ?b ?t) (free ?b ?t2)
                    (free ?c ?t) (free ?c ?t2)
                   )
    :effect (and
              (meeting-scheduled)
              (meeting-start ?t)
            )
  )
)