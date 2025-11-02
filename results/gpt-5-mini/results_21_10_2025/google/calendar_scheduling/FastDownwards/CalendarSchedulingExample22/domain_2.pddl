(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)

  (:predicates
    (next ?t1 - timeslot ?t2 - timeslot)
    (free ?p - person ?t - timeslot)
    (meeting-scheduled)
    (meeting-start ?t - timeslot)
  )

  (:action schedule-meeting
    :parameters (?t - timeslot ?t2 - timeslot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
                    (not (meeting-scheduled))
                    (next ?t ?t2)
                    (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p2 ?p3))
                    (free ?p1 ?t) (free ?p1 ?t2)
                    (free ?p2 ?t) (free ?p2 ?t2)
                    (free ?p3 ?t) (free ?p3 ?t2)
                   )
    :effect (and
              (meeting-scheduled)
              (meeting-start ?t)
            )
  )
)