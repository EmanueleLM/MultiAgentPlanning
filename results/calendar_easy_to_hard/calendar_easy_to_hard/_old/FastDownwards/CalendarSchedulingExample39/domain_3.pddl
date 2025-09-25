(define (domain meeting-scheduling-integrated)
  (:requirements :strips :typing :equality)
  (:types participant slot meeting)
  (:constants nicholas emma catherine steven adam lori - participant)
  (:predicates
    (free ?p - participant ?s - slot)
    (included ?m - meeting ?p - participant ?s - slot)
    (scheduled ?m - meeting ?s - slot)
  )

  (:action confirm-nicholas
    :parameters (?m - meeting ?s - slot)
    :precondition (free nicholas ?s)
    :effect (included ?m nicholas ?s)
  )

  (:action confirm-emma
    :parameters (?m - meeting ?s - slot)
    :precondition (free emma ?s)
    :effect (included ?m emma ?s)
  )

  (:action confirm-catherine
    :parameters (?m - meeting ?s - slot)
    :precondition (free catherine ?s)
    :effect (included ?m catherine ?s)
  )

  (:action confirm-steven
    :parameters (?m - meeting ?s - slot)
    :precondition (free steven ?s)
    :effect (included ?m steven ?s)
  )

  (:action confirm-adam
    :parameters (?m - meeting ?s - slot)
    :precondition (free adam ?s)
    :effect (included ?m adam ?s)
  )

  (:action confirm-lori
    :parameters (?m - meeting ?s - slot)
    :precondition (free lori ?s)
    :effect (included ?m lori ?s)
  )

  (:action finalize-meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (included ?m nicholas ?s)
      (included ?m emma ?s)
      (included ?m catherine ?s)
      (included ?m steven ?s)
      (included ?m adam ?s)
      (included ?m lori ?s)
    )
    :effect (scheduled ?m ?s)
  )
)