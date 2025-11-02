(define (domain schedule-meeting)
  (:requirements :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (uncommitted-sara)
    (uncommitted-sarah)
    (uncommitted-shirley)
    (uncommitted-harold)
    (uncommitted-terry)
    (committed-sara ?s - slot)
    (committed-sarah ?s - slot)
    (committed-shirley ?s - slot)
    (committed-harold ?s - slot)
    (committed-terry ?s - slot)
    (scheduled)
    (meeting-at ?s - slot)
  )

  (:action commit-sara
    :parameters (?s - slot)
    :precondition (and (uncommitted-sara) (free sara ?s) (not (scheduled)))
    :effect (and (not (uncommitted-sara)) (committed-sara ?s))
  )

  (:action commit-sarah
    :parameters (?s - slot)
    :precondition (and (uncommitted-sarah) (free sarah ?s) (not (scheduled)))
    :effect (and (not (uncommitted-sarah)) (committed-sarah ?s))
  )

  (:action commit-shirley
    :parameters (?s - slot)
    :precondition (and (uncommitted-shirley) (free shirley ?s) (not (scheduled)))
    :effect (and (not (uncommitted-shirley)) (committed-shirley ?s))
  )

  (:action commit-harold
    :parameters (?s - slot)
    :precondition (and (uncommitted-harold) (free harold ?s) (not (scheduled)))
    :effect (and (not (uncommitted-harold)) (committed-harold ?s))
  )

  (:action commit-terry
    :parameters (?s - slot)
    :precondition (and (uncommitted-terry) (free terry ?s) (not (scheduled)))
    :effect (and (not (uncommitted-terry)) (committed-terry ?s))
  )

  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (committed-sara ?s)
      (committed-sarah ?s)
      (committed-shirley ?s)
      (committed-harold ?s)
      (committed-terry ?s)
    )
    :effect (and (scheduled) (meeting-at ?s))
  )
)