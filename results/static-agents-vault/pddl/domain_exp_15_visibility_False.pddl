(define (domain vault-orchestrated-domain)
  (:requirements :typing :strips :equality)

  (:types
    robot
    door
    object
  )

  (:predicates
    (closed ?d - door)
    (open ?d - door)
    (entrance_small ?d - door)
    (robot_at ?r - robot ?d - door)
    (big ?r - robot)
    (small ?r - robot)
    (has-key ?r - robot)
    (object_at ?o - object ?d - door)
    (object_in_hand ?r - robot ?o - object)
  )

  (:action open-vault
    :parameters (?r - robot ?d - door)
    :precondition (and
                    (closed ?d)
                    (entrance_small ?d)
                    (has-key ?r)
                    (robot_at ?r ?d))
    :effect (and
              (open ?d)
              (not (closed ?d))) )

  (:action enter-and-grab
    :parameters (?r - robot ?d - door ?o - object)
    :precondition (and
                    (robot_at ?r ?d)
                    (open ?d)
                    (object_at ?o ?d)
                    (small ?r))
    :effect (and
              (object_in_hand ?r ?o)
              (not (object_at ?o ?d))) )
)