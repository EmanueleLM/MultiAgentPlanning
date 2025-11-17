(define (domain assembly)
  (:requirements :strips :typing :negative-preconditions)
  (:types object agent operator assistant location step)

  (:predicates
    ;; object/location relations
    (at ?o - object ?l - location)
    ;; agent/location relation
    (at-agent ?ag - agent ?l - location)
    ;; agent holding an object
    (holding ?ag - agent ?o - object)
    ;; whether agent is free to pick another object
    (free ?ag - agent)
    ;; link relation required by goals
    (next ?o1 - object ?o2 - object)
    ;; helper predicate set when objects are prepared to be linked
    (ready-to-link ?o1 - object ?o2 - object)
    ;; single current step marker to enforce ordering
    (current-step ?s - step)
    ;; successor relation for steps (static)
    (step-succ ?s1 - step ?s2 - step)
  )

  ;; Operator picks an object when co-located, consumes the current step and advances to the successor step.
  (:action pick-op
    :parameters (?op - operator ?o - object ?loc - location ?s - step ?ns - step)
    :precondition (and
      (at ?o ?loc)
      (at-agent ?op ?loc)
      (free ?op)
      (current-step ?s)
      (step-succ ?s ?ns)
    )
    :effect (and
      (holding ?op ?o)
      (not (at ?o ?loc))
      (not (free ?op))
      (not (current-step ?s))
      (current-step ?ns)
    )
  )

  ;; Assistant picks an object when co-located, consumes the current step and advances.
  (:action pick-asst
    :parameters (?as - assistant ?o - object ?loc - location ?s - step ?ns - step)
    :precondition (and
      (at ?o ?loc)
      (at-agent ?as ?loc)
      (free ?as)
      (current-step ?s)
      (step-succ ?s ?ns)
    )
    :effect (and
      (holding ?as ?o)
      (not (at ?o ?loc))
      (not (free ?as))
      (not (current-step ?s))
      (current-step ?ns)
    )
  )

  ;; Move an agent while holding an object from one location to another, advances the step.
  (:action move-with-op
    :parameters (?op - operator ?o - object ?from - location ?to - location ?s - step ?ns - step)
    :precondition (and
      (holding ?op ?o)
      (at-agent ?op ?from)
      (current-step ?s)
      (step-succ ?s ?ns)
    )
    :effect (and
      (not (at-agent ?op ?from))
      (at-agent ?op ?to)
      (not (current-step ?s))
      (current-step ?ns)
    )
  )

  (:action move-with-asst
    :parameters (?as - assistant ?o - object ?from - location ?to - location ?s - step ?ns - step)
    :precondition (and
      (holding ?as ?o)
      (at-agent ?as ?from)
      (current-step ?s)
      (step-succ ?s ?ns)
    )
    :effect (and
      (not (at-agent ?as ?from))
      (at-agent ?as ?to)
      (not (current-step ?s))
      (current-step ?ns)
    )
  )

  ;; Place an object: agent must be holding it and be at the placement location; agent becomes free again.
  (:action place-op
    :parameters (?op - operator ?o - object ?loc - location ?s - step ?ns - step)
    :precondition (and
      (holding ?op ?o)
      (at-agent ?op ?loc)
      (current-step ?s)
      (step-succ ?s ?ns)
    )
    :effect (and
      (at ?o ?loc)
      (free ?op)
      (not (holding ?op ?o))
      (not (current-step ?s))
      (current-step ?ns)
    )
  )

  (:action place-asst
    :parameters (?as - assistant ?o - object ?loc - location ?s - step ?ns - step)
    :precondition (and
      (holding ?as ?o)
      (at-agent ?as ?loc)
      (current-step ?s)
      (step-succ ?s ?ns)
    )
    :effect (and
      (at ?o ?loc)
      (free ?as)
      (not (holding ?as ?o))
      (not (current-step ?s))
      (current-step ?ns)
    )
  )

  ;; Prepare two co-located objects for linking; requires them to be placed at the same location.
  ;; This prevents a bookkeeping shortcut that would allow creating 'next' without physical placement.
  (:action prepare-link
    :parameters (?op - operator ?o1 - object ?o2 - object ?loc - location ?s - step ?ns - step)
    :precondition (and
      (at ?o1 ?loc)
      (at ?o2 ?loc)
      (current-step ?s)
      (step-succ ?s ?ns)
    )
    :effect (and
      (ready-to-link ?o1 ?o2)
      (not (current-step ?s))
      (current-step ?ns)
    )
  )

  ;; Link two objects producing the 'next' relation. Requires explicit preparation and operator participation.
  (:action link-objects
    :parameters (?op - operator ?o1 - object ?o2 - object ?s - step ?ns - step)
    :precondition (and
      (ready-to-link ?o1 ?o2)
      (current-step ?s)
      (step-succ ?s ?ns)
      (at-agent ?op ?loc) ;; ensure operator present somewhere; prevents remote-link shortcuts
    )
    :effect (and
      (next ?o1 ?o2)
      (not (ready-to-link ?o1 ?o2))
      (not (current-step ?s))
      (current-step ?ns)
    )
  )
)