(define (domain multiagent-mapping)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  ; Predicates
  (:predicates
    (next ?a - obj ?b - obj)           ; adjacency / successor relation
    (has-successor ?a - obj)           ; true if ?a already has at least one successor
    (has-predecessor ?a - obj)         ; true if ?a already has at least one predecessor
    (remembered ?a - obj)              ; marker set by the memory action (semantic distinction)
  )

  ; Action: paltry
  ; Establishes a next relation but only when source has no successor and target has no predecessor.
  (:action paltry
    :parameters (?x - obj ?y - obj)
    :precondition (and
                    (not (has-successor ?x))
                    (not (has-predecessor ?y))
                    (not (next ?x ?y))
                  )
    :effect (and
              (next ?x ?y)
              (has-successor ?x)
              (has-predecessor ?y)
            )
  )

  ; Action: sip
  ; Establishes a next relation when the target has no predecessor (allows source to have other successors).
  (:action sip
    :parameters (?x - obj ?y - obj)
    :precondition (and
                    (not (has-predecessor ?y))
                    (not (next ?x ?y))
                  )
    :effect (and
              (next ?x ?y)
              (has-successor ?x)
              (has-predecessor ?y)
            )
  )

  ; Action: clip
  ; Establishes a next relation when the source has no successor (allows target to have other predecessors).
  (:action clip
    :parameters (?x - obj ?y - obj)
    :precondition (and
                    (not (has-successor ?x))
                    (not (next ?x ?y))
                  )
    :effect (and
              (next ?x ?y)
              (has-successor ?x)
              (has-predecessor ?y)
            )
  )

  ; Action: wretched
  ; Establishes a next relation with minimal restrictions (only prevents duplicate next links).
  ; This action permits multiple successors for a source and multiple predecessors for a target.
  (:action wretched
    :parameters (?x - obj ?y - obj)
    :precondition (and
                    (not (next ?x ?y))
                  )
    :effect (and
              (next ?x ?y)
              (has-successor ?x)
              (has-predecessor ?y)
            )
  )

  ; Action: memory
  ; Like paltry (requires source free and target free) but records a memory mark for the source.
  (:action memory
    :parameters (?x - obj ?y - obj)
    :precondition (and
                    (not (has-successor ?x))
                    (not (has-predecessor ?y))
                    (not (next ?x ?y))
                  )
    :effect (and
              (next ?x ?y)
              (has-successor ?x)
              (has-predecessor ?y)
              (remembered ?x)
            )
  )

  ; Action: tightfisted
  ; Strict action that requires both source and target be free, same effect as paltry but kept distinct.
  (:action tightfisted
    :parameters (?x - obj ?y - obj)
    :precondition (and
                    (not (has-successor ?x))
                    (not (has-predecessor ?y))
                    (not (next ?x ?y))
                  )
    :effect (and
              (next ?x ?y)
              (has-successor ?x)
              (has-predecessor ?y)
            )
  )
)