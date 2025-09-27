(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types agent person - agent slot)
  (:constants
    ronald stephen brittany dorothy rebecca jordan - person
    orchestrator - agent
  )
  (:predicates
    (available ?p - person ?s - slot)
    (attended ?p - person ?s - slot)
    (meeting-scheduled)
    (scheduled ?s - slot)
  )

  (:action attend-ronald
    :parameters (?s - slot)
    :precondition (available ronald ?s)
    :effect (attended ronald ?s)
  )

  (:action attend-stephen
    :parameters (?s - slot)
    :precondition (available stephen ?s)
    :effect (attended stephen ?s)
  )

  (:action attend-brittany
    :parameters (?s - slot)
    :precondition (available brittany ?s)
    :effect (attended brittany ?s)
  )

  (:action attend-dorothy
    :parameters (?s - slot)
    :precondition (available dorothy ?s)
    :effect (attended dorothy ?s)
  )

  (:action attend-rebecca
    :parameters (?s - slot)
    :precondition (available rebecca ?s)
    :effect (attended rebecca ?s)
  )

  (:action attend-jordan
    :parameters (?s - slot)
    :precondition (available jordan ?s)
    :effect (attended jordan ?s)
  )

  (:action finalize-by-orchestrator
    :parameters (?s - slot)
    :precondition (and
                    (not (meeting-scheduled))
                    (attended ronald ?s)
                    (attended stephen ?s)
                    (attended brittany ?s)
                    (attended dorothy ?s)
                    (attended rebecca ?s)
                    (attended jordan ?s))
    :effect (and (meeting-scheduled) (scheduled ?s))
  )
)