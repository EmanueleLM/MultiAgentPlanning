(define (domain blocks)
  (:requirements :strips :typing)

  (:types block)

  ;; "table" is a special block that represents the surface.
  (:constants table - block)

  ;; ------------------------------------------------------------------
  ;; Predicates
  (:predicates
    ;;  on  X  Y   : block X is directly on block Y (Y can be "table")
    ;;  clear X   : nothing is on top of X
    ;;  holding X : the agent is holding X
    ;;  handempty : the agent’s hand contains nothing
    (on ?x - block ?y - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ;; ------------------------------------------------------------------
  ;; Actions

  ;; 1 – PICK‑UP  (take a block that is on the table)
  (:action pickup
    :parameters (?x - block)
    :precondition (and
                   (handempty)
                   (on ?x table)
                   (clear ?x))
    :effect (and
             (not (handempty))
             (holding ?x)
             (not (on ?x table)))

    ;;   (clear ?x) stays true – nothing is above the block
  )

  ;; 2 – PUT‑DOWN  (put the currently held block onto the table)
  (:action putdown
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
             (handempty)
             (not (holding ?x))
             (on ?x table)
             (clear ?x))
  )

  ;; 3 – STACK    (place the held block on top of a clear block)
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and
                   (holding ?x)
                   (clear ?y))
    :effect (and
             (handempty)
             (not (holding ?x))
             (on ?x ?y)
             (clear ?x)        ; X is still clear – nothing above it
             (not (clear ?y))) ; Y is no longer clear
  )

  ;; 4 – UNSTACK  (pick up a clear block that is on top of some other block)
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and
                   (handempty)
                   (clear ?x)
                   (on ?x ?y))
    :effect (and
             (holding ?x)
             (not (on ?x ?y))
             (clear ?y)        ; Y becomes clear after X is removed
             (not (clear ?x))) ; X is not clear while held
  )

)