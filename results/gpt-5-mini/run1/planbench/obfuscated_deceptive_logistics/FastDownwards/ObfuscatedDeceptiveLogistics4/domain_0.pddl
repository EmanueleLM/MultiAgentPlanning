(define (domain sequence-assembly)
  (:requirements :strips :typing :negative-preconditions)
  (:types object agent phase)

  (:predicates
    (next ?a - object ?b - object)               ; final adjacent relation: a is immediately before b
    (proposed ?a - object ?b - object)           ; planner proposed linking a -> b
    (sensed ?a - object ?b - object)             ; sensor confirmed a -> b observation
    (locked ?a - object ?b - object)             ; auditor locked/finalized a -> b
    (free-successor ?a - object)                 ; a currently has no successor assigned/locked
    (free-predecessor ?a - object)               ; a currently has no predecessor assigned/locked
    (at-phase ?p - phase)                        ; current global phase marker
    (planner-ready ?ag - agent)                  ; planner agent ready to act
    (sensor-ready ?ag - agent)                   ; sensor agent ready to act
    (auditor-ready ?ag - agent)                  ; auditor agent ready to act
  )

  ;; Planner: proposes a candidate immediate-next relation.
  ;; Must act only in the planning phase; proposal moves global phase to sensing.
  (:action planner-propose
    :parameters (?pl - agent ?x - object ?y - object)
    :precondition (and
      (planner-ready ?pl)
      (at-phase planning)
      (free-successor ?x)
      (free-predecessor ?y)
      (not (proposed ?x ?y))
      (not (sensed ?x ?y))
      (not (locked ?x ?y))
    )
    :effect (and
      (proposed ?x ?y)
      (not (at-phase planning))
      (at-phase sensing)
    )
  )

  ;; Sensor: inspects and confirms a proposed candidate.
  ;; Requires planned proposal and sensing phase; moves to auditing.
  (:action sensor-confirm
    :parameters (?sen - agent ?x - object ?y - object)
    :precondition (and
      (sensor-ready ?sen)
      (at-phase sensing)
      (proposed ?x ?y)
      (not (sensed ?x ?y))
      (not (locked ?x ?y))
    )
    :effect (and
      (sensed ?x ?y)
      (not (proposed ?x ?y))
      (not (at-phase sensing))
      (at-phase auditing)
    )
  )

  ;; Auditor: finalizes (locks) a sensed candidate into the definitive next relation.
  ;; Must be in auditing phase, requires sensor confirmation, and ensures neither endpoint already locked.
  ;; Creates next and locked facts and marks successor/predecessor as no longer free.
  (:action auditor-lock
    :parameters (?aud - agent ?x - object ?y - object)
    :precondition (and
      (auditor-ready ?aud)
      (at-phase auditing)
      (sensed ?x ?y)
      (free-successor ?x)
      (free-predecessor ?y)
      (not (locked ?x ?y))
    )
    :effect (and
      (next ?x ?y)
      (locked ?x ?y)
      (not (sensed ?x ?y))
      (not (free-successor ?x))
      (not (free-predecessor ?y))
      (not (at-phase auditing))
      (at-phase planning)
    )
  )
)