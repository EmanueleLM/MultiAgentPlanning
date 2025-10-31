(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  (:predicates
    (slot ?t - timeslot)
    (available ?p - person ?t - timeslot)
    (meeting-scheduled)
    (meeting-start ?t - timeslot)
    (attending ?p - person ?t - timeslot)
  )

  ; Action that schedules the meeting at a chosen timeslot if every participant is available.
  (:action schedule-meeting
    :parameters (?t - timeslot
                 ?d - person ?h - person ?a - person ?e - person ?b - person ?deb - person)
    :precondition (and
                    (slot ?t)
                    (not (meeting-scheduled))
                    (available ?d ?t)
                    (available ?h ?t)
                    (available ?a ?t)
                    (available ?e ?t)
                    (available ?b ?t)
                    (available ?deb ?t)
                   )
    :effect (and
              (meeting-scheduled)
              (meeting-start ?t)
              (attending ?d ?t)
              (attending ?h ?t)
              (attending ?a ?t)
              (attending ?e ?t)
              (attending ?b ?t)
              (attending ?deb ?t)
            )
  )
)