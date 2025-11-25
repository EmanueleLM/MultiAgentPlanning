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

  ;; Unstack action executed by the manipulator: remove top block ?x from block ?y.
  ;; Preconditions enforce single-hand and clearance; stage progression enforced by (at ?s) and (next ?s ?s2).
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

  ;; Stack action executed by the manipulator: place held block ?x onto clear block ?y.
  ;; Preconditions require the manipulator to be holding ?x and target ?y to be clear.
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

  ;; Pickup action executed by the manipulator: pick a clear block ?x from table ?t.
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

  ;; Putdown action executed by the manipulator: put the held block ?x onto table ?t.
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