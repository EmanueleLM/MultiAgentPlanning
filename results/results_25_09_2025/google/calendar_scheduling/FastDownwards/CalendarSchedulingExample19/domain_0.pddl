(define (domain schedule-meeting-domain)
  (:requirements :strips :typing)
  (:types agent slot)

  (:predicates
    (free ?a - agent ?s - slot)          ; agent is free in 30min slot
    (succ ?s - slot ?t - slot)          ; ?t immediately follows ?s (30min granularity)
    (attested-stephen ?s - slot)
    (attested-edward ?s - slot)
    (attested-angela ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  ;; Stephen attests a start time if both consecutive slots are free for him
  (:action attest-stephen
    :parameters (?s - slot ?t - slot)
    :precondition (and (succ ?s ?t) (free stephen ?s) (free stephen ?t))
    :effect (attested-stephen ?s)
  )

  ;; Edward attests a start time if both consecutive slots are free for him
  (:action attest-edward
    :parameters (?s - slot ?t - slot)
    :precondition (and (succ ?s ?t) (free edward ?s) (free edward ?t))
    :effect (attested-edward ?s)
  )

  ;; Angela attests a start time if both consecutive slots are free for her
  (:action attest-angela
    :parameters (?s - slot ?t - slot)
    :precondition (and (succ ?s ?t) (free angela ?s) (free angela ?t))
    :effect (attested-angela ?s)
  )

  ;; Finalize the meeting when all three have attested the same start
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (attested-stephen ?s) (attested-edward ?s) (attested-angela ?s))
    :effect (meeting-scheduled ?s)
  )
)