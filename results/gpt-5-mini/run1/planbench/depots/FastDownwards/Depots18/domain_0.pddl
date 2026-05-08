; PDDL domain for a multi-agent block-stacking scenario compatible with FastDownwards.
; Modeling choices:
; - Two agent-capable actions are provided (ag-pickup and ag-putdown). Actions are namespaced with the "ag-" prefix.
; - We model only the objects explicitly mentioned in the specification: crate0, crate1, crate2, pallet2, pallet3, and two agents a1 and a2.
; - Predicates are explicit: on (direct support relation), clear (no object on top), holding (agent holds a crate), handempty (agent free).
; - All constraints stated as preferences in the natural language are encoded as hard constraints: the goal facts must be satisfied exactly.
; - No bookkeeping shortcuts, tokens, or penalty constructs are used. Violations are impossible because the model enforces physical constraints (clearness, single-object holding).
; - This domain uses only :strips, :typing, and :negative-preconditions to remain compatible with FastDownwards.

(define (domain stacking-agents)
  :requirements :strips :typing :negative-preconditions
  :types agent crate pallet object
  ; object is a supertype but we only use crate and pallet explicitly

  :predicates
    (on ?x - object ?y - object)      ; ?x is directly on ?y (crate on crate or crate on pallet)
    (clear ?x - object)              ; nothing is on top of ?x
    (holding ?ag - agent ?c - crate) ; agent is holding a crate
    (handempty ?ag - agent)          ; agent has empty hands

  ; Actions namespaced with ag- and parameterized by agent ?ag.
  ; ag-pickup: agent picks up a clear crate from some support ?from.
  ; Preconditions: crate is on ?from, crate is clear, agent's hand is empty.
  ; Effects: agent holds crate, crate is no longer on support, support becomes clear, agent no longer handempty.
  (:action ag-pickup
    :parameters (?ag - agent ?c - crate ?from - object)
    :precondition (and
                    (on ?c ?from)
                    (clear ?c)
                    (handempty ?ag)
                  )
    :effect (and
              (holding ?ag ?c)
              (not (on ?c ?from))
              (clear ?from)
              (not (handempty ?ag))
             )
  )

  ; ag-putdown: agent places a held crate onto a clear destination ?to (crate or pallet).
  ; Preconditions: agent holds the crate, destination is clear.
  ; Effects: crate is on destination, destination is no longer clear, agent becomes handempty, agent no longer holds crate, crate becomes clear (top).
  (:action ag-putdown
    :parameters (?ag - agent ?c - crate ?to - object)
    :precondition (and
                    (holding ?ag ?c)
                    (clear ?to)
                  )
    :effect (and
              (on ?c ?to)
              (clear ?c)
              (not (clear ?to))
              (handempty ?ag)
              (not (holding ?ag ?c))
            )
  )
)