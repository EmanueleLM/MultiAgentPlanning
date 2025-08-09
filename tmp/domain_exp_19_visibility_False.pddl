(define (domain vault-cooperation)
  (:requirements :typing :strips)
  (:types robot vault key item)
  (:predicates
    (big ?r - robot)
    (small ?r - robot)
    (closed ?v - vault)
    (open ?v - vault)
    (entrance_small ?v - vault)
    (fit ?r - robot ?v - vault)
    (has ?r - robot ?i - key)
    (has ?r - robot ?o - item)
    (in_item ?o - item ?v - vault)
    (in_robot ?r - robot ?v - vault)
  )
  (:action open-vault
    :parameters (?r - robot ?v - vault ?k - key)
    :precondition (and
                    (closed ?v)
                    (has ?r ?k))
    :effect (and
              (open ?v)
              (not (closed ?v))) )
  (:action enter-vault
    :parameters (?r - robot ?v - vault)
    :precondition (and
                    (open ?v)
                    (fit ?r ?v)
                    (not (in_robot ?r ?v)))
    :effect (in_robot ?r ?v) )
  (:action grab
    :parameters (?r - robot ?v - vault ?o - item)
    :precondition (and
                    (in_robot ?r ?v)
                    (in_item ?o ?v)
                    (not (has ?r ?o)))
    :effect (and
              (has ?r ?o)
              (not (in_item ?o ?v))) )
)