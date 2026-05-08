(define (domain multiagent-assembly)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent station part phase)

  (:predicates
    (at ?ag - agent ?s - station)
    (part_at ?p - part ?s - station)
    (has ?ag - agent ?p - part)
    (assembled ?p - part)
    (inspected ?p - part)
    (phase_active ?ph - phase)
    (next ?ph1 - phase ?ph2 - phase)
    (assembly_station ?s - station)
    (inspection_station ?s - station)
  )

  ; Agent A: movement
  (:action agentA_move
    :parameters (?ag - agent ?from - station ?to - station)
    :precondition (at ?ag ?from)
    :effect (and (not (at ?ag ?from)) (at ?ag ?to))
  )

  ; Agent B: movement
  (:action agentB_move
    :parameters (?ag - agent ?from - station ?to - station)
    :precondition (at ?ag ?from)
    :effect (and (not (at ?ag ?from)) (at ?ag ?to))
  )

  ; Agent A: pick a part from a storage station
  (:action agentA_pick
    :parameters (?ag - agent ?p - part ?s - station)
    :precondition (and (at ?ag ?s) (part_at ?p ?s) (not (has ?ag ?p)))
    :effect (and (has ?ag ?p) (not (part_at ?p ?s)))
  )

  ; Agent A: assemble a part at an assembly station; allowed only during an active assembly phase
  (:action agentA_assemble
    :parameters (?ag - agent ?p - part ?s - station ?ph - phase)
    :precondition (and (at ?ag ?s) (has ?ag ?p) (assembly_station ?s) (phase_active ?ph))
    :effect (and (assembled ?p) (not (has ?ag ?p)))
  )

  ; Agent A: activate the next phase (e.g., phase2) after required assemblies are complete.
  ; This action enforces that assembly(s) must be done before the next phase becomes active.
  (:action agentA_activate_next_phase
    :parameters (?ag - agent ?from - phase ?to - phase ?p - part)
    :precondition (and (at ?ag base) (phase_active ?from) (next ?from ?to) (assembled ?p))
    :effect (and (phase_active ?to) (not (phase_active ?from)))
  )

  ; Agent B: inspect a part at an inspection station; requires that the part is assembled and the inspection phase is active.
  (:action agentB_inspect
    :parameters (?ag - agent ?p - part ?s - station ?ph - phase)
    :precondition (and (at ?ag ?s) (inspection_station ?s) (assembled ?p) (phase_active ?ph) (not (inspected ?p)))
    :effect (inspected ?p)
  )
)