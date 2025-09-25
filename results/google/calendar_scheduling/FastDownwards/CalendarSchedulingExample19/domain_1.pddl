(define (domain schedule-meeting-domain)
  (:requirements :strips :typing)
  (:types agent slot)

  (:predicates
    (free ?a - agent ?s - slot)
    (succ ?s - slot ?t - slot)
    (attested ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  (:action attest
    :parameters (?a - agent ?s - slot ?t - slot)
    :precondition (and (succ ?s ?t) (free ?a ?s) (free ?a ?t))
    :effect (attested ?a ?s)
  )

  (:action finalize-meeting
    :parameters (?s - slot ?a1 - agent ?a2 - agent ?a3 - agent)
    :precondition (and (attested ?a1 ?s) (attested ?a2 ?s) (attested ?a3 ?s))
    :effect (meeting-scheduled ?s)
  )
)