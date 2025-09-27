(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)

  (:predicates
    (free ?a - agent ?s - slot)
    (attended ?a - agent ?s - slot)
    (has-attended ?a - agent)
    (participant ?a - agent)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  (:action attend-stephen
    :parameters (?s - slot)
    :precondition (and (participant stephen) (free stephen ?s) (not (has-attended stephen)) (not (meeting-scheduled)))
    :effect (and (attended stephen ?s) (has-attended stephen))
  )

  (:action attend-elijah
    :parameters (?s - slot)
    :precondition (and (participant elijah) (free elijah ?s) (not (has-attended elijah)) (not (meeting-scheduled)))
    :effect (and (attended elijah ?s) (has-attended elijah))
  )

  (:action attend-william
    :parameters (?s - slot)
    :precondition (and (participant william) (free william ?s) (not (has-attended william)) (not (meeting-scheduled)))
    :effect (and (attended william ?s) (has-attended william))
  )

  (:action attend-jeremy
    :parameters (?s - slot)
    :precondition (and (participant jeremy) (free jeremy ?s) (not (has-attended jeremy)) (not (meeting-scheduled)))
    :effect (and (attended jeremy ?s) (has-attended jeremy))
  )

  (:action attend-timothy
    :parameters (?s - slot)
    :precondition (and (participant timothy) (free timothy ?s) (not (has-attended timothy)) (not (meeting-scheduled)))
    :effect (and (attended timothy ?s) (has-attended timothy))
  )

  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and
      (attended stephen ?s)
      (attended elijah ?s)
      (attended william ?s)
      (attended jeremy ?s)
      (attended timothy ?s)
      (not (meeting-scheduled))
    )
    :effect (and (meeting-scheduled) (scheduled ?s))
  )
)