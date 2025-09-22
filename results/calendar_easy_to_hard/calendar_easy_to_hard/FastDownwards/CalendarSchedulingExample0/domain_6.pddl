(define (domain orchestrated-scheduling)
  (:requirements :strips :adl :typing)
  (:types person meeting slot)
  (:constants michelle steven jerry - person)
  (:predicates
    (next ?s1 - slot ?s2 - slot)
    (free ?p - person ?s - slot)
    (duration-60 ?m - meeting)
    (scheduled ?p - person ?m - meeting ?s1 - slot ?s2 - slot)
    (meeting-finalized ?m - meeting)
    (meeting-time ?m - meeting ?s - slot)
  )

  (:action schedule-michelle
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free michelle ?s1)
      (free michelle ?s2)
      (duration-60 ?m)
    )
    :effect (and
      (scheduled michelle ?m ?s1 ?s2)
      (not (free michelle ?s1))
      (not (free michelle ?s2))
    )
  )

  (:action schedule-steven
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free steven ?s1)
      (free steven ?s2)
      (duration-60 ?m)
    )
    :effect (and
      (scheduled steven ?m ?s1 ?s2)
      (not (free steven ?s1))
      (not (free steven ?s2))
    )
  )

  (:action schedule-jerry
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free jerry ?s1)
      (free jerry ?s2)
      (duration-60 ?m)
    )
    :effect (and
      (scheduled jerry ?m ?s1 ?s2)
      (not (free jerry ?s1))
      (not (free jerry ?s2))
    )
  )

  (:action finalize-meeting
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (scheduled michelle ?m ?s1 ?s2)
      (scheduled steven ?m ?s1 ?s2)
      (scheduled jerry ?m ?s1 ?s2)
      (duration-60 ?m)
    )
    :effect (and
      (meeting-finalized ?m)
      (meeting-time ?m ?s1)
    )
  )
)