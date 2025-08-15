(define (domain truckdriver)
  (:requirements :typing :strips :adl :negative-preconditions :equality)
  (:types vehicle person item location)

  (:predicates
    (at ?x - (either vehicle person item) ?l - location)   ; where an object is
    (in ?i - item ?v - vehicle)                            ; item is inside a vehicle
    (adjacent ?l1 - location ?l2 - location)               ; travel connectivity
  )

  ;------------------
  ; Actions
  ;------------------
  (:action move
    :parameters (?v - vehicle ?from - location ?to - location)
    :precondition (and
                     (at ?v ?from)
                     (adjacent ?from ?to))
    :effect (and
               (not (at ?v ?from))
               (at ?v ?to))
  )

  (:action load
    :parameters (?v - vehicle ?i - item ?l - location)
    :precondition (and
                     (at ?v ?l)
                     (at ?i ?l))
    :effect (and
               (not (at ?i ?l))
               (in ?i ?v))
  )

  (:action unload
    :parameters (?v - vehicle ?i - item ?l - location)
    :precondition (and
                     (in ?i ?v)
                     (at ?v ?l))
    :effect (and
               (not (in ?i ?v))
               (at ?i ?l))
  )
)