(define (domain schedule-meeting)
  (:requirements :strips :typing)
  (:types agent slot)
  (:constants karen brandon donald kelly - agent)

  (:predicates
    (free ?a - agent ?s - slot)
    (attends ?a - agent ?s - slot)
    (scheduled ?s - slot)
  )

  (:action attend-karen
    :parameters (?s - slot)
    :precondition (free karen ?s)
    :effect (attends karen ?s)
  )

  (:action attend-brandon
    :parameters (?s - slot)
    :precondition (free brandon ?s)
    :effect (attends brandon ?s)
  )

  (:action attend-donald
    :parameters (?s - slot)
    :precondition (free donald ?s)
    :effect (attends donald ?s)
  )

  (:action attend-kelly
    :parameters (?s - slot)
    :precondition (free kelly ?s)
    :effect (attends kelly ?s)
  )

  (:action finalize
    :parameters (?s - slot)
    :precondition (and
                    (attends karen ?s)
                    (attends brandon ?s)
                    (attends donald ?s)
                    (attends kelly ?s)
                  )
    :effect (scheduled ?s)
  )
)