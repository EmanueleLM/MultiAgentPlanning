(define (domain orchestrated-scheduling)
  (:requirements :strips :adl :typing :action-costs)
  (:types person meeting slot)
  (:predicates
    (person ?p - person)
    (slot ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (free ?p - person ?s - slot)
    (duration-60 ?m - meeting)
    (scheduled-michelle ?m - meeting ?s - slot)
    (scheduled-steven ?m - meeting ?s - slot)
    (scheduled-jerry ?m - meeting ?s - slot)
    (meeting-finalized ?m - meeting)
    (meeting-time ?m - meeting ?s - slot)
  )

  (:action schedule-michelle
    :parameters (?m - meeting ?s1 - slot ?s2 - slot ?p - person)
    :precondition (and
      (person ?p)
      (next ?s1 ?s2)
      (free ?p ?s1)
      (free ?p ?s2)
      (duration-60 ?m)
    )
    :effect (and
      (scheduled-michelle ?m ?s1)
      (not (free ?p ?s1))
      (not (free ?p ?s2))
    )
    :cost 1
  )

  (:action schedule-steven
    :parameters (?m - meeting ?p - person ?s1 - slot ?s2 - slot)
    :precondition (and
      (person ?p)
      (next ?s1 ?s2)
      (free ?p ?s1)
      (free ?p ?s2)
      (duration-60 ?m)
    )
    :effect (and
      (scheduled-steven ?m ?s1)
      (not (free ?p ?s1))
      (not (free ?p ?s2))
    )
    :cost 1
  )

  (:action schedule-jerry
    :parameters (?m - meeting ?p - person ?s1 - slot ?s2 - slot)
    :precondition (and
      (person ?p)
      (next ?s1 ?s2)
      (free ?p ?s1)
      (free ?p ?s2)
      (duration-60 ?m)
    )
    :effect (and
      (scheduled-jerry ?m ?s1)
      (not (free ?p ?s1))
      (not (free ?p ?s2))
    )
    :cost 1
  )

  (:action finalize-meeting
    :parameters (?m - meeting ?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (scheduled-michelle ?m ?s1)
      (scheduled-steven ?m ?s1)
      (scheduled-jerry ?m ?s1)
      (duration-60 ?m)
    )
    :effect (and
      (meeting-finalized ?m)
      (meeting-time ?m ?s1)
    )
    :cost 0
  )
)