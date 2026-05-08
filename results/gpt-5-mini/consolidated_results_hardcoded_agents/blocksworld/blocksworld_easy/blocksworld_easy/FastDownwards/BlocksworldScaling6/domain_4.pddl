(define (domain blocks-manipulator)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table stage)

  (:predicates
    (on ?b - block ?b2 - block)       ; ?b directly on top of block ?b2
    (ontable ?b - block ?t - table)   ; ?b directly on table ?t
    (clear ?b - block)                ; ?b has nothing on top and is not being held
    (holding ?b - block)              ; manipulator is holding block ?b
    (handempty)                       ; manipulator's hand is empty
    (next ?s - stage ?s2 - stage)     ; successor relation between stages
    (at ?s - stage)                   ; current stage marker
  )

  ;;; Actions implemented by the manipulator agent
  ;; Unstack action: remove top block ?x from block ?y, advance stage
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
              (holding ?x)
              (clear ?y)
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handempty))
              (not (at ?s))
              (at ?s2)
            )
  )

  ;; Stack action: place held block ?x onto block ?y, advance stage
  (:action manipulator-stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and
                    (holding ?x)
                    (clear ?y)
                    (at ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (not (clear ?y))
              (not (holding ?x))
              (handempty)
              (not (at ?s))
              (at ?s2)
            )
  )

  ;; Pickup action from the table: pick block ?x that is on a table, advance stage
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
              (holding ?x)
              (not (ontable ?x ?t))
              (not (clear ?x))
              (not (handempty))
              (not (at ?s))
              (at ?s2)
            )
  )

  ;; Putdown action to the table: put held block ?x onto table ?t, advance stage
  (:action manipulator-putdown
    :parameters (?x - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
                    (holding ?x)
                    (at ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (ontable ?x ?t)
              (clear ?x)
              (not (holding ?x))
              (handempty)
              (not (at ?s))
              (at ?s2)
            )
  )
)