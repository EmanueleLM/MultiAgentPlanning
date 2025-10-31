(define (domain schedule-meeting-domain)
  (:requirements :strips :typing)
  (:types agent slot)

  (:predicates
    (free ?a - agent ?s - slot)
    (succ ?s - slot ?t - slot)
    (attested ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  (:action attest-stephen
    :parameters (?s - slot ?t - slot)
    :precondition (and (succ ?s ?t) (free stephen ?s) (free stephen ?t))
    :effect (attested stephen ?s)
  )

  (:action attest-edward
    :parameters (?s - slot ?t - slot)
    :precondition (and (succ ?s ?t) (free edward ?s) (free edward ?t))
    :effect (attested edward ?s)
  )

  (:action attest-angela
    :parameters (?s - slot ?t - slot)
    :precondition (and (succ ?s ?t) (free angela ?s) (free angela ?t))
    :effect (attested angela ?s)
  )

  (:action finalize-orchestrator
    :parameters (?s - slot)
    :precondition (and (attested stephen ?s) (attested edward ?s) (attested angela ?s))
    :effect (meeting-scheduled ?s)
  )
)