(define (domain integrated-vault-task)
  (:requirements :strips :typing)
  (:types robot vault key object tool)

  (:predicates
    (robot_at ?r - robot ?loc - vault)
    (vault_closed ?v - vault)
    (vault_open ?v - vault)
    (has_key ?r - robot)
    (object_grabbed ?o - object)
    (object_inside ?v - vault)
    (has_small_robot)
    (small_robot_available)
    (object_retrieved)
  )

  ; Agent 1's Actions
  (:action use-small-robot
    :precondition (and (has-small-robot) (vault_closed ?v))
    :effect (and (vault_open ?v) (not (vault_closed ?v)) (object_inside ?v))
  )

  (:action retrieve-object
    :precondition (and (vault_open ?v) (object_inside ?v))
    :effect (and (object_retrieved) (not (object_inside ?v)))
  )

  ; Agent 2's Actions
  (:action find_key
    :parameters (?r - robot)
    :precondition ()
    :effect (has_key ?r)
  )

  (:action open_vault
    :parameters (?r - robot ?v - vault)
    :precondition (and (robot_at ?r ?v) (has_key ?r) (vault_closed ?v))
    :effect (and (not (vault_closed ?v)) (vault_open ?v))
  )

  (:action grab_object
    :parameters (?r - robot ?o - object ?v - vault)
    :precondition (and (robot_at ?r ?v) (vault_open ?v))
    :effect (object_grabbed ?o)
  )
)