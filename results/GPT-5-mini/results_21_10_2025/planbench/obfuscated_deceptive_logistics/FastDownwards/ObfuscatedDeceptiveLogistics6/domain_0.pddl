(define (domain office_tasks)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent object location)

  (:predicates
    (at ?o - object ?l - location)           ; object o is at location l
    (at-agent ?a - agent ?l - location)      ; agent a is at location l
    (has ?a - agent ?o - object)             ; agent a has object o
    (clipped ?o - object)                    ; object o (paper) is clipped
    (drunk ?a - agent)                       ; agent a has drunk a cup
    (memory-known ?a - agent)                ; agent a has recalled/recorded memory
    (tight ?a - agent)                       ; agent a is tightfisted (won't give away)
    (small ?o - object)                      ; object is small (can be picked up with paltry)
    (cup-object ?o - object)                 ; object is a cup (can be sipped)
    (paper-object ?o - object)               ; object is a paper (can be clipped)
    (clipper-object ?o - object)             ; object is a clipper (used to clip)
  )

  ; paltry: pick up a small object at the agent's location
  (:action paltry
    :parameters (?ag - agent ?o - object ?l - location)
    :precondition (and (at ?o ?l) (at-agent ?ag ?l) (small ?o))
    :effect (and (has ?ag ?o) (not (at ?o ?l)))
  )

  ; sip: agent drinks a cup they are holding
  (:action sip
    :parameters (?ag - agent ?cup - object ?l - location)
    :precondition (and (has ?ag ?cup) (at-agent ?ag ?l) (cup-object ?cup))
    :effect (and (drunk ?ag) (not (has ?ag ?cup)))
  )

  ; clip: use a clipper and a paper in the agent's possession to clip the paper
  (:action clip
    :parameters (?ag - agent ?paper - object ?clipper - object)
    :precondition (and (has ?ag ?paper) (has ?ag ?clipper)
                       (paper-object ?paper) (clipper-object ?clipper))
    :effect (clipped ?paper)
  )

  ; wretched: discard (place) an object from the agent's possession onto the current location
  ; NOTE: forbidden if agent is tightfisted (tight)
  (:action wretched
    :parameters (?ag - agent ?o - object ?l - location)
    :precondition (and (has ?ag ?o) (at-agent ?ag ?l) (not (tight ?ag)))
    :effect (and (not (has ?ag ?o)) (at ?o ?l))
  )

  ; memory: agent records/recalls memory while at a location
  (:action memory
    :parameters (?ag - agent ?l - location)
    :precondition (at-agent ?ag ?l)
    :effect (memory-known ?ag)
  )

  ; tightfisted: agent becomes tightfisted (a hard constraint when present initially)
  (:action tightfisted
    :parameters (?ag - agent)
    :precondition ()
    :effect (tight ?ag)
  )
)