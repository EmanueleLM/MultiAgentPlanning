(define (domain blocks-manipulator)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table stage)

  (:predicates
    ;; direct support relations
    (on ?b - block ?b2 - block)       ; ?b directly on top of block ?b2
    (ontable ?b - block ?t - table)   ; ?b directly on table ?t

    ;; clearance and holding
    (clear ?b - block)                ; ?b has nothing on top and is not being held
    (holding ?b - block)              ; manipulator is holding block ?b
    (handempty)                       ; manipulator's hand is empty

    ;; explicit stage/time progression (discrete, totally ordered)
    (next ?s - stage ?s2 - stage)     ; immediate successor relation between stages
    (at ?s - stage)                   ; current stage marker
  )

  ;; Unstack: remove top block ?x from block ?y (requires ?x really on ?y).
  ;; Enforces single-hand usage and stage successor ordering.
  (:action manipulator-unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
                    (on ?x ?y)
                    (clear ?x)
                    (handempty)
                    (at ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              ;; ?x is now held
              (holding ?x)
              ;; ?x is no longer on ?y
              (not (on ?x ?y))
              ;; ?x is not clear while held
              (not (clear ?x))
              ;; lower block ?y becomes clear (no block on top)
              (clear ?y)
              ;; hand is now occupied
              (not (handempty))
              ;; advance stage marker
              (not (at ?s))
              (at ?s2)
            )
  )

  ;; Stack: place held block ?x onto clear block ?y.
  (:action manipulator-stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
                    (holding ?x)
                    (clear ?y)
                    (at ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              ;; ?x is now on ?y
              (on ?x ?y)
              ;; ?x becomes clear (topmost) after stacking
              (clear ?x)
              ;; ?y is no longer clear (has ?x on top)
              (not (clear ?y))
              ;; stop holding ?x, free the hand
              (not (holding ?x))
              (handempty)
              ;; advance stage marker
              (not (at ?s))
              (at ?s2)
            )
  )

  ;; Pickup: pick a clear block ?x from table ?t.
  (:action manipulator-pickup
    :parameters (?x - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
                    (ontable ?x ?t)
                    (clear ?x)
                    (handempty)
                    (at ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              ;; ?x is now held
              (holding ?x)
              ;; remove table support
              (not (ontable ?x ?t))
              ;; block while held is not clear
              (not (clear ?x))
              ;; hand becomes occupied
              (not (handempty))
              ;; advance stage marker
              (not (at ?s))
              (at ?s2)
            )
  )

  ;; Putdown: put the held block ?x onto table ?t.
  (:action manipulator-putdown
    :parameters (?x - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
                    (holding ?x)
                    (at ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              ;; place on table
              (ontable ?x ?t)
              ;; topmost block on table is clear
              (clear ?x)
              ;; stop holding ?x, free the hand
              (not (holding ?x))
              (handempty)
              ;; advance stage marker
              (not (at ?s))
              (at ?s2)
            )
  )
)