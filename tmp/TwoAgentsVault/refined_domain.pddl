(define (domain integrated-vault-task)
  (:requirements :strips :typing)
  (:types robot vault key object)

  (:predicates
    (robot_at ?r - robot ?loc - vault)
    (vault_closed ?v - vault)
    (vault_open ?v - vault)
    (has_key ?r - robot)
    (object_grabbed ?o - object)
    (object_inside ?v - vault)
    (object_retrieved)
    (robot_can_enter ?r - robot ?v - vault)
  )

  (:action find_key
    :parameters (?r - robot)
    :precondition ()
    :effect (has_key ?r)
  )

  (:action open_vault
    :parameters (?r - robot ?v - vault)
    :precondition (and (robot_at ?r ?v) (has_key ?r) (vault_closed ?v) (robot_can_enter ?r ?v))
    :effect (and (not (vault_closed ?v)) (vault_open ?v))
  )

  (:action grab_object
    :parameters (?r - robot ?o - object ?v - vault)
    :precondition (and (robot_at ?r ?v) (vault_open ?v))
    :effect (and (object_grabbed ?o) (not (object_inside ?v)))
  )
  
  (:action retrieve_object
    :parameters (?o - object)
    :precondition (object_grabbed ?o)
    :effect (object_retrieved)
  )
)