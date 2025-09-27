(define (domain meeting-schedule)
  (:requirements :strips :typing)
  (:types agent slot)
  (:predicates
    (free ?a - agent ?s - slot)
    (attended ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
    (not-scheduled)
  )

  (:action attend-karen
    :parameters (?s - slot)
    :precondition (free karen ?s)
    :effect (and (attended karen ?s) (not (free karen ?s)))
  )

  (:action attend-brandon
    :parameters (?s - slot)
    :precondition (free brandon ?s)
    :effect (and (attended brandon ?s) (not (free brandon ?s)))
  )

  (:action attend-donald
    :parameters (?s - slot)
    :precondition (free donald ?s)
    :effect (and (attended donald ?s) (not (free donald ?s)))
  )

  (:action attend-kelly
    :parameters (?s - slot)
    :precondition (free kelly ?s)
    :effect (and (attended kelly ?s) (not (free kelly ?s)))
  )

  (:action confirm-meeting
    :parameters (?s - slot)
    :precondition (and
      (attended karen ?s)
      (attended brandon ?s)
      (attended donald ?s)
      (attended kelly ?s)
      (not-scheduled)
    )
    :effect (and (meeting-scheduled ?s) (not (not-scheduled)))
  )
)