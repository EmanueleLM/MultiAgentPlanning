(define (domain integrated-meeting-scheduler)
  (:requirements :typing :strips :negative-preconditions)
  (:types meeting person slot)
  (:constants heather nicholas zachary - person)

  (:predicates
    (meeting-scheduled ?m - meeting)
    (scheduled-at ?m - meeting ?s - slot)
    (available ?p - person ?s - slot)
    (meeting-with ?m - meeting ?p - person)
  )

  (:action schedule_by_heather
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (meeting-scheduled ?m))
      (available heather ?s)
      (available nicholas ?s)
      (available zachary ?s)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m ?s)
      (meeting-with ?m heather)
      (meeting-with ?m nicholas)
      (meeting-with ?m zachary)
      (not (available heather ?s))
      (not (available nicholas ?s))
      (not (available zachary ?s))
    )
  )

  (:action schedule_by_nicholas
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (meeting-scheduled ?m))
      (available heather ?s)
      (available nicholas ?s)
      (available zachary ?s)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m ?s)
      (meeting-with ?m heather)
      (meeting-with ?m nicholas)
      (meeting-with ?m zachary)
      (not (available heather ?s))
      (not (available nicholas ?s))
      (not (available zachary ?s))
    )
  )

  (:action schedule_by_zachary
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (meeting-scheduled ?m))
      (available heather ?s)
      (available nicholas ?s)
      (available zachary ?s)
    )
    :effect (and
      (meeting-scheduled ?m)
      (scheduled-at ?m ?s)
      (meeting-with ?m heather)
      (meeting-with ?m nicholas)
      (meeting-with ?m zachary)
      (not (available heather ?s))
      (not (available nicholas ?s))
      (not (available zachary ?s))
    )
  )
)