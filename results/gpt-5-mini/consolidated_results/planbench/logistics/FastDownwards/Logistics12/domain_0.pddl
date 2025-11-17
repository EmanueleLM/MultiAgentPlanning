(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent part station phase)

  (:predicates
    (agent ?a - agent)
    (alpha-capable ?a - agent)
    (beta-capable ?a - agent)

    (station ?s - station)
    (at ?a - agent ?s - station)

    (part ?p - part)
    (part-at ?p - part ?s - station)
    (picked ?p - part)
    (placed ?p - part ?s - station)
    (assembled ?p - part)
    (inspected ?p - part)

    (phase ?ph - phase)
    (phase-active ?ph - phase)
    (phase-complete ?ph - phase)
    (phase-next ?p1 - phase ?p2 - phase)

    (part-phase ?p - part ?ph - phase)
  )

  ;; Agent movement (both agents use this; capabilities kept separate)
  (:action alpha-move
    :parameters (?a - agent ?from - station ?to - station)
    :precondition (and (agent ?a) (alpha-capable ?a) (at ?a ?from) (station ?to) (station ?from) (not (= ?from ?to)))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )

  (:action beta-move
    :parameters (?a - agent ?from - station ?to - station)
    :precondition (and (agent ?a) (beta-capable ?a) (at ?a ?from) (station ?to) (station ?from) (not (= ?from ?to)))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )

  ;; Alpha picks a part from the station assigned in the current place-phase
  (:action alpha-pick
    :parameters (?a - agent ?p - part ?s - station ?ph - phase)
    :precondition (and
                    (agent ?a)
                    (alpha-capable ?a)
                    (at ?a ?s)
                    (part ?p)
                    (part-at ?p ?s)
                    (phase-active ?ph)
                    (part-phase ?p ?ph)
                    (not (picked ?p))
                  )
    :effect (and (picked ?p) (not (part-at ?p ?s)))
  )

  ;; Alpha places a previously picked part at the station for the phase
  (:action alpha-place
    :parameters (?a - agent ?p - part ?s - station ?ph - phase)
    :precondition (and
                    (agent ?a)
                    (alpha-capable ?a)
                    (at ?a ?s)
                    (picked ?p)
                    (phase-active ?ph)
                    (part-phase ?p ?ph)
                  )
    :effect (and (placed ?p ?s) (not (picked ?p)))
  )

  ;; Alpha assembles a placed part (assembly phase)
  (:action alpha-assemble
    :parameters (?a - agent ?p - part ?s - station ?ph - phase)
    :precondition (and
                    (agent ?a)
                    (alpha-capable ?a)
                    (at ?a ?s)
                    (placed ?p ?s)
                    (not (assembled ?p))
                    (phase-active ?ph)
                    (part-phase ?p ?ph)
                  )
    :effect (and (assembled ?p) (not (placed ?p ?s)))
  )

  ;; Beta inspects an assembled part (inspection phase)
  (:action beta-inspect
    :parameters (?a - agent ?p - part ?s - station ?ph - phase)
    :precondition (and
                    (agent ?a)
                    (beta-capable ?a)
                    (at ?a ?s)
                    (assembled ?p)
                    (not (inspected ?p))
                    (phase-active ?ph)
                    (part-phase ?p ?ph)
                  )
    :effect (and (inspected ?p))
  )

  ;; Phase completion actions. There are specialized completion actions for
  ;; phases that require verification of specific facts for a small fixed list of parts.
  ;; These are parameterized so they can be used for concrete phase/part tuples in the problem.

  ;; Complete a placement phase that requires two parts to be placed (used for scenario A)
  (:action complete-place-2parts
    :parameters (?ph - phase ?next - phase ?p1 - part ?p2 - part ?s1 - station ?s2 - station)
    :precondition (and
                    (phase-active ?ph)
                    (phase-next ?ph ?next)
                    (placed ?p1 ?s1)
                    (placed ?p2 ?s2)
                    (part-phase ?p1 ?ph)
                    (part-phase ?p2 ?ph)
                  )
    :effect (and (not (phase-active ?ph)) (phase-complete ?ph) (phase-active ?next))
  )

  ;; Complete an assembly phase that requires two parts to be assembled
  (:action complete-assemble-2parts
    :parameters (?ph - phase ?next - phase ?p1 - part ?p2 - part)
    :precondition (and
                    (phase-active ?ph)
                    (phase-next ?ph ?next)
                    (assembled ?p1)
                    (assembled ?p2)
                    (part-phase ?p1 ?ph)
                    (part-phase ?p2 ?ph)
                  )
    :effect (and (not (phase-active ?ph)) (phase-complete ?ph) (phase-active ?next))
  )

  ;; Complete an inspection phase that requires two parts inspected
  (:action complete-inspect-2parts
    :parameters (?ph - phase ?next - phase ?p1 - part ?p2 - part)
    :precondition (and
                    (phase-active ?ph)
                    (phase-next ?ph ?next)
                    (inspected ?p1)
                    (inspected ?p2)
                    (part-phase ?p1 ?ph)
                    (part-phase ?p2 ?ph)
                  )
    :effect (and (not (phase-active ?ph)) (phase-complete ?ph) (phase-active ?next))
  )

  ;; Complete placement phase for a single-part scenario (used for scenario B)
  (:action complete-place-1part
    :parameters (?ph - phase ?next - phase ?p - part ?s - station)
    :precondition (and
                    (phase-active ?ph)
                    (phase-next ?ph ?next)
                    (placed ?p ?s)
                    (part-phase ?p ?ph)
                  )
    :effect (and (not (phase-active ?ph)) (phase-complete ?ph) (phase-active ?next))
  )

  ;; Complete assembly phase for a single-part scenario
  (:action complete-assemble-1part
    :parameters (?ph - phase ?next - phase ?p - part)
    :precondition (and
                    (phase-active ?ph)
                    (phase-next ?ph ?next)
                    (assembled ?p)
                    (part-phase ?p ?ph)
                  )
    :effect (and (not (phase-active ?ph)) (phase-complete ?ph) (phase-active ?next))
  )

  ;; Complete inspection phase for a single-part scenario
  (:action complete-inspect-1part
    :parameters (?ph - phase ?next - phase ?p - part)
    :precondition (and
                    (phase-active ?ph)
                    (phase-next ?ph ?next)
                    (inspected ?p)
                    (part-phase ?p ?ph)
                  )
    :effect (and (not (phase-active ?ph)) (phase-complete ?ph) (phase-active ?next))
  )

)