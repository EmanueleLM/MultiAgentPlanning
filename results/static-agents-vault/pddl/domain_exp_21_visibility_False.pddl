(define (domain vault-robots)
  (:requirements :typing :strips)

  (:types robot vault key object - item)

  (:predicates
    (closed ?v - vault)
    (open ?v - vault)
    (have-key ?r - robot ?k - key)
    (adjacent ?r - robot ?v - vault)
    (in-robot ?r - robot ?v - vault)
    (has-object ?r - robot)
    (big ?r - robot)
    (small ?r - robot)
    (cannot-grab ?r - robot))

  (:action open-vault
    :parameters (?r - robot ?v - vault ?k - key)
    :precondition (and
                    (big ?r)
                    (small ?v)
                    (adjacent ?r ?v)
                    (closed ?v)
                    (have-key ?r ?k))
    :effect (and
              (not (closed ?v))
              (open ?v)))

  (:action obtain-key
    :parameters (?r - robot ?k - key)
    :precondition (small ?r)
    :effect (have-key ?r ?k))

  (:action enter-vault
    :parameters (?r - robot ?v - vault)
    :precondition (and
                    (adjacent ?r ?v)
                    (open ?v))
    :effect (in-robot ?r ?v))

  (:action grab-object
    :parameters (?r - robot)
    :precondition (and
                    (in-robot ?r vault)
                    (not (cannot-grab ?r)))
    :effect (has-object ?r)))