(define (domain meeting-scheduling-integrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (fits_all ?s - slot)
    (free_a1 ?p - person ?s - slot)
    (scheduled_a1 ?s - slot)
    (available ?p - person ?s - slot)
    (meeting_made)
    (no_meeting_made)
    (meeting_scheduled_a2 ?s - slot)
    (scheduled_for ?p - person ?s - slot)
    (free_a3 ?p - person ?s - slot)
    (meeting_scheduled_a3 ?s - slot)
    (meeting_with ?p1 - person ?p2 - person ?s - slot)
    (fits_all_exists)
  )

  (:action schedule_meeting_a1
    :parameters (?p - person ?s - slot)
    :precondition (and
                    (fits_all ?s)
                    (free_a1 ?p ?s)
                    (not (scheduled_a1 ?s))
                  )
    :effect (and
              (scheduled_a1 ?s)
              (not (free_a1 ?p ?s))
            )
  )

  (:action schedule_meeting_two_a2
    :parameters (?s - slot ?p1 - person ?p2 - person)
    :precondition (and
                    (available ?p1 ?s)
                    (available ?p2 ?s)
                    (no_meeting_made)
                  )
    :effect (and
              (meeting_made)
              (not (no_meeting_made))
              (meeting_scheduled_a2 ?s)
              (scheduled_for ?p1 ?s)
              (scheduled_for ?p2 ?s)
              (not (available ?p1 ?s))
              (not (available ?p2 ?s))
            )
  )

  (:action schedule_meeting_a3
    :parameters (?a - person ?b - person ?s - slot)
    :precondition (and
                    (free_a3 ?a ?s)
                    (fits_all_exists)
                  )
    :effect (and
              (meeting_scheduled_a3 ?s)
              (meeting_with ?a ?b ?s)
              (not (free_a3 ?a ?s))
            )
  )
)