(define (domain blocks-manipulator)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table place stage)
  ;; blocks and table are both places (so second argument of on can be either)
  ;; define block and table as subtypes of place
  ;; PDDL subtype declaration: "block table - place" below
  (:types block table - place stage)

  (:predicates
    (on ?b - block ?p - place)    ; block ?b is directly on place ?p (block or table)
    (clear ?b - block)            ; block has nothing on top and is not being held
    (holding ?b - block)          ; manipulator is holding block ?b
    (handempty)                   ; manipulator's hand is empty
    (next ?s - stage ?s2 - stage) ; successor relation between stages
    (at ?s - stage)               ; current stage marker
  )

  ;; Unstack action: remove top block ?x from block ?y, advance stage
  (:action unstack
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
  (:action stack
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
  (:action pickup
    :parameters (?x - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
                    (on ?x ?t)
                    (clear ?x)
                    (handempty)
                    (at ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (holding ?x)
              (not (on ?x ?t))
              (not (clear ?x))
              (not (handempty))
              (not (at ?s))
              (at ?s2)
            )
  )

  ;; Putdown action to the table: put held block ?x onto table ?t, advance stage
  (:action putdown
    :parameters (?x - block ?t - table ?s - stage ?s2 - stage)
    :precondition (and
                    (holding ?x)
                    (at ?s)
                    (next ?s ?s2)
                  )
    :effect (and
              (on ?x ?t)
              (clear ?x)
              (not (holding ?x))
              (handempty)
              (not (at ?s))
              (at ?s2)
            )
  )
)